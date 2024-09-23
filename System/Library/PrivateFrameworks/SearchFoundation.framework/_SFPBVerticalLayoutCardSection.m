@implementation _SFPBVerticalLayoutCardSection

- (_SFPBVerticalLayoutCardSection)initWithFacade:(id)a3
{
  id v4;
  _SFPBVerticalLayoutCardSection *v5;
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
  _SFPBRichText *v37;
  void *v38;
  _SFPBRichText *v39;
  _SFPBVerticalLayoutCardSection *v40;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[_SFPBVerticalLayoutCardSection init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "punchoutOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v7 = 0;

    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    objc_msgSend(v4, "punchoutOptions", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v43 != v11)
            objc_enumerationMutation(v8);
          v13 = -[_SFPBPunchout initWithFacade:]([_SFPBPunchout alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i));
          if (v13)
            objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
      }
      while (v10);
    }

    -[_SFPBVerticalLayoutCardSection setPunchoutOptions:](v5, "setPunchoutOptions:", v7);
    objc_msgSend(v4, "punchoutPickerTitle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v4, "punchoutPickerTitle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBVerticalLayoutCardSection setPunchoutPickerTitle:](v5, "setPunchoutPickerTitle:", v15);

    }
    objc_msgSend(v4, "punchoutPickerDismissText");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v4, "punchoutPickerDismissText");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBVerticalLayoutCardSection setPunchoutPickerDismissText:](v5, "setPunchoutPickerDismissText:", v17);

    }
    if (objc_msgSend(v4, "hasCanBeHidden"))
      -[_SFPBVerticalLayoutCardSection setCanBeHidden:](v5, "setCanBeHidden:", objc_msgSend(v4, "canBeHidden"));
    if (objc_msgSend(v4, "hasHasTopPadding"))
      -[_SFPBVerticalLayoutCardSection setHasTopPadding:](v5, "setHasTopPadding:", objc_msgSend(v4, "hasTopPadding"));
    if (objc_msgSend(v4, "hasHasBottomPadding"))
      -[_SFPBVerticalLayoutCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", objc_msgSend(v4, "hasBottomPadding"));
    objc_msgSend(v4, "type");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v4, "type");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBVerticalLayoutCardSection setType:](v5, "setType:", v19);

    }
    if (objc_msgSend(v4, "hasSeparatorStyle"))
      -[_SFPBVerticalLayoutCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", objc_msgSend(v4, "separatorStyle"));
    objc_msgSend(v4, "backgroundColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v21 = [_SFPBColor alloc];
      objc_msgSend(v4, "backgroundColor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[_SFPBColor initWithFacade:](v21, "initWithFacade:", v22);
      -[_SFPBVerticalLayoutCardSection setBackgroundColor:](v5, "setBackgroundColor:", v23);

    }
    objc_msgSend(v4, "thumbnail");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      v25 = [_SFPBImage alloc];
      objc_msgSend(v4, "thumbnail");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[_SFPBImage initWithFacade:](v25, "initWithFacade:", v26);
      -[_SFPBVerticalLayoutCardSection setThumbnail:](v5, "setThumbnail:", v27);

    }
    objc_msgSend(v4, "title");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      v29 = [_SFPBRichText alloc];
      objc_msgSend(v4, "title");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = -[_SFPBRichText initWithFacade:](v29, "initWithFacade:", v30);
      -[_SFPBVerticalLayoutCardSection setTitle:](v5, "setTitle:", v31);

    }
    objc_msgSend(v4, "footnote");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      v33 = [_SFPBRichText alloc];
      objc_msgSend(v4, "footnote");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = -[_SFPBRichText initWithFacade:](v33, "initWithFacade:", v34);
      -[_SFPBVerticalLayoutCardSection setFootnote:](v5, "setFootnote:", v35);

    }
    if (objc_msgSend(v4, "hasContentsLeading"))
      -[_SFPBVerticalLayoutCardSection setContentsLeading:](v5, "setContentsLeading:", objc_msgSend(v4, "contentsLeading"));
    objc_msgSend(v4, "thumbnailOverlayText");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      v37 = [_SFPBRichText alloc];
      objc_msgSend(v4, "thumbnailOverlayText");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = -[_SFPBRichText initWithFacade:](v37, "initWithFacade:", v38);
      -[_SFPBVerticalLayoutCardSection setThumbnailOverlayText:](v5, "setThumbnailOverlayText:", v39);

    }
    if (objc_msgSend(v4, "hasUseAppIconMetrics"))
      -[_SFPBVerticalLayoutCardSection setUseAppIconMetrics:](v5, "setUseAppIconMetrics:", objc_msgSend(v4, "useAppIconMetrics"));
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

- (void)setThumbnail:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnail, a3);
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (void)setFootnote:(id)a3
{
  objc_storeStrong((id *)&self->_footnote, a3);
}

- (void)setContentsLeading:(BOOL)a3
{
  self->_contentsLeading = a3;
}

- (void)setThumbnailOverlayText:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailOverlayText, a3);
}

- (void)setUseAppIconMetrics:(BOOL)a3
{
  self->_useAppIconMetrics = a3;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBVerticalLayoutCardSectionReadFrom(self, (uint64_t)a3);
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
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_SFPBVerticalLayoutCardSection punchoutOptions](self, "punchoutOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  -[_SFPBVerticalLayoutCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    PBDataWriterWriteStringField();

  -[_SFPBVerticalLayoutCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    PBDataWriterWriteStringField();

  if (-[_SFPBVerticalLayoutCardSection canBeHidden](self, "canBeHidden"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBVerticalLayoutCardSection hasTopPadding](self, "hasTopPadding"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBVerticalLayoutCardSection hasBottomPadding](self, "hasBottomPadding"))
    PBDataWriterWriteBOOLField();
  -[_SFPBVerticalLayoutCardSection type](self, "type");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    PBDataWriterWriteStringField();

  if (-[_SFPBVerticalLayoutCardSection separatorStyle](self, "separatorStyle"))
    PBDataWriterWriteInt32Field();
  -[_SFPBVerticalLayoutCardSection backgroundColor](self, "backgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    PBDataWriterWriteSubmessage();

  -[_SFPBVerticalLayoutCardSection thumbnail](self, "thumbnail");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    PBDataWriterWriteSubmessage();

  -[_SFPBVerticalLayoutCardSection title](self, "title");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    PBDataWriterWriteSubmessage();

  -[_SFPBVerticalLayoutCardSection footnote](self, "footnote");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    PBDataWriterWriteSubmessage();

  if (-[_SFPBVerticalLayoutCardSection contentsLeading](self, "contentsLeading"))
    PBDataWriterWriteBOOLField();
  -[_SFPBVerticalLayoutCardSection thumbnailOverlayText](self, "thumbnailOverlayText");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    PBDataWriterWriteSubmessage();

  if (-[_SFPBVerticalLayoutCardSection useAppIconMetrics](self, "useAppIconMetrics"))
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
  int contentsLeading;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  BOOL v57;
  int useAppIconMetrics;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_52;
  -[_SFPBVerticalLayoutCardSection punchoutOptions](self, "punchoutOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "punchoutOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_51;
  -[_SFPBVerticalLayoutCardSection punchoutOptions](self, "punchoutOptions");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBVerticalLayoutCardSection punchoutOptions](self, "punchoutOptions");
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
  -[_SFPBVerticalLayoutCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "punchoutPickerTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_51;
  -[_SFPBVerticalLayoutCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBVerticalLayoutCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
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
  -[_SFPBVerticalLayoutCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "punchoutPickerDismissText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_51;
  -[_SFPBVerticalLayoutCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_SFPBVerticalLayoutCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
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
  -[_SFPBVerticalLayoutCardSection type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_51;
  -[_SFPBVerticalLayoutCardSection type](self, "type");
  v25 = objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v26 = (void *)v25;
    -[_SFPBVerticalLayoutCardSection type](self, "type");
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
  -[_SFPBVerticalLayoutCardSection backgroundColor](self, "backgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_51;
  -[_SFPBVerticalLayoutCardSection backgroundColor](self, "backgroundColor");
  v31 = objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    v32 = (void *)v31;
    -[_SFPBVerticalLayoutCardSection backgroundColor](self, "backgroundColor");
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
  -[_SFPBVerticalLayoutCardSection thumbnail](self, "thumbnail");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "thumbnail");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_51;
  -[_SFPBVerticalLayoutCardSection thumbnail](self, "thumbnail");
  v36 = objc_claimAutoreleasedReturnValue();
  if (v36)
  {
    v37 = (void *)v36;
    -[_SFPBVerticalLayoutCardSection thumbnail](self, "thumbnail");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "thumbnail");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v38, "isEqual:", v39);

    if (!v40)
      goto LABEL_52;
  }
  else
  {

  }
  -[_SFPBVerticalLayoutCardSection title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_51;
  -[_SFPBVerticalLayoutCardSection title](self, "title");
  v41 = objc_claimAutoreleasedReturnValue();
  if (v41)
  {
    v42 = (void *)v41;
    -[_SFPBVerticalLayoutCardSection title](self, "title");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "title");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v43, "isEqual:", v44);

    if (!v45)
      goto LABEL_52;
  }
  else
  {

  }
  -[_SFPBVerticalLayoutCardSection footnote](self, "footnote");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "footnote");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_51;
  -[_SFPBVerticalLayoutCardSection footnote](self, "footnote");
  v46 = objc_claimAutoreleasedReturnValue();
  if (v46)
  {
    v47 = (void *)v46;
    -[_SFPBVerticalLayoutCardSection footnote](self, "footnote");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "footnote");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v48, "isEqual:", v49);

    if (!v50)
      goto LABEL_52;
  }
  else
  {

  }
  contentsLeading = self->_contentsLeading;
  if (contentsLeading != objc_msgSend(v4, "contentsLeading"))
    goto LABEL_52;
  -[_SFPBVerticalLayoutCardSection thumbnailOverlayText](self, "thumbnailOverlayText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "thumbnailOverlayText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_51:

    goto LABEL_52;
  }
  -[_SFPBVerticalLayoutCardSection thumbnailOverlayText](self, "thumbnailOverlayText");
  v52 = objc_claimAutoreleasedReturnValue();
  if (!v52)
  {

LABEL_55:
    useAppIconMetrics = self->_useAppIconMetrics;
    v57 = useAppIconMetrics == objc_msgSend(v4, "useAppIconMetrics");
    goto LABEL_53;
  }
  v53 = (void *)v52;
  -[_SFPBVerticalLayoutCardSection thumbnailOverlayText](self, "thumbnailOverlayText");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "thumbnailOverlayText");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v54, "isEqual:", v55);

  if (v56)
    goto LABEL_55;
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
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  NSUInteger v19;
  NSUInteger v20;
  uint64_t v21;

  v21 = -[NSArray hash](self->_punchoutOptions, "hash");
  v20 = -[NSString hash](self->_punchoutPickerTitle, "hash");
  v3 = -[NSString hash](self->_punchoutPickerDismissText, "hash");
  if (self->_canBeHidden)
    v4 = 2654435761;
  else
    v4 = 0;
  v18 = v4;
  v19 = v3;
  if (self->_hasTopPadding)
    v5 = 2654435761;
  else
    v5 = 0;
  v17 = v5;
  if (self->_hasBottomPadding)
    v6 = 2654435761;
  else
    v6 = 0;
  v7 = -[NSString hash](self->_type, "hash");
  v8 = 2654435761 * self->_separatorStyle;
  v9 = -[_SFPBColor hash](self->_backgroundColor, "hash");
  v10 = -[_SFPBImage hash](self->_thumbnail, "hash");
  v11 = -[_SFPBRichText hash](self->_title, "hash");
  v12 = -[_SFPBRichText hash](self->_footnote, "hash");
  if (self->_contentsLeading)
    v13 = 2654435761;
  else
    v13 = 0;
  v14 = -[_SFPBRichText hash](self->_thumbnailOverlayText, "hash");
  if (self->_useAppIconMetrics)
    v15 = 2654435761;
  else
    v15 = 0;
  return v20 ^ v21 ^ v19 ^ v18 ^ v17 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
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
  if (self->_backgroundColor)
  {
    -[_SFPBVerticalLayoutCardSection backgroundColor](self, "backgroundColor");
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
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBVerticalLayoutCardSection canBeHidden](self, "canBeHidden"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("canBeHidden"));

  }
  if (self->_contentsLeading)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBVerticalLayoutCardSection contentsLeading](self, "contentsLeading"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("contentsLeading"));

  }
  if (self->_footnote)
  {
    -[_SFPBVerticalLayoutCardSection footnote](self, "footnote");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("footnote"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("footnote"));

    }
  }
  if (self->_hasBottomPadding)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBVerticalLayoutCardSection hasBottomPadding](self, "hasBottomPadding"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("hasBottomPadding"));

  }
  if (self->_hasTopPadding)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBVerticalLayoutCardSection hasTopPadding](self, "hasTopPadding"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("hasTopPadding"));

  }
  if (-[NSArray count](self->_punchoutOptions, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v15 = self->_punchoutOptions;
    v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v42 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * i), "dictionaryRepresentation");
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
        v17 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      }
      while (v17);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("punchoutOptions"));
  }
  if (self->_punchoutPickerDismissText)
  {
    -[_SFPBVerticalLayoutCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v22, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("punchoutPickerDismissText"));

  }
  if (self->_punchoutPickerTitle)
  {
    -[_SFPBVerticalLayoutCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v24, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("punchoutPickerTitle"));

  }
  if (self->_separatorStyle)
  {
    v26 = -[_SFPBVerticalLayoutCardSection separatorStyle](self, "separatorStyle");
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
  if (self->_thumbnail)
  {
    -[_SFPBVerticalLayoutCardSection thumbnail](self, "thumbnail");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "dictionaryRepresentation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("thumbnail"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("thumbnail"));

    }
  }
  if (self->_thumbnailOverlayText)
  {
    -[_SFPBVerticalLayoutCardSection thumbnailOverlayText](self, "thumbnailOverlayText");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "dictionaryRepresentation");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("thumbnailOverlayText"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("thumbnailOverlayText"));

    }
  }
  if (self->_title)
  {
    -[_SFPBVerticalLayoutCardSection title](self, "title");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "dictionaryRepresentation");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("title"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("title"));

    }
  }
  if (self->_type)
  {
    -[_SFPBVerticalLayoutCardSection type](self, "type");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)objc_msgSend(v37, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, CFSTR("type"));

  }
  if (self->_useAppIconMetrics)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBVerticalLayoutCardSection useAppIconMetrics](self, "useAppIconMetrics"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, CFSTR("useAppIconMetrics"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBVerticalLayoutCardSection dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBVerticalLayoutCardSection)initWithJSON:(id)a3
{
  void *v4;
  _SFPBVerticalLayoutCardSection *v5;
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
    self = -[_SFPBVerticalLayoutCardSection initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBVerticalLayoutCardSection)initWithDictionary:(id)a3
{
  id v4;
  _SFPBVerticalLayoutCardSection *v5;
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
  _SFPBImage *v27;
  void *v28;
  _SFPBRichText *v29;
  void *v30;
  _SFPBRichText *v31;
  void *v32;
  void *v33;
  void *v34;
  _SFPBRichText *v35;
  void *v36;
  _SFPBVerticalLayoutCardSection *v37;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  objc_super v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)_SFPBVerticalLayoutCardSection;
  v5 = -[_SFPBVerticalLayoutCardSection init](&v50, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("punchoutOptions"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v47;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v47 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * v11);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v13 = -[_SFPBPunchout initWithDictionary:]([_SFPBPunchout alloc], "initWithDictionary:", v12);
              -[_SFPBVerticalLayoutCardSection addPunchoutOptions:](v5, "addPunchoutOptions:", v13);

            }
            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
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
      -[_SFPBVerticalLayoutCardSection setPunchoutPickerTitle:](v5, "setPunchoutPickerTitle:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("punchoutPickerDismissText"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = (void *)objc_msgSend(v16, "copy");
      -[_SFPBVerticalLayoutCardSection setPunchoutPickerDismissText:](v5, "setPunchoutPickerDismissText:", v17);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("canBeHidden"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBVerticalLayoutCardSection setCanBeHidden:](v5, "setCanBeHidden:", objc_msgSend(v18, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasTopPadding"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBVerticalLayoutCardSection setHasTopPadding:](v5, "setHasTopPadding:", objc_msgSend(v19, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasBottomPadding"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBVerticalLayoutCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", objc_msgSend(v20, "BOOLValue"));
    v42 = v18;
    v45 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = (void *)objc_msgSend(v21, "copy");
      -[_SFPBVerticalLayoutCardSection setType:](v5, "setType:", v22);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("separatorStyle"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBVerticalLayoutCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", objc_msgSend(v23, "intValue"));
    v39 = v23;
    v44 = v14;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("backgroundColor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = -[_SFPBColor initWithDictionary:]([_SFPBColor alloc], "initWithDictionary:", v24);
      -[_SFPBVerticalLayoutCardSection setBackgroundColor:](v5, "setBackgroundColor:", v25);

    }
    v43 = v16;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("thumbnail"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = -[_SFPBImage initWithDictionary:]([_SFPBImage alloc], "initWithDictionary:", v26);
      -[_SFPBVerticalLayoutCardSection setThumbnail:](v5, "setThumbnail:", v27);

    }
    v41 = v19;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("title"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v29 = -[_SFPBRichText initWithDictionary:]([_SFPBRichText alloc], "initWithDictionary:", v28);
      -[_SFPBVerticalLayoutCardSection setTitle:](v5, "setTitle:", v29);

    }
    v40 = v21;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("footnote"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v31 = -[_SFPBRichText initWithDictionary:]([_SFPBRichText alloc], "initWithDictionary:", v30);
      -[_SFPBVerticalLayoutCardSection setFootnote:](v5, "setFootnote:", v31);

    }
    v32 = v20;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contentsLeading"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBVerticalLayoutCardSection setContentsLeading:](v5, "setContentsLeading:", objc_msgSend(v33, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("thumbnailOverlayText"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v35 = -[_SFPBRichText initWithDictionary:]([_SFPBRichText alloc], "initWithDictionary:", v34);
      -[_SFPBVerticalLayoutCardSection setThumbnailOverlayText:](v5, "setThumbnailOverlayText:", v35);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("useAppIconMetrics"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBVerticalLayoutCardSection setUseAppIconMetrics:](v5, "setUseAppIconMetrics:", objc_msgSend(v36, "BOOLValue"));
    v37 = v5;

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

- (_SFPBImage)thumbnail
{
  return self->_thumbnail;
}

- (_SFPBRichText)title
{
  return self->_title;
}

- (_SFPBRichText)footnote
{
  return self->_footnote;
}

- (BOOL)contentsLeading
{
  return self->_contentsLeading;
}

- (_SFPBRichText)thumbnailOverlayText
{
  return self->_thumbnailOverlayText;
}

- (BOOL)useAppIconMetrics
{
  return self->_useAppIconMetrics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailOverlayText, 0);
  objc_storeStrong((id *)&self->_footnote, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_punchoutPickerDismissText, 0);
  objc_storeStrong((id *)&self->_punchoutPickerTitle, 0);
  objc_storeStrong((id *)&self->_punchoutOptions, 0);
}

@end
