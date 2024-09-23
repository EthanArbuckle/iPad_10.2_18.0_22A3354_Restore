@implementation _SFPBSuggestionCardSection

- (_SFPBSuggestionCardSection)initWithFacade:(id)a3
{
  id v4;
  _SFPBSuggestionCardSection *v5;
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
  _SFPBRichText *v25;
  void *v26;
  _SFPBRichText *v27;
  void *v28;
  void *v29;
  void *v30;
  _SFPBRichText *v31;
  void *v32;
  _SFPBRichText *v33;
  void *v34;
  _SFPBImage *v35;
  void *v36;
  _SFPBImage *v37;
  void *v38;
  _SFPBFormattedText *v39;
  void *v40;
  _SFPBFormattedText *v41;
  void *v42;
  _SFPBFormattedText *v43;
  void *v44;
  _SFPBFormattedText *v45;
  _SFPBSuggestionCardSection *v46;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[_SFPBSuggestionCardSection init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "punchoutOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v7 = 0;

    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    objc_msgSend(v4, "punchoutOptions", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v49;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v49 != v11)
            objc_enumerationMutation(v8);
          v13 = -[_SFPBPunchout initWithFacade:]([_SFPBPunchout alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i));
          if (v13)
            objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
      }
      while (v10);
    }

    -[_SFPBSuggestionCardSection setPunchoutOptions:](v5, "setPunchoutOptions:", v7);
    objc_msgSend(v4, "punchoutPickerTitle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v4, "punchoutPickerTitle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBSuggestionCardSection setPunchoutPickerTitle:](v5, "setPunchoutPickerTitle:", v15);

    }
    objc_msgSend(v4, "punchoutPickerDismissText");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v4, "punchoutPickerDismissText");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBSuggestionCardSection setPunchoutPickerDismissText:](v5, "setPunchoutPickerDismissText:", v17);

    }
    if (objc_msgSend(v4, "hasCanBeHidden"))
      -[_SFPBSuggestionCardSection setCanBeHidden:](v5, "setCanBeHidden:", objc_msgSend(v4, "canBeHidden"));
    if (objc_msgSend(v4, "hasHasTopPadding"))
      -[_SFPBSuggestionCardSection setHasTopPadding:](v5, "setHasTopPadding:", objc_msgSend(v4, "hasTopPadding"));
    if (objc_msgSend(v4, "hasHasBottomPadding"))
      -[_SFPBSuggestionCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", objc_msgSend(v4, "hasBottomPadding"));
    objc_msgSend(v4, "type");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v4, "type");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBSuggestionCardSection setType:](v5, "setType:", v19);

    }
    if (objc_msgSend(v4, "hasSeparatorStyle"))
      -[_SFPBSuggestionCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", objc_msgSend(v4, "separatorStyle"));
    objc_msgSend(v4, "backgroundColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v21 = [_SFPBColor alloc];
      objc_msgSend(v4, "backgroundColor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[_SFPBColor initWithFacade:](v21, "initWithFacade:", v22);
      -[_SFPBSuggestionCardSection setBackgroundColor:](v5, "setBackgroundColor:", v23);

    }
    objc_msgSend(v4, "suggestionText");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      v25 = [_SFPBRichText alloc];
      objc_msgSend(v4, "suggestionText");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[_SFPBRichText initWithFacade:](v25, "initWithFacade:", v26);
      -[_SFPBSuggestionCardSection setSuggestionText:](v5, "setSuggestionText:", v27);

    }
    if (objc_msgSend(v4, "hasIsContact"))
      -[_SFPBSuggestionCardSection setIsContact:](v5, "setIsContact:", objc_msgSend(v4, "isContact"));
    objc_msgSend(v4, "scopedSearchSectionBundleIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend(v4, "scopedSearchSectionBundleIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBSuggestionCardSection setScopedSearchSectionBundleIdentifier:](v5, "setScopedSearchSectionBundleIdentifier:", v29);

    }
    if (objc_msgSend(v4, "hasSuggestionType"))
      -[_SFPBSuggestionCardSection setSuggestionType:](v5, "setSuggestionType:", objc_msgSend(v4, "suggestionType"));
    objc_msgSend(v4, "detailText");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      v31 = [_SFPBRichText alloc];
      objc_msgSend(v4, "detailText");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = -[_SFPBRichText initWithFacade:](v31, "initWithFacade:", v32);
      -[_SFPBSuggestionCardSection setDetailText:](v5, "setDetailText:", v33);

    }
    objc_msgSend(v4, "thumbnail");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      v35 = [_SFPBImage alloc];
      objc_msgSend(v4, "thumbnail");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = -[_SFPBImage initWithFacade:](v35, "initWithFacade:", v36);
      -[_SFPBSuggestionCardSection setThumbnail:](v5, "setThumbnail:", v37);

    }
    objc_msgSend(v4, "trailingMiddleText");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      v39 = [_SFPBFormattedText alloc];
      objc_msgSend(v4, "trailingMiddleText");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = -[_SFPBFormattedText initWithFacade:](v39, "initWithFacade:", v40);
      -[_SFPBSuggestionCardSection setTrailingMiddleText:](v5, "setTrailingMiddleText:", v41);

    }
    objc_msgSend(v4, "trailingBottomText");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42)
    {
      v43 = [_SFPBFormattedText alloc];
      objc_msgSend(v4, "trailingBottomText");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = -[_SFPBFormattedText initWithFacade:](v43, "initWithFacade:", v44);
      -[_SFPBSuggestionCardSection setTrailingBottomText:](v5, "setTrailingBottomText:", v45);

    }
    v46 = v5;

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

- (void)setSuggestionText:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionText, a3);
}

- (void)setIsContact:(BOOL)a3
{
  self->_isContact = a3;
}

- (void)setScopedSearchSectionBundleIdentifier:(id)a3
{
  NSString *v4;
  NSString *scopedSearchSectionBundleIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  scopedSearchSectionBundleIdentifier = self->_scopedSearchSectionBundleIdentifier;
  self->_scopedSearchSectionBundleIdentifier = v4;

}

- (void)setSuggestionType:(int)a3
{
  self->_suggestionType = a3;
}

- (void)setDetailText:(id)a3
{
  objc_storeStrong((id *)&self->_detailText, a3);
}

- (void)setThumbnail:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnail, a3);
}

- (void)setTrailingMiddleText:(id)a3
{
  objc_storeStrong((id *)&self->_trailingMiddleText, a3);
}

- (void)setTrailingBottomText:(id)a3
{
  objc_storeStrong((id *)&self->_trailingBottomText, a3);
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBSuggestionCardSectionReadFrom(self, (uint64_t)a3);
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
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_SFPBSuggestionCardSection punchoutOptions](self, "punchoutOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v7);
  }

  -[_SFPBSuggestionCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    PBDataWriterWriteStringField();

  -[_SFPBSuggestionCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    PBDataWriterWriteStringField();

  if (-[_SFPBSuggestionCardSection canBeHidden](self, "canBeHidden"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBSuggestionCardSection hasTopPadding](self, "hasTopPadding"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBSuggestionCardSection hasBottomPadding](self, "hasBottomPadding"))
    PBDataWriterWriteBOOLField();
  -[_SFPBSuggestionCardSection type](self, "type");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    PBDataWriterWriteStringField();

  if (-[_SFPBSuggestionCardSection separatorStyle](self, "separatorStyle"))
    PBDataWriterWriteInt32Field();
  -[_SFPBSuggestionCardSection backgroundColor](self, "backgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    PBDataWriterWriteSubmessage();

  -[_SFPBSuggestionCardSection suggestionText](self, "suggestionText");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    PBDataWriterWriteSubmessage();

  if (-[_SFPBSuggestionCardSection isContact](self, "isContact"))
    PBDataWriterWriteBOOLField();
  -[_SFPBSuggestionCardSection scopedSearchSectionBundleIdentifier](self, "scopedSearchSectionBundleIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    PBDataWriterWriteStringField();

  if (-[_SFPBSuggestionCardSection suggestionType](self, "suggestionType"))
    PBDataWriterWriteInt32Field();
  -[_SFPBSuggestionCardSection detailText](self, "detailText");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    PBDataWriterWriteSubmessage();

  -[_SFPBSuggestionCardSection thumbnail](self, "thumbnail");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    PBDataWriterWriteSubmessage();

  -[_SFPBSuggestionCardSection trailingMiddleText](self, "trailingMiddleText");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
    PBDataWriterWriteSubmessage();

  -[_SFPBSuggestionCardSection trailingBottomText](self, "trailingBottomText");
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
  int isContact;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  int suggestionType;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  int v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  int v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  int v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  char v67;
  BOOL v68;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_63;
  -[_SFPBSuggestionCardSection punchoutOptions](self, "punchoutOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "punchoutOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_62;
  -[_SFPBSuggestionCardSection punchoutOptions](self, "punchoutOptions");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBSuggestionCardSection punchoutOptions](self, "punchoutOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "punchoutOptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_63;
  }
  else
  {

  }
  -[_SFPBSuggestionCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "punchoutPickerTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_62;
  -[_SFPBSuggestionCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBSuggestionCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "punchoutPickerTitle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_63;
  }
  else
  {

  }
  -[_SFPBSuggestionCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "punchoutPickerDismissText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_62;
  -[_SFPBSuggestionCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_SFPBSuggestionCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "punchoutPickerDismissText");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_63;
  }
  else
  {

  }
  canBeHidden = self->_canBeHidden;
  if (canBeHidden != objc_msgSend(v4, "canBeHidden"))
    goto LABEL_63;
  hasTopPadding = self->_hasTopPadding;
  if (hasTopPadding != objc_msgSend(v4, "hasTopPadding"))
    goto LABEL_63;
  hasBottomPadding = self->_hasBottomPadding;
  if (hasBottomPadding != objc_msgSend(v4, "hasBottomPadding"))
    goto LABEL_63;
  -[_SFPBSuggestionCardSection type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_62;
  -[_SFPBSuggestionCardSection type](self, "type");
  v25 = objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v26 = (void *)v25;
    -[_SFPBSuggestionCardSection type](self, "type");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "type");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v27, "isEqual:", v28);

    if (!v29)
      goto LABEL_63;
  }
  else
  {

  }
  separatorStyle = self->_separatorStyle;
  if (separatorStyle != objc_msgSend(v4, "separatorStyle"))
    goto LABEL_63;
  -[_SFPBSuggestionCardSection backgroundColor](self, "backgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_62;
  -[_SFPBSuggestionCardSection backgroundColor](self, "backgroundColor");
  v31 = objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    v32 = (void *)v31;
    -[_SFPBSuggestionCardSection backgroundColor](self, "backgroundColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "backgroundColor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v33, "isEqual:", v34);

    if (!v35)
      goto LABEL_63;
  }
  else
  {

  }
  -[_SFPBSuggestionCardSection suggestionText](self, "suggestionText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "suggestionText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_62;
  -[_SFPBSuggestionCardSection suggestionText](self, "suggestionText");
  v36 = objc_claimAutoreleasedReturnValue();
  if (v36)
  {
    v37 = (void *)v36;
    -[_SFPBSuggestionCardSection suggestionText](self, "suggestionText");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "suggestionText");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v38, "isEqual:", v39);

    if (!v40)
      goto LABEL_63;
  }
  else
  {

  }
  isContact = self->_isContact;
  if (isContact != objc_msgSend(v4, "isContact"))
    goto LABEL_63;
  -[_SFPBSuggestionCardSection scopedSearchSectionBundleIdentifier](self, "scopedSearchSectionBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scopedSearchSectionBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_62;
  -[_SFPBSuggestionCardSection scopedSearchSectionBundleIdentifier](self, "scopedSearchSectionBundleIdentifier");
  v42 = objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    v43 = (void *)v42;
    -[_SFPBSuggestionCardSection scopedSearchSectionBundleIdentifier](self, "scopedSearchSectionBundleIdentifier");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scopedSearchSectionBundleIdentifier");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v44, "isEqual:", v45);

    if (!v46)
      goto LABEL_63;
  }
  else
  {

  }
  suggestionType = self->_suggestionType;
  if (suggestionType != objc_msgSend(v4, "suggestionType"))
    goto LABEL_63;
  -[_SFPBSuggestionCardSection detailText](self, "detailText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "detailText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_62;
  -[_SFPBSuggestionCardSection detailText](self, "detailText");
  v48 = objc_claimAutoreleasedReturnValue();
  if (v48)
  {
    v49 = (void *)v48;
    -[_SFPBSuggestionCardSection detailText](self, "detailText");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "detailText");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v50, "isEqual:", v51);

    if (!v52)
      goto LABEL_63;
  }
  else
  {

  }
  -[_SFPBSuggestionCardSection thumbnail](self, "thumbnail");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "thumbnail");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_62;
  -[_SFPBSuggestionCardSection thumbnail](self, "thumbnail");
  v53 = objc_claimAutoreleasedReturnValue();
  if (v53)
  {
    v54 = (void *)v53;
    -[_SFPBSuggestionCardSection thumbnail](self, "thumbnail");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "thumbnail");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v55, "isEqual:", v56);

    if (!v57)
      goto LABEL_63;
  }
  else
  {

  }
  -[_SFPBSuggestionCardSection trailingMiddleText](self, "trailingMiddleText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trailingMiddleText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_62;
  -[_SFPBSuggestionCardSection trailingMiddleText](self, "trailingMiddleText");
  v58 = objc_claimAutoreleasedReturnValue();
  if (v58)
  {
    v59 = (void *)v58;
    -[_SFPBSuggestionCardSection trailingMiddleText](self, "trailingMiddleText");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "trailingMiddleText");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v60, "isEqual:", v61);

    if (!v62)
      goto LABEL_63;
  }
  else
  {

  }
  -[_SFPBSuggestionCardSection trailingBottomText](self, "trailingBottomText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trailingBottomText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_62:

    goto LABEL_63;
  }
  -[_SFPBSuggestionCardSection trailingBottomText](self, "trailingBottomText");
  v63 = objc_claimAutoreleasedReturnValue();
  if (!v63)
  {

LABEL_66:
    v68 = 1;
    goto LABEL_64;
  }
  v64 = (void *)v63;
  -[_SFPBSuggestionCardSection trailingBottomText](self, "trailingBottomText");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trailingBottomText");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = objc_msgSend(v65, "isEqual:", v66);

  if ((v67 & 1) != 0)
    goto LABEL_66;
LABEL_63:
  v68 = 0;
LABEL_64:

  return v68;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  NSUInteger v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  NSUInteger v16;
  NSUInteger v17;
  uint64_t v18;

  v18 = -[NSArray hash](self->_punchoutOptions, "hash");
  v17 = -[NSString hash](self->_punchoutPickerTitle, "hash");
  v16 = -[NSString hash](self->_punchoutPickerDismissText, "hash");
  if (self->_canBeHidden)
    v3 = 2654435761;
  else
    v3 = 0;
  if (self->_hasTopPadding)
    v4 = 2654435761;
  else
    v4 = 0;
  if (self->_hasBottomPadding)
    v5 = 2654435761;
  else
    v5 = 0;
  v6 = -[NSString hash](self->_type, "hash");
  v7 = 2654435761 * self->_separatorStyle;
  v8 = -[_SFPBColor hash](self->_backgroundColor, "hash");
  v9 = -[_SFPBRichText hash](self->_suggestionText, "hash");
  if (self->_isContact)
    v10 = 2654435761;
  else
    v10 = 0;
  v11 = v17 ^ v18 ^ v16 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ -[NSString hash](self->_scopedSearchSectionBundleIdentifier, "hash") ^ (2654435761 * self->_suggestionType);
  v12 = -[_SFPBRichText hash](self->_detailText, "hash");
  v13 = v12 ^ -[_SFPBImage hash](self->_thumbnail, "hash");
  v14 = v13 ^ -[_SFPBFormattedText hash](self->_trailingMiddleText, "hash");
  return v11 ^ v14 ^ -[_SFPBFormattedText hash](self->_trailingBottomText, "hash");
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
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
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
  void *v45;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_backgroundColor)
  {
    -[_SFPBSuggestionCardSection backgroundColor](self, "backgroundColor");
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
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBSuggestionCardSection canBeHidden](self, "canBeHidden"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("canBeHidden"));

  }
  if (self->_detailText)
  {
    -[_SFPBSuggestionCardSection detailText](self, "detailText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("detailText"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("detailText"));

    }
  }
  if (self->_hasBottomPadding)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBSuggestionCardSection hasBottomPadding](self, "hasBottomPadding"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("hasBottomPadding"));

  }
  if (self->_hasTopPadding)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBSuggestionCardSection hasTopPadding](self, "hasTopPadding"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("hasTopPadding"));

  }
  if (self->_isContact)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBSuggestionCardSection isContact](self, "isContact"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("isContact"));

  }
  if (-[NSArray count](self->_punchoutOptions, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v15 = self->_punchoutOptions;
    v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v48 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * i), "dictionaryRepresentation");
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
        v17 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
      }
      while (v17);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("punchoutOptions"));
  }
  if (self->_punchoutPickerDismissText)
  {
    -[_SFPBSuggestionCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v22, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("punchoutPickerDismissText"));

  }
  if (self->_punchoutPickerTitle)
  {
    -[_SFPBSuggestionCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v24, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("punchoutPickerTitle"));

  }
  if (self->_scopedSearchSectionBundleIdentifier)
  {
    -[_SFPBSuggestionCardSection scopedSearchSectionBundleIdentifier](self, "scopedSearchSectionBundleIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v26, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("scopedSearchSectionBundleIdentifier"));

  }
  if (self->_separatorStyle)
  {
    v28 = -[_SFPBSuggestionCardSection separatorStyle](self, "separatorStyle");
    if (v28 >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = *(&off_1E40421B0 + v28);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("separatorStyle"));

  }
  if (self->_suggestionText)
  {
    -[_SFPBSuggestionCardSection suggestionText](self, "suggestionText");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "dictionaryRepresentation");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("suggestionText"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("suggestionText"));

    }
  }
  if (self->_suggestionType)
  {
    v33 = -[_SFPBSuggestionCardSection suggestionType](self, "suggestionType");
    if (v33 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v34 = *(&off_1E4042078 + v33);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("suggestionType"));

  }
  if (self->_thumbnail)
  {
    -[_SFPBSuggestionCardSection thumbnail](self, "thumbnail");
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
  if (self->_trailingBottomText)
  {
    -[_SFPBSuggestionCardSection trailingBottomText](self, "trailingBottomText");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "dictionaryRepresentation");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (v39)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, CFSTR("trailingBottomText"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v40, CFSTR("trailingBottomText"));

    }
  }
  if (self->_trailingMiddleText)
  {
    -[_SFPBSuggestionCardSection trailingMiddleText](self, "trailingMiddleText");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "dictionaryRepresentation");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (v42)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v42, CFSTR("trailingMiddleText"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v43, CFSTR("trailingMiddleText"));

    }
  }
  if (self->_type)
  {
    -[_SFPBSuggestionCardSection type](self, "type");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = (void *)objc_msgSend(v44, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v45, CFSTR("type"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBSuggestionCardSection dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBSuggestionCardSection)initWithJSON:(id)a3
{
  void *v4;
  _SFPBSuggestionCardSection *v5;
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
    self = -[_SFPBSuggestionCardSection initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBSuggestionCardSection)initWithDictionary:(id)a3
{
  id v4;
  _SFPBSuggestionCardSection *v5;
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
  uint64_t v26;
  _SFPBRichText *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _SFPBRichText *v33;
  void *v34;
  _SFPBImage *v35;
  void *v36;
  _SFPBFormattedText *v37;
  void *v38;
  _SFPBFormattedText *v39;
  _SFPBSuggestionCardSection *v40;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  objc_super v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v57.receiver = self;
  v57.super_class = (Class)_SFPBSuggestionCardSection;
  v5 = -[_SFPBSuggestionCardSection init](&v57, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("punchoutOptions"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v54;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v54 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v13 = -[_SFPBPunchout initWithDictionary:]([_SFPBPunchout alloc], "initWithDictionary:", v12);
              -[_SFPBSuggestionCardSection addPunchoutOptions:](v5, "addPunchoutOptions:", v13);

            }
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
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
      -[_SFPBSuggestionCardSection setPunchoutPickerTitle:](v5, "setPunchoutPickerTitle:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("punchoutPickerDismissText"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = (void *)objc_msgSend(v16, "copy");
      -[_SFPBSuggestionCardSection setPunchoutPickerDismissText:](v5, "setPunchoutPickerDismissText:", v17);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("canBeHidden"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBSuggestionCardSection setCanBeHidden:](v5, "setCanBeHidden:", objc_msgSend(v18, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasTopPadding"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v52 = v19;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBSuggestionCardSection setHasTopPadding:](v5, "setHasTopPadding:", objc_msgSend(v19, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasBottomPadding"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v51 = v20;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBSuggestionCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", objc_msgSend(v20, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v50 = v21;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = (void *)objc_msgSend(v21, "copy");
      -[_SFPBSuggestionCardSection setType:](v5, "setType:", v22);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("separatorStyle"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v49 = v23;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBSuggestionCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", objc_msgSend(v23, "intValue"));
    v44 = v18;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("backgroundColor"));
    v24 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = -[_SFPBColor initWithDictionary:]([_SFPBColor alloc], "initWithDictionary:", v24);
      -[_SFPBSuggestionCardSection setBackgroundColor:](v5, "setBackgroundColor:", v25);

    }
    v43 = (void *)v24;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("suggestionText"));
    v26 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v48 = (void *)v26;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = -[_SFPBRichText initWithDictionary:]([_SFPBRichText alloc], "initWithDictionary:", v26);
      -[_SFPBSuggestionCardSection setSuggestionText:](v5, "setSuggestionText:", v27);

    }
    v46 = v14;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isContact"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBSuggestionCardSection setIsContact:](v5, "setIsContact:", objc_msgSend(v28, "BOOLValue"));
    v42 = v28;
    v45 = v16;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("scopedSearchSectionBundleIdentifier"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v30 = (void *)objc_msgSend(v29, "copy");
      -[_SFPBSuggestionCardSection setScopedSearchSectionBundleIdentifier:](v5, "setScopedSearchSectionBundleIdentifier:", v30);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("suggestionType"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBSuggestionCardSection setSuggestionType:](v5, "setSuggestionType:", objc_msgSend(v31, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("detailText"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v33 = -[_SFPBRichText initWithDictionary:]([_SFPBRichText alloc], "initWithDictionary:", v32);
      -[_SFPBSuggestionCardSection setDetailText:](v5, "setDetailText:", v33);

    }
    v47 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("thumbnail"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v35 = -[_SFPBImage initWithDictionary:]([_SFPBImage alloc], "initWithDictionary:", v34);
      -[_SFPBSuggestionCardSection setThumbnail:](v5, "setThumbnail:", v35);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trailingMiddleText"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v37 = -[_SFPBFormattedText initWithDictionary:]([_SFPBFormattedText alloc], "initWithDictionary:", v36);
      -[_SFPBSuggestionCardSection setTrailingMiddleText:](v5, "setTrailingMiddleText:", v37);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trailingBottomText"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v39 = -[_SFPBFormattedText initWithDictionary:]([_SFPBFormattedText alloc], "initWithDictionary:", v38);
      -[_SFPBSuggestionCardSection setTrailingBottomText:](v5, "setTrailingBottomText:", v39);

    }
    v40 = v5;

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

- (_SFPBRichText)suggestionText
{
  return self->_suggestionText;
}

- (BOOL)isContact
{
  return self->_isContact;
}

- (NSString)scopedSearchSectionBundleIdentifier
{
  return self->_scopedSearchSectionBundleIdentifier;
}

- (int)suggestionType
{
  return self->_suggestionType;
}

- (_SFPBRichText)detailText
{
  return self->_detailText;
}

- (_SFPBImage)thumbnail
{
  return self->_thumbnail;
}

- (_SFPBFormattedText)trailingMiddleText
{
  return self->_trailingMiddleText;
}

- (_SFPBFormattedText)trailingBottomText
{
  return self->_trailingBottomText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingBottomText, 0);
  objc_storeStrong((id *)&self->_trailingMiddleText, 0);
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_scopedSearchSectionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_suggestionText, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_punchoutPickerDismissText, 0);
  objc_storeStrong((id *)&self->_punchoutPickerTitle, 0);
  objc_storeStrong((id *)&self->_punchoutOptions, 0);
}

@end
