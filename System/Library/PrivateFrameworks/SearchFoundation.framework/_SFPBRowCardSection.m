@implementation _SFPBRowCardSection

- (_SFPBRowCardSection)initWithFacade:(id)a3
{
  id v4;
  _SFPBRowCardSection *v5;
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
  _SFPBImage *v25;
  void *v26;
  _SFPBImage *v27;
  void *v28;
  _SFPBRichText *v29;
  void *v30;
  _SFPBRichText *v31;
  void *v32;
  _SFPBRichText *v33;
  void *v34;
  _SFPBRichText *v35;
  void *v36;
  _SFPBImage *v37;
  void *v38;
  _SFPBImage *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  _SFPBRichText *v49;
  void *v50;
  _SFPBRichText *v51;
  void *v52;
  _SFPBRichText *v53;
  void *v54;
  _SFPBRichText *v55;
  _SFPBRowCardSection *v56;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[_SFPBRowCardSection init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "punchoutOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v7 = 0;

    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    objc_msgSend(v4, "punchoutOptions", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v59;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v59 != v11)
            objc_enumerationMutation(v8);
          v13 = -[_SFPBPunchout initWithFacade:]([_SFPBPunchout alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * i));
          if (v13)
            objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
      }
      while (v10);
    }

    -[_SFPBRowCardSection setPunchoutOptions:](v5, "setPunchoutOptions:", v7);
    objc_msgSend(v4, "punchoutPickerTitle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v4, "punchoutPickerTitle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBRowCardSection setPunchoutPickerTitle:](v5, "setPunchoutPickerTitle:", v15);

    }
    objc_msgSend(v4, "punchoutPickerDismissText");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v4, "punchoutPickerDismissText");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBRowCardSection setPunchoutPickerDismissText:](v5, "setPunchoutPickerDismissText:", v17);

    }
    if (objc_msgSend(v4, "hasCanBeHidden"))
      -[_SFPBRowCardSection setCanBeHidden:](v5, "setCanBeHidden:", objc_msgSend(v4, "canBeHidden"));
    if (objc_msgSend(v4, "hasHasTopPadding"))
      -[_SFPBRowCardSection setHasTopPadding:](v5, "setHasTopPadding:", objc_msgSend(v4, "hasTopPadding"));
    if (objc_msgSend(v4, "hasHasBottomPadding"))
      -[_SFPBRowCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", objc_msgSend(v4, "hasBottomPadding"));
    objc_msgSend(v4, "type");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v4, "type");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBRowCardSection setType:](v5, "setType:", v19);

    }
    if (objc_msgSend(v4, "hasSeparatorStyle"))
      -[_SFPBRowCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", objc_msgSend(v4, "separatorStyle"));
    objc_msgSend(v4, "backgroundColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v21 = [_SFPBColor alloc];
      objc_msgSend(v4, "backgroundColor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[_SFPBColor initWithFacade:](v21, "initWithFacade:", v22);
      -[_SFPBRowCardSection setBackgroundColor:](v5, "setBackgroundColor:", v23);

    }
    objc_msgSend(v4, "image");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      v25 = [_SFPBImage alloc];
      objc_msgSend(v4, "image");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[_SFPBImage initWithFacade:](v25, "initWithFacade:", v26);
      -[_SFPBRowCardSection setImage:](v5, "setImage:", v27);

    }
    if (objc_msgSend(v4, "hasImageIsRightAligned"))
      -[_SFPBRowCardSection setImageIsRightAligned:](v5, "setImageIsRightAligned:", objc_msgSend(v4, "imageIsRightAligned"));
    objc_msgSend(v4, "leadingText");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      v29 = [_SFPBRichText alloc];
      objc_msgSend(v4, "leadingText");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = -[_SFPBRichText initWithFacade:](v29, "initWithFacade:", v30);
      -[_SFPBRowCardSection setLeadingText:](v5, "setLeadingText:", v31);

    }
    objc_msgSend(v4, "trailingText");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      v33 = [_SFPBRichText alloc];
      objc_msgSend(v4, "trailingText");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = -[_SFPBRichText initWithFacade:](v33, "initWithFacade:", v34);
      -[_SFPBRowCardSection setTrailingText:](v5, "setTrailingText:", v35);

    }
    objc_msgSend(v4, "attributionImage");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      v37 = [_SFPBImage alloc];
      objc_msgSend(v4, "attributionImage");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = -[_SFPBImage initWithFacade:](v37, "initWithFacade:", v38);
      -[_SFPBRowCardSection setAttributionImage:](v5, "setAttributionImage:", v39);

    }
    objc_msgSend(v4, "key");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (v40)
    {
      objc_msgSend(v4, "key");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBRowCardSection setKey:](v5, "setKey:", v41);

    }
    if (objc_msgSend(v4, "hasKeyNoWrap"))
      -[_SFPBRowCardSection setKeyNoWrap:](v5, "setKeyNoWrap:", objc_msgSend(v4, "keyNoWrap"));
    objc_msgSend(v4, "keyWeight");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42)
    {
      objc_msgSend(v4, "keyWeight");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBRowCardSection setKeyWeight:](v5, "setKeyWeight:", objc_msgSend(v43, "intValue"));

    }
    objc_msgSend(v4, "value");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v44)
    {
      objc_msgSend(v4, "value");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBRowCardSection setValue:](v5, "setValue:", v45);

    }
    if (objc_msgSend(v4, "hasValueNoWrap"))
      -[_SFPBRowCardSection setValueNoWrap:](v5, "setValueNoWrap:", objc_msgSend(v4, "valueNoWrap"));
    objc_msgSend(v4, "valueWeight");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (v46)
    {
      objc_msgSend(v4, "valueWeight");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBRowCardSection setValueWeight:](v5, "setValueWeight:", objc_msgSend(v47, "intValue"));

    }
    if (objc_msgSend(v4, "hasCardPaddingBottom"))
      -[_SFPBRowCardSection setCardPaddingBottom:](v5, "setCardPaddingBottom:", objc_msgSend(v4, "cardPaddingBottom"));
    objc_msgSend(v4, "leadingSubtitle");
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    if (v48)
    {
      v49 = [_SFPBRichText alloc];
      objc_msgSend(v4, "leadingSubtitle");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = -[_SFPBRichText initWithFacade:](v49, "initWithFacade:", v50);
      -[_SFPBRowCardSection setLeadingSubtitle:](v5, "setLeadingSubtitle:", v51);

    }
    objc_msgSend(v4, "trailingSubtitle");
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    if (v52)
    {
      v53 = [_SFPBRichText alloc];
      objc_msgSend(v4, "trailingSubtitle");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = -[_SFPBRichText initWithFacade:](v53, "initWithFacade:", v54);
      -[_SFPBRowCardSection setTrailingSubtitle:](v5, "setTrailingSubtitle:", v55);

    }
    v56 = v5;

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

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (void)setImageIsRightAligned:(BOOL)a3
{
  self->_imageIsRightAligned = a3;
}

- (void)setLeadingText:(id)a3
{
  objc_storeStrong((id *)&self->_leadingText, a3);
}

- (void)setTrailingText:(id)a3
{
  objc_storeStrong((id *)&self->_trailingText, a3);
}

- (void)setAttributionImage:(id)a3
{
  objc_storeStrong((id *)&self->_attributionImage, a3);
}

- (void)setKey:(id)a3
{
  NSString *v4;
  NSString *key;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  key = self->_key;
  self->_key = v4;

}

- (void)setKeyNoWrap:(BOOL)a3
{
  self->_keyNoWrap = a3;
}

- (void)setKeyWeight:(int)a3
{
  self->_keyWeight = a3;
}

- (void)setValue:(id)a3
{
  NSString *v4;
  NSString *value;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  value = self->_value;
  self->_value = v4;

}

- (void)setValueNoWrap:(BOOL)a3
{
  self->_valueNoWrap = a3;
}

- (void)setValueWeight:(int)a3
{
  self->_valueWeight = a3;
}

- (void)setCardPaddingBottom:(BOOL)a3
{
  self->_cardPaddingBottom = a3;
}

- (void)setLeadingSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_leadingSubtitle, a3);
}

- (void)setTrailingSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_trailingSubtitle, a3);
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRowCardSectionReadFrom(self, (uint64_t)a3);
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
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_SFPBRowCardSection punchoutOptions](self, "punchoutOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v7);
  }

  -[_SFPBRowCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    PBDataWriterWriteStringField();

  -[_SFPBRowCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    PBDataWriterWriteStringField();

  if (-[_SFPBRowCardSection canBeHidden](self, "canBeHidden"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBRowCardSection hasTopPadding](self, "hasTopPadding"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBRowCardSection hasBottomPadding](self, "hasBottomPadding"))
    PBDataWriterWriteBOOLField();
  -[_SFPBRowCardSection type](self, "type");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    PBDataWriterWriteStringField();

  if (-[_SFPBRowCardSection separatorStyle](self, "separatorStyle"))
    PBDataWriterWriteInt32Field();
  -[_SFPBRowCardSection backgroundColor](self, "backgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    PBDataWriterWriteSubmessage();

  -[_SFPBRowCardSection image](self, "image");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    PBDataWriterWriteSubmessage();

  if (-[_SFPBRowCardSection imageIsRightAligned](self, "imageIsRightAligned"))
    PBDataWriterWriteBOOLField();
  -[_SFPBRowCardSection leadingText](self, "leadingText");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    PBDataWriterWriteSubmessage();

  -[_SFPBRowCardSection trailingText](self, "trailingText");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    PBDataWriterWriteSubmessage();

  -[_SFPBRowCardSection attributionImage](self, "attributionImage");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    PBDataWriterWriteSubmessage();

  -[_SFPBRowCardSection key](self, "key");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
    PBDataWriterWriteStringField();

  if (-[_SFPBRowCardSection keyNoWrap](self, "keyNoWrap"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBRowCardSection keyWeight](self, "keyWeight"))
    PBDataWriterWriteInt32Field();
  -[_SFPBRowCardSection value](self, "value");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    PBDataWriterWriteStringField();

  if (-[_SFPBRowCardSection valueNoWrap](self, "valueNoWrap"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBRowCardSection valueWeight](self, "valueWeight"))
    PBDataWriterWriteInt32Field();
  if (-[_SFPBRowCardSection cardPaddingBottom](self, "cardPaddingBottom"))
    PBDataWriterWriteBOOLField();
  -[_SFPBRowCardSection leadingSubtitle](self, "leadingSubtitle");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
    PBDataWriterWriteSubmessage();

  -[_SFPBRowCardSection trailingSubtitle](self, "trailingSubtitle");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
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
  int imageIsRightAligned;
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
  int keyNoWrap;
  int keyWeight;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  int v68;
  int valueNoWrap;
  int valueWeight;
  int cardPaddingBottom;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  int v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  char v81;
  BOOL v82;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_77;
  -[_SFPBRowCardSection punchoutOptions](self, "punchoutOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "punchoutOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_76;
  -[_SFPBRowCardSection punchoutOptions](self, "punchoutOptions");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBRowCardSection punchoutOptions](self, "punchoutOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "punchoutOptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_77;
  }
  else
  {

  }
  -[_SFPBRowCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "punchoutPickerTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_76;
  -[_SFPBRowCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBRowCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "punchoutPickerTitle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_77;
  }
  else
  {

  }
  -[_SFPBRowCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "punchoutPickerDismissText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_76;
  -[_SFPBRowCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_SFPBRowCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "punchoutPickerDismissText");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_77;
  }
  else
  {

  }
  canBeHidden = self->_canBeHidden;
  if (canBeHidden != objc_msgSend(v4, "canBeHidden"))
    goto LABEL_77;
  hasTopPadding = self->_hasTopPadding;
  if (hasTopPadding != objc_msgSend(v4, "hasTopPadding"))
    goto LABEL_77;
  hasBottomPadding = self->_hasBottomPadding;
  if (hasBottomPadding != objc_msgSend(v4, "hasBottomPadding"))
    goto LABEL_77;
  -[_SFPBRowCardSection type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_76;
  -[_SFPBRowCardSection type](self, "type");
  v25 = objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v26 = (void *)v25;
    -[_SFPBRowCardSection type](self, "type");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "type");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v27, "isEqual:", v28);

    if (!v29)
      goto LABEL_77;
  }
  else
  {

  }
  separatorStyle = self->_separatorStyle;
  if (separatorStyle != objc_msgSend(v4, "separatorStyle"))
    goto LABEL_77;
  -[_SFPBRowCardSection backgroundColor](self, "backgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_76;
  -[_SFPBRowCardSection backgroundColor](self, "backgroundColor");
  v31 = objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    v32 = (void *)v31;
    -[_SFPBRowCardSection backgroundColor](self, "backgroundColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "backgroundColor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v33, "isEqual:", v34);

    if (!v35)
      goto LABEL_77;
  }
  else
  {

  }
  -[_SFPBRowCardSection image](self, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_76;
  -[_SFPBRowCardSection image](self, "image");
  v36 = objc_claimAutoreleasedReturnValue();
  if (v36)
  {
    v37 = (void *)v36;
    -[_SFPBRowCardSection image](self, "image");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "image");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v38, "isEqual:", v39);

    if (!v40)
      goto LABEL_77;
  }
  else
  {

  }
  imageIsRightAligned = self->_imageIsRightAligned;
  if (imageIsRightAligned != objc_msgSend(v4, "imageIsRightAligned"))
    goto LABEL_77;
  -[_SFPBRowCardSection leadingText](self, "leadingText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leadingText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_76;
  -[_SFPBRowCardSection leadingText](self, "leadingText");
  v42 = objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    v43 = (void *)v42;
    -[_SFPBRowCardSection leadingText](self, "leadingText");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "leadingText");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v44, "isEqual:", v45);

    if (!v46)
      goto LABEL_77;
  }
  else
  {

  }
  -[_SFPBRowCardSection trailingText](self, "trailingText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trailingText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_76;
  -[_SFPBRowCardSection trailingText](self, "trailingText");
  v47 = objc_claimAutoreleasedReturnValue();
  if (v47)
  {
    v48 = (void *)v47;
    -[_SFPBRowCardSection trailingText](self, "trailingText");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "trailingText");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v49, "isEqual:", v50);

    if (!v51)
      goto LABEL_77;
  }
  else
  {

  }
  -[_SFPBRowCardSection attributionImage](self, "attributionImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributionImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_76;
  -[_SFPBRowCardSection attributionImage](self, "attributionImage");
  v52 = objc_claimAutoreleasedReturnValue();
  if (v52)
  {
    v53 = (void *)v52;
    -[_SFPBRowCardSection attributionImage](self, "attributionImage");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "attributionImage");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v54, "isEqual:", v55);

    if (!v56)
      goto LABEL_77;
  }
  else
  {

  }
  -[_SFPBRowCardSection key](self, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "key");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_76;
  -[_SFPBRowCardSection key](self, "key");
  v57 = objc_claimAutoreleasedReturnValue();
  if (v57)
  {
    v58 = (void *)v57;
    -[_SFPBRowCardSection key](self, "key");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "key");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(v59, "isEqual:", v60);

    if (!v61)
      goto LABEL_77;
  }
  else
  {

  }
  keyNoWrap = self->_keyNoWrap;
  if (keyNoWrap != objc_msgSend(v4, "keyNoWrap"))
    goto LABEL_77;
  keyWeight = self->_keyWeight;
  if (keyWeight != objc_msgSend(v4, "keyWeight"))
    goto LABEL_77;
  -[_SFPBRowCardSection value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_76;
  -[_SFPBRowCardSection value](self, "value");
  v64 = objc_claimAutoreleasedReturnValue();
  if (v64)
  {
    v65 = (void *)v64;
    -[_SFPBRowCardSection value](self, "value");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "value");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = objc_msgSend(v66, "isEqual:", v67);

    if (!v68)
      goto LABEL_77;
  }
  else
  {

  }
  valueNoWrap = self->_valueNoWrap;
  if (valueNoWrap != objc_msgSend(v4, "valueNoWrap"))
    goto LABEL_77;
  valueWeight = self->_valueWeight;
  if (valueWeight != objc_msgSend(v4, "valueWeight"))
    goto LABEL_77;
  cardPaddingBottom = self->_cardPaddingBottom;
  if (cardPaddingBottom != objc_msgSend(v4, "cardPaddingBottom"))
    goto LABEL_77;
  -[_SFPBRowCardSection leadingSubtitle](self, "leadingSubtitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leadingSubtitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_76;
  -[_SFPBRowCardSection leadingSubtitle](self, "leadingSubtitle");
  v72 = objc_claimAutoreleasedReturnValue();
  if (v72)
  {
    v73 = (void *)v72;
    -[_SFPBRowCardSection leadingSubtitle](self, "leadingSubtitle");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "leadingSubtitle");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = objc_msgSend(v74, "isEqual:", v75);

    if (!v76)
      goto LABEL_77;
  }
  else
  {

  }
  -[_SFPBRowCardSection trailingSubtitle](self, "trailingSubtitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trailingSubtitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_76:

    goto LABEL_77;
  }
  -[_SFPBRowCardSection trailingSubtitle](self, "trailingSubtitle");
  v77 = objc_claimAutoreleasedReturnValue();
  if (!v77)
  {

LABEL_80:
    v82 = 1;
    goto LABEL_78;
  }
  v78 = (void *)v77;
  -[_SFPBRowCardSection trailingSubtitle](self, "trailingSubtitle");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trailingSubtitle");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = objc_msgSend(v79, "isEqual:", v80);

  if ((v81 & 1) != 0)
    goto LABEL_80;
LABEL_77:
  v82 = 0;
LABEL_78:

  return v82;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSUInteger v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  NSUInteger v13;
  uint64_t v14;
  uint64_t v15;
  NSUInteger v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v22;
  uint64_t v23;
  NSUInteger v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSUInteger v28;
  NSUInteger v29;
  uint64_t v30;

  v30 = -[NSArray hash](self->_punchoutOptions, "hash");
  v29 = -[NSString hash](self->_punchoutPickerTitle, "hash");
  v3 = -[NSString hash](self->_punchoutPickerDismissText, "hash");
  if (self->_canBeHidden)
    v4 = 2654435761;
  else
    v4 = 0;
  v27 = v4;
  v28 = v3;
  if (self->_hasTopPadding)
    v5 = 2654435761;
  else
    v5 = 0;
  if (self->_hasBottomPadding)
    v6 = 2654435761;
  else
    v6 = 0;
  v25 = v6;
  v26 = v5;
  v7 = -[NSString hash](self->_type, "hash");
  v23 = 2654435761 * self->_separatorStyle;
  v24 = v7;
  v22 = -[_SFPBColor hash](self->_backgroundColor, "hash");
  v8 = -[_SFPBImage hash](self->_image, "hash");
  if (self->_imageIsRightAligned)
    v9 = 2654435761;
  else
    v9 = 0;
  v10 = -[_SFPBRichText hash](self->_leadingText, "hash");
  v11 = -[_SFPBRichText hash](self->_trailingText, "hash");
  v12 = -[_SFPBImage hash](self->_attributionImage, "hash");
  v13 = -[NSString hash](self->_key, "hash");
  if (self->_keyNoWrap)
    v14 = 2654435761;
  else
    v14 = 0;
  v15 = 2654435761 * self->_keyWeight;
  v16 = -[NSString hash](self->_value, "hash");
  if (self->_valueNoWrap)
    v17 = 2654435761;
  else
    v17 = 0;
  if (self->_cardPaddingBottom)
    v18 = 2654435761;
  else
    v18 = 0;
  v19 = v17 ^ (2654435761 * self->_valueWeight) ^ v18;
  v20 = v29 ^ v30 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v19 ^ -[_SFPBRichText hash](self->_leadingSubtitle, "hash");
  return v20 ^ -[_SFPBRichText hash](self->_trailingSubtitle, "hash");
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
  void *v26;
  void *v27;
  void *v28;
  NSArray *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
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
  void *v51;
  void *v52;
  void *v53;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_attributionImage)
  {
    -[_SFPBRowCardSection attributionImage](self, "attributionImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("attributionImage"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("attributionImage"));

    }
  }
  if (self->_backgroundColor)
  {
    -[_SFPBRowCardSection backgroundColor](self, "backgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("backgroundColor"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("backgroundColor"));

    }
  }
  if (self->_canBeHidden)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBRowCardSection canBeHidden](self, "canBeHidden"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("canBeHidden"));

  }
  if (self->_cardPaddingBottom)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBRowCardSection cardPaddingBottom](self, "cardPaddingBottom"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("cardPaddingBottom"));

  }
  if (self->_hasBottomPadding)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBRowCardSection hasBottomPadding](self, "hasBottomPadding"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("hasBottomPadding"));

  }
  if (self->_hasTopPadding)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBRowCardSection hasTopPadding](self, "hasTopPadding"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("hasTopPadding"));

  }
  if (self->_image)
  {
    -[_SFPBRowCardSection image](self, "image");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("image"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("image"));

    }
  }
  if (self->_imageIsRightAligned)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBRowCardSection imageIsRightAligned](self, "imageIsRightAligned"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("imageIsRightAligned"));

  }
  if (self->_key)
  {
    -[_SFPBRowCardSection key](self, "key");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("key"));

  }
  if (self->_keyNoWrap)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBRowCardSection keyNoWrap](self, "keyNoWrap"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("keyNoWrap"));

  }
  if (self->_keyWeight)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_SFPBRowCardSection keyWeight](self, "keyWeight"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("keyWeight"));

  }
  if (self->_leadingSubtitle)
  {
    -[_SFPBRowCardSection leadingSubtitle](self, "leadingSubtitle");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("leadingSubtitle"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("leadingSubtitle"));

    }
  }
  if (self->_leadingText)
  {
    -[_SFPBRowCardSection leadingText](self, "leadingText");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "dictionaryRepresentation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("leadingText"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("leadingText"));

    }
  }
  if (-[NSArray count](self->_punchoutOptions, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v29 = self->_punchoutOptions;
    v30 = -[NSArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v56;
      do
      {
        for (i = 0; i != v31; ++i)
        {
          if (*(_QWORD *)v56 != v32)
            objc_enumerationMutation(v29);
          objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * i), "dictionaryRepresentation");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          if (v34)
          {
            objc_msgSend(v28, "addObject:", v34);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "addObject:", v35);

          }
        }
        v31 = -[NSArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
      }
      while (v31);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("punchoutOptions"));
  }
  if (self->_punchoutPickerDismissText)
  {
    -[_SFPBRowCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)objc_msgSend(v36, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR("punchoutPickerDismissText"));

  }
  if (self->_punchoutPickerTitle)
  {
    -[_SFPBRowCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (void *)objc_msgSend(v38, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, CFSTR("punchoutPickerTitle"));

  }
  if (self->_separatorStyle)
  {
    v40 = -[_SFPBRowCardSection separatorStyle](self, "separatorStyle");
    if (v40 >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v41 = *(&off_1E40421B0 + v40);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("separatorStyle"));

  }
  if (self->_trailingSubtitle)
  {
    -[_SFPBRowCardSection trailingSubtitle](self, "trailingSubtitle");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "dictionaryRepresentation");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (v43)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v43, CFSTR("trailingSubtitle"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v44, CFSTR("trailingSubtitle"));

    }
  }
  if (self->_trailingText)
  {
    -[_SFPBRowCardSection trailingText](self, "trailingText");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "dictionaryRepresentation");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (v46)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v46, CFSTR("trailingText"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v47, CFSTR("trailingText"));

    }
  }
  if (self->_type)
  {
    -[_SFPBRowCardSection type](self, "type");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = (void *)objc_msgSend(v48, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v49, CFSTR("type"));

  }
  if (self->_value)
  {
    -[_SFPBRowCardSection value](self, "value");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = (void *)objc_msgSend(v50, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v51, CFSTR("value"));

  }
  if (self->_valueNoWrap)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBRowCardSection valueNoWrap](self, "valueNoWrap"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v52, CFSTR("valueNoWrap"));

  }
  if (self->_valueWeight)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_SFPBRowCardSection valueWeight](self, "valueWeight"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v53, CFSTR("valueWeight"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBRowCardSection dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBRowCardSection)initWithJSON:(id)a3
{
  void *v4;
  _SFPBRowCardSection *v5;
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
    self = -[_SFPBRowCardSection initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBRowCardSection)initWithDictionary:(id)a3
{
  id v4;
  _SFPBRowCardSection *v5;
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
  _SFPBImage *v27;
  void *v28;
  uint64_t v29;
  _SFPBRichText *v30;
  uint64_t v31;
  _SFPBRichText *v32;
  uint64_t v33;
  _SFPBImage *v34;
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
  _SFPBRichText *v45;
  void *v46;
  _SFPBRichText *v47;
  _SFPBRowCardSection *v48;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
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
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  objc_super v70;
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v70.receiver = self;
  v70.super_class = (Class)_SFPBRowCardSection;
  v5 = -[_SFPBRowCardSection init](&v70, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("punchoutOptions"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v68 = 0u;
      v69 = 0u;
      v66 = 0u;
      v67 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v66, v71, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v67;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v67 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v13 = -[_SFPBPunchout initWithDictionary:]([_SFPBPunchout alloc], "initWithDictionary:", v12);
              -[_SFPBRowCardSection addPunchoutOptions:](v5, "addPunchoutOptions:", v13);

            }
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v66, v71, 16);
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
      -[_SFPBRowCardSection setPunchoutPickerTitle:](v5, "setPunchoutPickerTitle:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("punchoutPickerDismissText"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = (void *)objc_msgSend(v16, "copy");
      -[_SFPBRowCardSection setPunchoutPickerDismissText:](v5, "setPunchoutPickerDismissText:", v17);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("canBeHidden"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBRowCardSection setCanBeHidden:](v5, "setCanBeHidden:", objc_msgSend(v18, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasTopPadding"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v65 = v19;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBRowCardSection setHasTopPadding:](v5, "setHasTopPadding:", objc_msgSend(v19, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasBottomPadding"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v64 = v20;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBRowCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", objc_msgSend(v20, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v63 = v21;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = (void *)objc_msgSend(v21, "copy");
      -[_SFPBRowCardSection setType:](v5, "setType:", v22);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("separatorStyle"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v62 = v23;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBRowCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", objc_msgSend(v23, "intValue"));
    v56 = v14;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("backgroundColor"));
    v24 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = -[_SFPBColor initWithDictionary:]([_SFPBColor alloc], "initWithDictionary:", v24);
      -[_SFPBRowCardSection setBackgroundColor:](v5, "setBackgroundColor:", v25);

    }
    v53 = (void *)v24;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("image"));
    v26 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v61 = (void *)v26;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = -[_SFPBImage initWithDictionary:]([_SFPBImage alloc], "initWithDictionary:", v26);
      -[_SFPBRowCardSection setImage:](v5, "setImage:", v27);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("imageIsRightAligned"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBRowCardSection setImageIsRightAligned:](v5, "setImageIsRightAligned:", objc_msgSend(v28, "BOOLValue"));
    v52 = v28;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("leadingText"));
    v29 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v60 = (void *)v29;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v30 = -[_SFPBRichText initWithDictionary:]([_SFPBRichText alloc], "initWithDictionary:", v29);
      -[_SFPBRowCardSection setLeadingText:](v5, "setLeadingText:", v30);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trailingText"));
    v31 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v59 = (void *)v31;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v32 = -[_SFPBRichText initWithDictionary:]([_SFPBRichText alloc], "initWithDictionary:", v31);
      -[_SFPBRowCardSection setTrailingText:](v5, "setTrailingText:", v32);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("attributionImage"));
    v33 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v58 = (void *)v33;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v34 = -[_SFPBImage initWithDictionary:]([_SFPBImage alloc], "initWithDictionary:", v33);
      -[_SFPBRowCardSection setAttributionImage:](v5, "setAttributionImage:", v34);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("key"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v36 = (void *)objc_msgSend(v35, "copy");
      -[_SFPBRowCardSection setKey:](v5, "setKey:", v36);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("keyNoWrap"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBRowCardSection setKeyNoWrap:](v5, "setKeyNoWrap:", objc_msgSend(v37, "BOOLValue"));
    v51 = v35;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("keyWeight"), v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBRowCardSection setKeyWeight:](v5, "setKeyWeight:", objc_msgSend(v38, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("value"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v40 = (void *)objc_msgSend(v39, "copy");
      -[_SFPBRowCardSection setValue:](v5, "setValue:", v40);

    }
    v55 = v16;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("valueNoWrap"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBRowCardSection setValueNoWrap:](v5, "setValueNoWrap:", objc_msgSend(v41, "BOOLValue"));
    v54 = v18;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("valueWeight"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBRowCardSection setValueWeight:](v5, "setValueWeight:", objc_msgSend(v42, "intValue"));
    v57 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cardPaddingBottom"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBRowCardSection setCardPaddingBottom:](v5, "setCardPaddingBottom:", objc_msgSend(v43, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("leadingSubtitle"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v45 = -[_SFPBRichText initWithDictionary:]([_SFPBRichText alloc], "initWithDictionary:", v44);
      -[_SFPBRowCardSection setLeadingSubtitle:](v5, "setLeadingSubtitle:", v45);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trailingSubtitle"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v47 = -[_SFPBRichText initWithDictionary:]([_SFPBRichText alloc], "initWithDictionary:", v46);
      -[_SFPBRowCardSection setTrailingSubtitle:](v5, "setTrailingSubtitle:", v47);

    }
    v48 = v5;

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

- (_SFPBImage)image
{
  return self->_image;
}

- (BOOL)imageIsRightAligned
{
  return self->_imageIsRightAligned;
}

- (_SFPBRichText)leadingText
{
  return self->_leadingText;
}

- (_SFPBRichText)trailingText
{
  return self->_trailingText;
}

- (_SFPBImage)attributionImage
{
  return self->_attributionImage;
}

- (NSString)key
{
  return self->_key;
}

- (BOOL)keyNoWrap
{
  return self->_keyNoWrap;
}

- (int)keyWeight
{
  return self->_keyWeight;
}

- (NSString)value
{
  return self->_value;
}

- (BOOL)valueNoWrap
{
  return self->_valueNoWrap;
}

- (int)valueWeight
{
  return self->_valueWeight;
}

- (BOOL)cardPaddingBottom
{
  return self->_cardPaddingBottom;
}

- (_SFPBRichText)leadingSubtitle
{
  return self->_leadingSubtitle;
}

- (_SFPBRichText)trailingSubtitle
{
  return self->_trailingSubtitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingSubtitle, 0);
  objc_storeStrong((id *)&self->_leadingSubtitle, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_attributionImage, 0);
  objc_storeStrong((id *)&self->_trailingText, 0);
  objc_storeStrong((id *)&self->_leadingText, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_punchoutPickerDismissText, 0);
  objc_storeStrong((id *)&self->_punchoutPickerTitle, 0);
  objc_storeStrong((id *)&self->_punchoutOptions, 0);
}

@end
