@implementation _SFPBCompactRowCardSection

- (_SFPBCompactRowCardSection)initWithFacade:(id)a3
{
  id v4;
  _SFPBCompactRowCardSection *v5;
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
  _SFPBRichText *v29;
  void *v30;
  _SFPBRichText *v31;
  void *v32;
  _SFPBImage *v33;
  void *v34;
  _SFPBImage *v35;
  _SFPBCompactRowCardSection *v36;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[_SFPBCompactRowCardSection init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "punchoutOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v7 = 0;

    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    objc_msgSend(v4, "punchoutOptions", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v39 != v11)
            objc_enumerationMutation(v8);
          v13 = -[_SFPBPunchout initWithFacade:]([_SFPBPunchout alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i));
          if (v13)
            objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      }
      while (v10);
    }

    -[_SFPBCompactRowCardSection setPunchoutOptions:](v5, "setPunchoutOptions:", v7);
    objc_msgSend(v4, "punchoutPickerTitle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v4, "punchoutPickerTitle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBCompactRowCardSection setPunchoutPickerTitle:](v5, "setPunchoutPickerTitle:", v15);

    }
    objc_msgSend(v4, "punchoutPickerDismissText");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v4, "punchoutPickerDismissText");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBCompactRowCardSection setPunchoutPickerDismissText:](v5, "setPunchoutPickerDismissText:", v17);

    }
    if (objc_msgSend(v4, "hasCanBeHidden"))
      -[_SFPBCompactRowCardSection setCanBeHidden:](v5, "setCanBeHidden:", objc_msgSend(v4, "canBeHidden"));
    if (objc_msgSend(v4, "hasHasTopPadding"))
      -[_SFPBCompactRowCardSection setHasTopPadding:](v5, "setHasTopPadding:", objc_msgSend(v4, "hasTopPadding"));
    if (objc_msgSend(v4, "hasHasBottomPadding"))
      -[_SFPBCompactRowCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", objc_msgSend(v4, "hasBottomPadding"));
    objc_msgSend(v4, "type");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v4, "type");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBCompactRowCardSection setType:](v5, "setType:", v19);

    }
    if (objc_msgSend(v4, "hasSeparatorStyle"))
      -[_SFPBCompactRowCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", objc_msgSend(v4, "separatorStyle"));
    objc_msgSend(v4, "backgroundColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v21 = [_SFPBColor alloc];
      objc_msgSend(v4, "backgroundColor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[_SFPBColor initWithFacade:](v21, "initWithFacade:", v22);
      -[_SFPBCompactRowCardSection setBackgroundColor:](v5, "setBackgroundColor:", v23);

    }
    objc_msgSend(v4, "title");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      v25 = [_SFPBRichText alloc];
      objc_msgSend(v4, "title");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[_SFPBRichText initWithFacade:](v25, "initWithFacade:", v26);
      -[_SFPBCompactRowCardSection setTitle:](v5, "setTitle:", v27);

    }
    objc_msgSend(v4, "subtitle");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      v29 = [_SFPBRichText alloc];
      objc_msgSend(v4, "subtitle");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = -[_SFPBRichText initWithFacade:](v29, "initWithFacade:", v30);
      -[_SFPBCompactRowCardSection setSubtitle:](v5, "setSubtitle:", v31);

    }
    if (objc_msgSend(v4, "hasIsSubtitleDetatched"))
      -[_SFPBCompactRowCardSection setIsSubtitleDetatched:](v5, "setIsSubtitleDetatched:", objc_msgSend(v4, "isSubtitleDetatched"));
    objc_msgSend(v4, "image");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      v33 = [_SFPBImage alloc];
      objc_msgSend(v4, "image");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = -[_SFPBImage initWithFacade:](v33, "initWithFacade:", v34);
      -[_SFPBCompactRowCardSection setImage:](v5, "setImage:", v35);

    }
    v36 = v5;

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
  objc_storeStrong((id *)&self->_title, a3);
}

- (void)setSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_subtitle, a3);
}

- (void)setIsSubtitleDetatched:(BOOL)a3
{
  self->_isSubtitleDetatched = a3;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBCompactRowCardSectionReadFrom(self, (uint64_t)a3);
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
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_SFPBCompactRowCardSection punchoutOptions](self, "punchoutOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  -[_SFPBCompactRowCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    PBDataWriterWriteStringField();

  -[_SFPBCompactRowCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    PBDataWriterWriteStringField();

  if (-[_SFPBCompactRowCardSection canBeHidden](self, "canBeHidden"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBCompactRowCardSection hasTopPadding](self, "hasTopPadding"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBCompactRowCardSection hasBottomPadding](self, "hasBottomPadding"))
    PBDataWriterWriteBOOLField();
  -[_SFPBCompactRowCardSection type](self, "type");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    PBDataWriterWriteStringField();

  if (-[_SFPBCompactRowCardSection separatorStyle](self, "separatorStyle"))
    PBDataWriterWriteInt32Field();
  -[_SFPBCompactRowCardSection backgroundColor](self, "backgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    PBDataWriterWriteSubmessage();

  -[_SFPBCompactRowCardSection title](self, "title");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    PBDataWriterWriteSubmessage();

  -[_SFPBCompactRowCardSection subtitle](self, "subtitle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    PBDataWriterWriteSubmessage();

  if (-[_SFPBCompactRowCardSection isSubtitleDetatched](self, "isSubtitleDetatched"))
    PBDataWriterWriteBOOLField();
  -[_SFPBCompactRowCardSection image](self, "image");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
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
  int isSubtitleDetatched;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  char v51;
  BOOL v52;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_47;
  -[_SFPBCompactRowCardSection punchoutOptions](self, "punchoutOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "punchoutOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_46;
  -[_SFPBCompactRowCardSection punchoutOptions](self, "punchoutOptions");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBCompactRowCardSection punchoutOptions](self, "punchoutOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "punchoutOptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_47;
  }
  else
  {

  }
  -[_SFPBCompactRowCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "punchoutPickerTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_46;
  -[_SFPBCompactRowCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBCompactRowCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "punchoutPickerTitle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_47;
  }
  else
  {

  }
  -[_SFPBCompactRowCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "punchoutPickerDismissText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_46;
  -[_SFPBCompactRowCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_SFPBCompactRowCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "punchoutPickerDismissText");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_47;
  }
  else
  {

  }
  canBeHidden = self->_canBeHidden;
  if (canBeHidden != objc_msgSend(v4, "canBeHidden"))
    goto LABEL_47;
  hasTopPadding = self->_hasTopPadding;
  if (hasTopPadding != objc_msgSend(v4, "hasTopPadding"))
    goto LABEL_47;
  hasBottomPadding = self->_hasBottomPadding;
  if (hasBottomPadding != objc_msgSend(v4, "hasBottomPadding"))
    goto LABEL_47;
  -[_SFPBCompactRowCardSection type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_46;
  -[_SFPBCompactRowCardSection type](self, "type");
  v25 = objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v26 = (void *)v25;
    -[_SFPBCompactRowCardSection type](self, "type");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "type");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v27, "isEqual:", v28);

    if (!v29)
      goto LABEL_47;
  }
  else
  {

  }
  separatorStyle = self->_separatorStyle;
  if (separatorStyle != objc_msgSend(v4, "separatorStyle"))
    goto LABEL_47;
  -[_SFPBCompactRowCardSection backgroundColor](self, "backgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_46;
  -[_SFPBCompactRowCardSection backgroundColor](self, "backgroundColor");
  v31 = objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    v32 = (void *)v31;
    -[_SFPBCompactRowCardSection backgroundColor](self, "backgroundColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "backgroundColor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v33, "isEqual:", v34);

    if (!v35)
      goto LABEL_47;
  }
  else
  {

  }
  -[_SFPBCompactRowCardSection title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_46;
  -[_SFPBCompactRowCardSection title](self, "title");
  v36 = objc_claimAutoreleasedReturnValue();
  if (v36)
  {
    v37 = (void *)v36;
    -[_SFPBCompactRowCardSection title](self, "title");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "title");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v38, "isEqual:", v39);

    if (!v40)
      goto LABEL_47;
  }
  else
  {

  }
  -[_SFPBCompactRowCardSection subtitle](self, "subtitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subtitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_46;
  -[_SFPBCompactRowCardSection subtitle](self, "subtitle");
  v41 = objc_claimAutoreleasedReturnValue();
  if (v41)
  {
    v42 = (void *)v41;
    -[_SFPBCompactRowCardSection subtitle](self, "subtitle");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subtitle");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v43, "isEqual:", v44);

    if (!v45)
      goto LABEL_47;
  }
  else
  {

  }
  isSubtitleDetatched = self->_isSubtitleDetatched;
  if (isSubtitleDetatched != objc_msgSend(v4, "isSubtitleDetatched"))
    goto LABEL_47;
  -[_SFPBCompactRowCardSection image](self, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_46:

    goto LABEL_47;
  }
  -[_SFPBCompactRowCardSection image](self, "image");
  v47 = objc_claimAutoreleasedReturnValue();
  if (!v47)
  {

LABEL_50:
    v52 = 1;
    goto LABEL_48;
  }
  v48 = (void *)v47;
  -[_SFPBCompactRowCardSection image](self, "image");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "image");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v49, "isEqual:", v50);

  if ((v51 & 1) != 0)
    goto LABEL_50;
LABEL_47:
  v52 = 0;
LABEL_48:

  return v52;
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
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  NSUInteger v14;
  uint64_t v15;

  v15 = -[NSArray hash](self->_punchoutOptions, "hash");
  v14 = -[NSString hash](self->_punchoutPickerTitle, "hash");
  v3 = -[NSString hash](self->_punchoutPickerDismissText, "hash");
  if (self->_canBeHidden)
    v4 = 2654435761;
  else
    v4 = 0;
  if (self->_hasTopPadding)
    v5 = 2654435761;
  else
    v5 = 0;
  if (self->_hasBottomPadding)
    v6 = 2654435761;
  else
    v6 = 0;
  v7 = -[NSString hash](self->_type, "hash");
  v8 = 2654435761 * self->_separatorStyle;
  v9 = -[_SFPBColor hash](self->_backgroundColor, "hash");
  v10 = -[_SFPBRichText hash](self->_title, "hash");
  v11 = -[_SFPBRichText hash](self->_subtitle, "hash");
  if (self->_isSubtitleDetatched)
    v12 = 2654435761;
  else
    v12 = 0;
  return v14 ^ v15 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ -[_SFPBImage hash](self->_image, "hash");
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
  void *v34;
  void *v35;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_backgroundColor)
  {
    -[_SFPBCompactRowCardSection backgroundColor](self, "backgroundColor");
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
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBCompactRowCardSection canBeHidden](self, "canBeHidden"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("canBeHidden"));

  }
  if (self->_hasBottomPadding)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBCompactRowCardSection hasBottomPadding](self, "hasBottomPadding"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("hasBottomPadding"));

  }
  if (self->_hasTopPadding)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBCompactRowCardSection hasTopPadding](self, "hasTopPadding"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("hasTopPadding"));

  }
  if (self->_image)
  {
    -[_SFPBCompactRowCardSection image](self, "image");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("image"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("image"));

    }
  }
  if (self->_isSubtitleDetatched)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBCompactRowCardSection isSubtitleDetatched](self, "isSubtitleDetatched"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("isSubtitleDetatched"));

  }
  if (-[NSArray count](self->_punchoutOptions, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v15 = self->_punchoutOptions;
    v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v38 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "dictionaryRepresentation");
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
        v17 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      }
      while (v17);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("punchoutOptions"));
  }
  if (self->_punchoutPickerDismissText)
  {
    -[_SFPBCompactRowCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v22, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("punchoutPickerDismissText"));

  }
  if (self->_punchoutPickerTitle)
  {
    -[_SFPBCompactRowCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v24, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("punchoutPickerTitle"));

  }
  if (self->_separatorStyle)
  {
    v26 = -[_SFPBCompactRowCardSection separatorStyle](self, "separatorStyle");
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
  if (self->_subtitle)
  {
    -[_SFPBCompactRowCardSection subtitle](self, "subtitle");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "dictionaryRepresentation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("subtitle"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("subtitle"));

    }
  }
  if (self->_title)
  {
    -[_SFPBCompactRowCardSection title](self, "title");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "dictionaryRepresentation");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("title"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("title"));

    }
  }
  if (self->_type)
  {
    -[_SFPBCompactRowCardSection type](self, "type");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)objc_msgSend(v34, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("type"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBCompactRowCardSection dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBCompactRowCardSection)initWithJSON:(id)a3
{
  void *v4;
  _SFPBCompactRowCardSection *v5;
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
    self = -[_SFPBCompactRowCardSection initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBCompactRowCardSection)initWithDictionary:(id)a3
{
  id v4;
  _SFPBCompactRowCardSection *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
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
  void *v24;
  _SFPBColor *v25;
  void *v26;
  _SFPBRichText *v27;
  void *v28;
  _SFPBRichText *v29;
  void *v30;
  void *v31;
  _SFPBImage *v32;
  _SFPBCompactRowCardSection *v33;
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
  v45.super_class = (Class)_SFPBCompactRowCardSection;
  v5 = -[_SFPBCompactRowCardSection init](&v45, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("punchoutOptions"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v42;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v42 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v11);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v13 = -[_SFPBPunchout initWithDictionary:]([_SFPBPunchout alloc], "initWithDictionary:", v12);
              -[_SFPBCompactRowCardSection addPunchoutOptions:](v5, "addPunchoutOptions:", v13);

            }
            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
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
      -[_SFPBCompactRowCardSection setPunchoutPickerTitle:](v5, "setPunchoutPickerTitle:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("punchoutPickerDismissText"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = (void *)objc_msgSend(v16, "copy");
      -[_SFPBCompactRowCardSection setPunchoutPickerDismissText:](v5, "setPunchoutPickerDismissText:", v17);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("canBeHidden"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBCompactRowCardSection setCanBeHidden:](v5, "setCanBeHidden:", objc_msgSend(v18, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasTopPadding"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBCompactRowCardSection setHasTopPadding:](v5, "setHasTopPadding:", objc_msgSend(v19, "BOOLValue"));
    v36 = v19;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasBottomPadding"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBCompactRowCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", objc_msgSend(v20, "BOOLValue"));
    v37 = v18;
    v40 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type"), v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = (void *)objc_msgSend(v21, "copy");
      -[_SFPBCompactRowCardSection setType:](v5, "setType:", v22);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("separatorStyle"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBCompactRowCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", objc_msgSend(v23, "intValue"));
    v38 = v16;
    v39 = v14;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("backgroundColor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = -[_SFPBColor initWithDictionary:]([_SFPBColor alloc], "initWithDictionary:", v24);
      -[_SFPBCompactRowCardSection setBackgroundColor:](v5, "setBackgroundColor:", v25);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("title"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = -[_SFPBRichText initWithDictionary:]([_SFPBRichText alloc], "initWithDictionary:", v26);
      -[_SFPBCompactRowCardSection setTitle:](v5, "setTitle:", v27);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("subtitle"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v29 = -[_SFPBRichText initWithDictionary:]([_SFPBRichText alloc], "initWithDictionary:", v28);
      -[_SFPBCompactRowCardSection setSubtitle:](v5, "setSubtitle:", v29);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isSubtitleDetatched"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBCompactRowCardSection setIsSubtitleDetatched:](v5, "setIsSubtitleDetatched:", objc_msgSend(v30, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("image"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v32 = -[_SFPBImage initWithDictionary:]([_SFPBImage alloc], "initWithDictionary:", v31);
      -[_SFPBCompactRowCardSection setImage:](v5, "setImage:", v32);

    }
    v33 = v5;

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

- (_SFPBRichText)title
{
  return self->_title;
}

- (_SFPBRichText)subtitle
{
  return self->_subtitle;
}

- (BOOL)isSubtitleDetatched
{
  return self->_isSubtitleDetatched;
}

- (_SFPBImage)image
{
  return self->_image;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_punchoutPickerDismissText, 0);
  objc_storeStrong((id *)&self->_punchoutPickerTitle, 0);
  objc_storeStrong((id *)&self->_punchoutOptions, 0);
}

@end
