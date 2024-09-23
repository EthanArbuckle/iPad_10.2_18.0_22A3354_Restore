@implementation _SFPBSocialMediaPostCardSection

- (_SFPBSocialMediaPostCardSection)initWithFacade:(id)a3
{
  id v4;
  _SFPBSocialMediaPostCardSection *v5;
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
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _SFPBImage *v31;
  void *v32;
  _SFPBImage *v33;
  void *v34;
  _SFPBImage *v35;
  void *v36;
  _SFPBImage *v37;
  void *v38;
  _SFPBRichText *v39;
  void *v40;
  _SFPBRichText *v41;
  void *v42;
  _SFPBImage *v43;
  void *v44;
  _SFPBImage *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  _SFPBSocialMediaPostCardSection *v50;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[_SFPBSocialMediaPostCardSection init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "punchoutOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v7 = 0;

    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    objc_msgSend(v4, "punchoutOptions", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v53 != v11)
            objc_enumerationMutation(v8);
          v13 = -[_SFPBPunchout initWithFacade:]([_SFPBPunchout alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i));
          if (v13)
            objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
      }
      while (v10);
    }

    -[_SFPBSocialMediaPostCardSection setPunchoutOptions:](v5, "setPunchoutOptions:", v7);
    objc_msgSend(v4, "punchoutPickerTitle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v4, "punchoutPickerTitle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBSocialMediaPostCardSection setPunchoutPickerTitle:](v5, "setPunchoutPickerTitle:", v15);

    }
    objc_msgSend(v4, "punchoutPickerDismissText");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v4, "punchoutPickerDismissText");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBSocialMediaPostCardSection setPunchoutPickerDismissText:](v5, "setPunchoutPickerDismissText:", v17);

    }
    if (objc_msgSend(v4, "hasCanBeHidden"))
      -[_SFPBSocialMediaPostCardSection setCanBeHidden:](v5, "setCanBeHidden:", objc_msgSend(v4, "canBeHidden"));
    if (objc_msgSend(v4, "hasHasTopPadding"))
      -[_SFPBSocialMediaPostCardSection setHasTopPadding:](v5, "setHasTopPadding:", objc_msgSend(v4, "hasTopPadding"));
    if (objc_msgSend(v4, "hasHasBottomPadding"))
      -[_SFPBSocialMediaPostCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", objc_msgSend(v4, "hasBottomPadding"));
    objc_msgSend(v4, "type");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v4, "type");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBSocialMediaPostCardSection setType:](v5, "setType:", v19);

    }
    if (objc_msgSend(v4, "hasSeparatorStyle"))
      -[_SFPBSocialMediaPostCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", objc_msgSend(v4, "separatorStyle"));
    objc_msgSend(v4, "backgroundColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v21 = [_SFPBColor alloc];
      objc_msgSend(v4, "backgroundColor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[_SFPBColor initWithFacade:](v21, "initWithFacade:", v22);
      -[_SFPBSocialMediaPostCardSection setBackgroundColor:](v5, "setBackgroundColor:", v23);

    }
    objc_msgSend(v4, "name");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v4, "name");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBSocialMediaPostCardSection setName:](v5, "setName:", v25);

    }
    if (objc_msgSend(v4, "hasNameNoWrap"))
      -[_SFPBSocialMediaPostCardSection setNameNoWrap:](v5, "setNameNoWrap:", objc_msgSend(v4, "nameNoWrap"));
    objc_msgSend(v4, "nameMaxLines");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      objc_msgSend(v4, "nameMaxLines");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBSocialMediaPostCardSection setNameMaxLines:](v5, "setNameMaxLines:", objc_msgSend(v27, "intValue"));

    }
    objc_msgSend(v4, "handle");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend(v4, "handle");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBSocialMediaPostCardSection setHandle:](v5, "setHandle:", v29);

    }
    objc_msgSend(v4, "verifiedGlyph");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      v31 = [_SFPBImage alloc];
      objc_msgSend(v4, "verifiedGlyph");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = -[_SFPBImage initWithFacade:](v31, "initWithFacade:", v32);
      -[_SFPBSocialMediaPostCardSection setVerifiedGlyph:](v5, "setVerifiedGlyph:", v33);

    }
    objc_msgSend(v4, "profilePicture");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      v35 = [_SFPBImage alloc];
      objc_msgSend(v4, "profilePicture");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = -[_SFPBImage initWithFacade:](v35, "initWithFacade:", v36);
      -[_SFPBSocialMediaPostCardSection setProfilePicture:](v5, "setProfilePicture:", v37);

    }
    objc_msgSend(v4, "post");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      v39 = [_SFPBRichText alloc];
      objc_msgSend(v4, "post");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = -[_SFPBRichText initWithFacade:](v39, "initWithFacade:", v40);
      -[_SFPBSocialMediaPostCardSection setPost:](v5, "setPost:", v41);

    }
    objc_msgSend(v4, "picture");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42)
    {
      v43 = [_SFPBImage alloc];
      objc_msgSend(v4, "picture");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = -[_SFPBImage initWithFacade:](v43, "initWithFacade:", v44);
      -[_SFPBSocialMediaPostCardSection setPicture:](v5, "setPicture:", v45);

    }
    objc_msgSend(v4, "timestamp");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (v46)
    {
      objc_msgSend(v4, "timestamp");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBSocialMediaPostCardSection setTimestamp:](v5, "setTimestamp:", v47);

    }
    objc_msgSend(v4, "footnote");
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    if (v48)
    {
      objc_msgSend(v4, "footnote");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBSocialMediaPostCardSection setFootnote:](v5, "setFootnote:", v49);

    }
    v50 = v5;

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

- (void)setName:(id)a3
{
  NSString *v4;
  NSString *name;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  name = self->_name;
  self->_name = v4;

}

- (void)setNameNoWrap:(BOOL)a3
{
  self->_nameNoWrap = a3;
}

- (void)setNameMaxLines:(int)a3
{
  self->_nameMaxLines = a3;
}

- (void)setHandle:(id)a3
{
  NSString *v4;
  NSString *handle;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  handle = self->_handle;
  self->_handle = v4;

}

- (void)setVerifiedGlyph:(id)a3
{
  objc_storeStrong((id *)&self->_verifiedGlyph, a3);
}

- (void)setProfilePicture:(id)a3
{
  objc_storeStrong((id *)&self->_profilePicture, a3);
}

- (void)setPost:(id)a3
{
  objc_storeStrong((id *)&self->_post, a3);
}

- (void)setPicture:(id)a3
{
  objc_storeStrong((id *)&self->_picture, a3);
}

- (void)setTimestamp:(id)a3
{
  NSString *v4;
  NSString *timestamp;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  timestamp = self->_timestamp;
  self->_timestamp = v4;

}

- (void)setFootnote:(id)a3
{
  NSString *v4;
  NSString *footnote;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  footnote = self->_footnote;
  self->_footnote = v4;

}

- (BOOL)readFrom:(id)a3
{
  return _SFPBSocialMediaPostCardSectionReadFrom(self, (uint64_t)a3);
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
  -[_SFPBSocialMediaPostCardSection punchoutOptions](self, "punchoutOptions");
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

  -[_SFPBSocialMediaPostCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    PBDataWriterWriteStringField();

  -[_SFPBSocialMediaPostCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    PBDataWriterWriteStringField();

  if (-[_SFPBSocialMediaPostCardSection canBeHidden](self, "canBeHidden"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBSocialMediaPostCardSection hasTopPadding](self, "hasTopPadding"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBSocialMediaPostCardSection hasBottomPadding](self, "hasBottomPadding"))
    PBDataWriterWriteBOOLField();
  -[_SFPBSocialMediaPostCardSection type](self, "type");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    PBDataWriterWriteStringField();

  if (-[_SFPBSocialMediaPostCardSection separatorStyle](self, "separatorStyle"))
    PBDataWriterWriteInt32Field();
  -[_SFPBSocialMediaPostCardSection backgroundColor](self, "backgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    PBDataWriterWriteSubmessage();

  -[_SFPBSocialMediaPostCardSection name](self, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    PBDataWriterWriteStringField();

  if (-[_SFPBSocialMediaPostCardSection nameNoWrap](self, "nameNoWrap"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBSocialMediaPostCardSection nameMaxLines](self, "nameMaxLines"))
    PBDataWriterWriteInt32Field();
  -[_SFPBSocialMediaPostCardSection handle](self, "handle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    PBDataWriterWriteStringField();

  -[_SFPBSocialMediaPostCardSection verifiedGlyph](self, "verifiedGlyph");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    PBDataWriterWriteSubmessage();

  -[_SFPBSocialMediaPostCardSection profilePicture](self, "profilePicture");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    PBDataWriterWriteSubmessage();

  -[_SFPBSocialMediaPostCardSection post](self, "post");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
    PBDataWriterWriteSubmessage();

  -[_SFPBSocialMediaPostCardSection picture](self, "picture");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    PBDataWriterWriteSubmessage();

  -[_SFPBSocialMediaPostCardSection timestamp](self, "timestamp");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
    PBDataWriterWriteStringField();

  -[_SFPBSocialMediaPostCardSection footnote](self, "footnote");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
    PBDataWriterWriteStringField();

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
  int nameNoWrap;
  int nameMaxLines;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
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
  int v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  int v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  char v77;
  BOOL v78;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_73;
  -[_SFPBSocialMediaPostCardSection punchoutOptions](self, "punchoutOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "punchoutOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_72;
  -[_SFPBSocialMediaPostCardSection punchoutOptions](self, "punchoutOptions");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBSocialMediaPostCardSection punchoutOptions](self, "punchoutOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "punchoutOptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_73;
  }
  else
  {

  }
  -[_SFPBSocialMediaPostCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "punchoutPickerTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_72;
  -[_SFPBSocialMediaPostCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBSocialMediaPostCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "punchoutPickerTitle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_73;
  }
  else
  {

  }
  -[_SFPBSocialMediaPostCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "punchoutPickerDismissText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_72;
  -[_SFPBSocialMediaPostCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_SFPBSocialMediaPostCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "punchoutPickerDismissText");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_73;
  }
  else
  {

  }
  canBeHidden = self->_canBeHidden;
  if (canBeHidden != objc_msgSend(v4, "canBeHidden"))
    goto LABEL_73;
  hasTopPadding = self->_hasTopPadding;
  if (hasTopPadding != objc_msgSend(v4, "hasTopPadding"))
    goto LABEL_73;
  hasBottomPadding = self->_hasBottomPadding;
  if (hasBottomPadding != objc_msgSend(v4, "hasBottomPadding"))
    goto LABEL_73;
  -[_SFPBSocialMediaPostCardSection type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_72;
  -[_SFPBSocialMediaPostCardSection type](self, "type");
  v25 = objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v26 = (void *)v25;
    -[_SFPBSocialMediaPostCardSection type](self, "type");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "type");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v27, "isEqual:", v28);

    if (!v29)
      goto LABEL_73;
  }
  else
  {

  }
  separatorStyle = self->_separatorStyle;
  if (separatorStyle != objc_msgSend(v4, "separatorStyle"))
    goto LABEL_73;
  -[_SFPBSocialMediaPostCardSection backgroundColor](self, "backgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_72;
  -[_SFPBSocialMediaPostCardSection backgroundColor](self, "backgroundColor");
  v31 = objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    v32 = (void *)v31;
    -[_SFPBSocialMediaPostCardSection backgroundColor](self, "backgroundColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "backgroundColor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v33, "isEqual:", v34);

    if (!v35)
      goto LABEL_73;
  }
  else
  {

  }
  -[_SFPBSocialMediaPostCardSection name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_72;
  -[_SFPBSocialMediaPostCardSection name](self, "name");
  v36 = objc_claimAutoreleasedReturnValue();
  if (v36)
  {
    v37 = (void *)v36;
    -[_SFPBSocialMediaPostCardSection name](self, "name");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v38, "isEqual:", v39);

    if (!v40)
      goto LABEL_73;
  }
  else
  {

  }
  nameNoWrap = self->_nameNoWrap;
  if (nameNoWrap != objc_msgSend(v4, "nameNoWrap"))
    goto LABEL_73;
  nameMaxLines = self->_nameMaxLines;
  if (nameMaxLines != objc_msgSend(v4, "nameMaxLines"))
    goto LABEL_73;
  -[_SFPBSocialMediaPostCardSection handle](self, "handle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_72;
  -[_SFPBSocialMediaPostCardSection handle](self, "handle");
  v43 = objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    v44 = (void *)v43;
    -[_SFPBSocialMediaPostCardSection handle](self, "handle");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handle");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v45, "isEqual:", v46);

    if (!v47)
      goto LABEL_73;
  }
  else
  {

  }
  -[_SFPBSocialMediaPostCardSection verifiedGlyph](self, "verifiedGlyph");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "verifiedGlyph");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_72;
  -[_SFPBSocialMediaPostCardSection verifiedGlyph](self, "verifiedGlyph");
  v48 = objc_claimAutoreleasedReturnValue();
  if (v48)
  {
    v49 = (void *)v48;
    -[_SFPBSocialMediaPostCardSection verifiedGlyph](self, "verifiedGlyph");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "verifiedGlyph");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v50, "isEqual:", v51);

    if (!v52)
      goto LABEL_73;
  }
  else
  {

  }
  -[_SFPBSocialMediaPostCardSection profilePicture](self, "profilePicture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "profilePicture");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_72;
  -[_SFPBSocialMediaPostCardSection profilePicture](self, "profilePicture");
  v53 = objc_claimAutoreleasedReturnValue();
  if (v53)
  {
    v54 = (void *)v53;
    -[_SFPBSocialMediaPostCardSection profilePicture](self, "profilePicture");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "profilePicture");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v55, "isEqual:", v56);

    if (!v57)
      goto LABEL_73;
  }
  else
  {

  }
  -[_SFPBSocialMediaPostCardSection post](self, "post");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "post");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_72;
  -[_SFPBSocialMediaPostCardSection post](self, "post");
  v58 = objc_claimAutoreleasedReturnValue();
  if (v58)
  {
    v59 = (void *)v58;
    -[_SFPBSocialMediaPostCardSection post](self, "post");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "post");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v60, "isEqual:", v61);

    if (!v62)
      goto LABEL_73;
  }
  else
  {

  }
  -[_SFPBSocialMediaPostCardSection picture](self, "picture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "picture");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_72;
  -[_SFPBSocialMediaPostCardSection picture](self, "picture");
  v63 = objc_claimAutoreleasedReturnValue();
  if (v63)
  {
    v64 = (void *)v63;
    -[_SFPBSocialMediaPostCardSection picture](self, "picture");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "picture");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend(v65, "isEqual:", v66);

    if (!v67)
      goto LABEL_73;
  }
  else
  {

  }
  -[_SFPBSocialMediaPostCardSection timestamp](self, "timestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_72;
  -[_SFPBSocialMediaPostCardSection timestamp](self, "timestamp");
  v68 = objc_claimAutoreleasedReturnValue();
  if (v68)
  {
    v69 = (void *)v68;
    -[_SFPBSocialMediaPostCardSection timestamp](self, "timestamp");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timestamp");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = objc_msgSend(v70, "isEqual:", v71);

    if (!v72)
      goto LABEL_73;
  }
  else
  {

  }
  -[_SFPBSocialMediaPostCardSection footnote](self, "footnote");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "footnote");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_72:

    goto LABEL_73;
  }
  -[_SFPBSocialMediaPostCardSection footnote](self, "footnote");
  v73 = objc_claimAutoreleasedReturnValue();
  if (!v73)
  {

LABEL_76:
    v78 = 1;
    goto LABEL_74;
  }
  v74 = (void *)v73;
  -[_SFPBSocialMediaPostCardSection footnote](self, "footnote");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "footnote");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = objc_msgSend(v75, "isEqual:", v76);

  if ((v77 & 1) != 0)
    goto LABEL_76;
LABEL_73:
  v78 = 0;
LABEL_74:

  return v78;
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
  uint64_t v12;
  uint64_t v13;
  NSUInteger v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  NSUInteger v19;
  uint64_t v21;

  v21 = -[NSArray hash](self->_punchoutOptions, "hash");
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
  v11 = -[NSString hash](self->_name, "hash");
  if (self->_nameNoWrap)
    v12 = 2654435761;
  else
    v12 = 0;
  v13 = v3 ^ v21 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ (2654435761 * self->_nameMaxLines);
  v14 = -[NSString hash](self->_handle, "hash");
  v15 = v14 ^ -[_SFPBImage hash](self->_verifiedGlyph, "hash");
  v16 = v15 ^ -[_SFPBImage hash](self->_profilePicture, "hash");
  v17 = v16 ^ -[_SFPBRichText hash](self->_post, "hash");
  v18 = v17 ^ -[_SFPBImage hash](self->_picture, "hash");
  v19 = v18 ^ -[NSString hash](self->_timestamp, "hash");
  return v13 ^ v19 ^ -[NSString hash](self->_footnote, "hash");
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
  NSArray *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_backgroundColor)
  {
    -[_SFPBSocialMediaPostCardSection backgroundColor](self, "backgroundColor");
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
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBSocialMediaPostCardSection canBeHidden](self, "canBeHidden"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("canBeHidden"));

  }
  if (self->_footnote)
  {
    -[_SFPBSocialMediaPostCardSection footnote](self, "footnote");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("footnote"));

  }
  if (self->_handle)
  {
    -[_SFPBSocialMediaPostCardSection handle](self, "handle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("handle"));

  }
  if (self->_hasBottomPadding)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBSocialMediaPostCardSection hasBottomPadding](self, "hasBottomPadding"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("hasBottomPadding"));

  }
  if (self->_hasTopPadding)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBSocialMediaPostCardSection hasTopPadding](self, "hasTopPadding"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("hasTopPadding"));

  }
  if (self->_name)
  {
    -[_SFPBSocialMediaPostCardSection name](self, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("name"));

  }
  if (self->_nameMaxLines)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_SFPBSocialMediaPostCardSection nameMaxLines](self, "nameMaxLines"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("nameMaxLines"));

  }
  if (self->_nameNoWrap)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBSocialMediaPostCardSection nameNoWrap](self, "nameNoWrap"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("nameNoWrap"));

  }
  if (self->_picture)
  {
    -[_SFPBSocialMediaPostCardSection picture](self, "picture");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("picture"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("picture"));

    }
  }
  if (self->_post)
  {
    -[_SFPBSocialMediaPostCardSection post](self, "post");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "dictionaryRepresentation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("post"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("post"));

    }
  }
  if (self->_profilePicture)
  {
    -[_SFPBSocialMediaPostCardSection profilePicture](self, "profilePicture");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "dictionaryRepresentation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("profilePicture"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("profilePicture"));

    }
  }
  if (-[NSArray count](self->_punchoutOptions, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v28 = self->_punchoutOptions;
    v29 = -[NSArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v50 != v31)
            objc_enumerationMutation(v28);
          objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * i), "dictionaryRepresentation");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          if (v33)
          {
            objc_msgSend(v27, "addObject:", v33);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "addObject:", v34);

          }
        }
        v30 = -[NSArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
      }
      while (v30);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("punchoutOptions"));
  }
  if (self->_punchoutPickerDismissText)
  {
    -[_SFPBSocialMediaPostCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)objc_msgSend(v35, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("punchoutPickerDismissText"));

  }
  if (self->_punchoutPickerTitle)
  {
    -[_SFPBSocialMediaPostCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)objc_msgSend(v37, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, CFSTR("punchoutPickerTitle"));

  }
  if (self->_separatorStyle)
  {
    v39 = -[_SFPBSocialMediaPostCardSection separatorStyle](self, "separatorStyle");
    if (v39 >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v40 = *(&off_1E40421B0 + v39);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v40, CFSTR("separatorStyle"));

  }
  if (self->_timestamp)
  {
    -[_SFPBSocialMediaPostCardSection timestamp](self, "timestamp");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = (void *)objc_msgSend(v41, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v42, CFSTR("timestamp"));

  }
  if (self->_type)
  {
    -[_SFPBSocialMediaPostCardSection type](self, "type");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = (void *)objc_msgSend(v43, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v44, CFSTR("type"));

  }
  if (self->_verifiedGlyph)
  {
    -[_SFPBSocialMediaPostCardSection verifiedGlyph](self, "verifiedGlyph");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "dictionaryRepresentation");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (v46)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v46, CFSTR("verifiedGlyph"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v47, CFSTR("verifiedGlyph"));

    }
  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBSocialMediaPostCardSection dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBSocialMediaPostCardSection)initWithJSON:(id)a3
{
  void *v4;
  _SFPBSocialMediaPostCardSection *v5;
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
    self = -[_SFPBSocialMediaPostCardSection initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBSocialMediaPostCardSection)initWithDictionary:(id)a3
{
  id v4;
  _SFPBSocialMediaPostCardSection *v5;
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
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _SFPBImage *v33;
  void *v34;
  _SFPBImage *v35;
  void *v36;
  _SFPBRichText *v37;
  void *v38;
  _SFPBImage *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  _SFPBSocialMediaPostCardSection *v44;
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
  void *v56;
  void *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  objc_super v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v62.receiver = self;
  v62.super_class = (Class)_SFPBSocialMediaPostCardSection;
  v5 = -[_SFPBSocialMediaPostCardSection init](&v62, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("punchoutOptions"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v59;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v59 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v13 = -[_SFPBPunchout initWithDictionary:]([_SFPBPunchout alloc], "initWithDictionary:", v12);
              -[_SFPBSocialMediaPostCardSection addPunchoutOptions:](v5, "addPunchoutOptions:", v13);

            }
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
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
      -[_SFPBSocialMediaPostCardSection setPunchoutPickerTitle:](v5, "setPunchoutPickerTitle:", v15);

    }
    v52 = v14;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("punchoutPickerDismissText"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = (void *)objc_msgSend(v16, "copy");
      -[_SFPBSocialMediaPostCardSection setPunchoutPickerDismissText:](v5, "setPunchoutPickerDismissText:", v17);

    }
    v51 = v16;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("canBeHidden"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBSocialMediaPostCardSection setCanBeHidden:](v5, "setCanBeHidden:", objc_msgSend(v18, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasTopPadding"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBSocialMediaPostCardSection setHasTopPadding:](v5, "setHasTopPadding:", objc_msgSend(v19, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasBottomPadding"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBSocialMediaPostCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", objc_msgSend(v20, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v57 = v21;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = (void *)objc_msgSend(v21, "copy");
      -[_SFPBSocialMediaPostCardSection setType:](v5, "setType:", v22);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("separatorStyle"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v56 = v23;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBSocialMediaPostCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", objc_msgSend(v23, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("backgroundColor"));
    v24 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v55 = (void *)v24;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = -[_SFPBColor initWithDictionary:]([_SFPBColor alloc], "initWithDictionary:", v24);
      -[_SFPBSocialMediaPostCardSection setBackgroundColor:](v5, "setBackgroundColor:", v25);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("name"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v54 = v26;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = (void *)objc_msgSend(v26, "copy");
      -[_SFPBSocialMediaPostCardSection setName:](v5, "setName:", v27);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("nameNoWrap"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBSocialMediaPostCardSection setNameNoWrap:](v5, "setNameNoWrap:", objc_msgSend(v28, "BOOLValue"));
    v47 = v28;
    v49 = v19;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("nameMaxLines"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBSocialMediaPostCardSection setNameMaxLines:](v5, "setNameMaxLines:", objc_msgSend(v29, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("handle"), v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v31 = (void *)objc_msgSend(v30, "copy");
      -[_SFPBSocialMediaPostCardSection setHandle:](v5, "setHandle:", v31);

    }
    v48 = v20;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("verifiedGlyph"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v33 = -[_SFPBImage initWithDictionary:]([_SFPBImage alloc], "initWithDictionary:", v32);
      -[_SFPBSocialMediaPostCardSection setVerifiedGlyph:](v5, "setVerifiedGlyph:", v33);

    }
    v53 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("profilePicture"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v35 = -[_SFPBImage initWithDictionary:]([_SFPBImage alloc], "initWithDictionary:", v34);
      -[_SFPBSocialMediaPostCardSection setProfilePicture:](v5, "setProfilePicture:", v35);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("post"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v37 = -[_SFPBRichText initWithDictionary:]([_SFPBRichText alloc], "initWithDictionary:", v36);
      -[_SFPBSocialMediaPostCardSection setPost:](v5, "setPost:", v37);

    }
    v50 = v18;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("picture"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v39 = -[_SFPBImage initWithDictionary:]([_SFPBImage alloc], "initWithDictionary:", v38);
      -[_SFPBSocialMediaPostCardSection setPicture:](v5, "setPicture:", v39);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timestamp"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v41 = (void *)objc_msgSend(v40, "copy");
      -[_SFPBSocialMediaPostCardSection setTimestamp:](v5, "setTimestamp:", v41);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("footnote"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v43 = (void *)objc_msgSend(v42, "copy");
      -[_SFPBSocialMediaPostCardSection setFootnote:](v5, "setFootnote:", v43);

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

- (NSString)name
{
  return self->_name;
}

- (BOOL)nameNoWrap
{
  return self->_nameNoWrap;
}

- (int)nameMaxLines
{
  return self->_nameMaxLines;
}

- (NSString)handle
{
  return self->_handle;
}

- (_SFPBImage)verifiedGlyph
{
  return self->_verifiedGlyph;
}

- (_SFPBImage)profilePicture
{
  return self->_profilePicture;
}

- (_SFPBRichText)post
{
  return self->_post;
}

- (_SFPBImage)picture
{
  return self->_picture;
}

- (NSString)timestamp
{
  return self->_timestamp;
}

- (NSString)footnote
{
  return self->_footnote;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footnote, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_picture, 0);
  objc_storeStrong((id *)&self->_post, 0);
  objc_storeStrong((id *)&self->_profilePicture, 0);
  objc_storeStrong((id *)&self->_verifiedGlyph, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_punchoutPickerDismissText, 0);
  objc_storeStrong((id *)&self->_punchoutPickerTitle, 0);
  objc_storeStrong((id *)&self->_punchoutOptions, 0);
}

@end
