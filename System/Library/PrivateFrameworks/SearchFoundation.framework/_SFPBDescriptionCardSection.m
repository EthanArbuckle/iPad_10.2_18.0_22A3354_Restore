@implementation _SFPBDescriptionCardSection

- (_SFPBDescriptionCardSection)initWithFacade:(id)a3
{
  id v4;
  _SFPBDescriptionCardSection *v5;
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
  _SFPBText *v29;
  void *v30;
  _SFPBText *v31;
  void *v32;
  void *v33;
  void *v34;
  _SFPBImage *v35;
  void *v36;
  _SFPBImage *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _SFPBURL *v47;
  void *v48;
  _SFPBURL *v49;
  void *v50;
  _SFPBImage *v51;
  void *v52;
  _SFPBImage *v53;
  void *v54;
  id v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t j;
  _SFPBRichText *v61;
  _SFPBDescriptionCardSection *v62;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[_SFPBDescriptionCardSection init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "punchoutOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v7 = 0;

    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    objc_msgSend(v4, "punchoutOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v68, v73, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v69;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v69 != v11)
            objc_enumerationMutation(v8);
          v13 = -[_SFPBPunchout initWithFacade:]([_SFPBPunchout alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * i));
          if (v13)
            objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v68, v73, 16);
      }
      while (v10);
    }

    -[_SFPBDescriptionCardSection setPunchoutOptions:](v5, "setPunchoutOptions:", v7);
    objc_msgSend(v4, "punchoutPickerTitle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v4, "punchoutPickerTitle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBDescriptionCardSection setPunchoutPickerTitle:](v5, "setPunchoutPickerTitle:", v15);

    }
    objc_msgSend(v4, "punchoutPickerDismissText");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v4, "punchoutPickerDismissText");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBDescriptionCardSection setPunchoutPickerDismissText:](v5, "setPunchoutPickerDismissText:", v17);

    }
    if (objc_msgSend(v4, "hasCanBeHidden"))
      -[_SFPBDescriptionCardSection setCanBeHidden:](v5, "setCanBeHidden:", objc_msgSend(v4, "canBeHidden"));
    if (objc_msgSend(v4, "hasHasTopPadding"))
      -[_SFPBDescriptionCardSection setHasTopPadding:](v5, "setHasTopPadding:", objc_msgSend(v4, "hasTopPadding"));
    if (objc_msgSend(v4, "hasHasBottomPadding"))
      -[_SFPBDescriptionCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", objc_msgSend(v4, "hasBottomPadding"));
    objc_msgSend(v4, "type");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v4, "type");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBDescriptionCardSection setType:](v5, "setType:", v19);

    }
    if (objc_msgSend(v4, "hasSeparatorStyle"))
      -[_SFPBDescriptionCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", objc_msgSend(v4, "separatorStyle"));
    objc_msgSend(v4, "backgroundColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v21 = [_SFPBColor alloc];
      objc_msgSend(v4, "backgroundColor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[_SFPBColor initWithFacade:](v21, "initWithFacade:", v22);
      -[_SFPBDescriptionCardSection setBackgroundColor:](v5, "setBackgroundColor:", v23);

    }
    objc_msgSend(v4, "title");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v4, "title");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBDescriptionCardSection setTitle:](v5, "setTitle:", v25);

    }
    objc_msgSend(v4, "subtitle");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      objc_msgSend(v4, "subtitle");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBDescriptionCardSection setSubtitle:](v5, "setSubtitle:", v27);

    }
    objc_msgSend(v4, "descriptionText");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      v29 = [_SFPBText alloc];
      objc_msgSend(v4, "descriptionText");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = -[_SFPBText initWithFacade:](v29, "initWithFacade:", v30);
      -[_SFPBDescriptionCardSection setDescriptionText:](v5, "setDescriptionText:", v31);

    }
    objc_msgSend(v4, "expandText");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      objc_msgSend(v4, "expandText");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBDescriptionCardSection setExpandText:](v5, "setExpandText:", v33);

    }
    objc_msgSend(v4, "image");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      v35 = [_SFPBImage alloc];
      objc_msgSend(v4, "image");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = -[_SFPBImage initWithFacade:](v35, "initWithFacade:", v36);
      -[_SFPBDescriptionCardSection setImage:](v5, "setImage:", v37);

    }
    if (objc_msgSend(v4, "hasTitleNoWrap"))
      -[_SFPBDescriptionCardSection setTitleNoWrap:](v5, "setTitleNoWrap:", objc_msgSend(v4, "titleNoWrap"));
    objc_msgSend(v4, "titleWeight");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      objc_msgSend(v4, "titleWeight");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBDescriptionCardSection setTitleWeight:](v5, "setTitleWeight:", objc_msgSend(v39, "intValue"));

    }
    objc_msgSend(v4, "descriptionSize");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (v40)
    {
      objc_msgSend(v4, "descriptionSize");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBDescriptionCardSection setDescriptionSize:](v5, "setDescriptionSize:", objc_msgSend(v41, "intValue"));

    }
    objc_msgSend(v4, "descriptionWeight");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42)
    {
      objc_msgSend(v4, "descriptionWeight");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBDescriptionCardSection setDescriptionWeight:](v5, "setDescriptionWeight:", objc_msgSend(v43, "intValue"));

    }
    if (objc_msgSend(v4, "hasDescriptionExpand"))
      -[_SFPBDescriptionCardSection setDescriptionExpand:](v5, "setDescriptionExpand:", objc_msgSend(v4, "descriptionExpand"));
    if (objc_msgSend(v4, "hasImageAlign"))
      -[_SFPBDescriptionCardSection setImageAlign:](v5, "setImageAlign:", objc_msgSend(v4, "imageAlign"));
    if (objc_msgSend(v4, "hasTextAlign"))
      -[_SFPBDescriptionCardSection setTextAlign:](v5, "setTextAlign:", objc_msgSend(v4, "textAlign"));
    objc_msgSend(v4, "attributionText");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v44)
    {
      objc_msgSend(v4, "attributionText");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBDescriptionCardSection setAttributionText:](v5, "setAttributionText:", v45);

    }
    objc_msgSend(v4, "attributionURL");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (v46)
    {
      v47 = [_SFPBURL alloc];
      objc_msgSend(v4, "attributionURL");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = -[_SFPBURL initWithNSURL:](v47, "initWithNSURL:", v48);
      -[_SFPBDescriptionCardSection setAttributionURL:](v5, "setAttributionURL:", v49);

    }
    objc_msgSend(v4, "attributionGlyph");
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    if (v50)
    {
      v51 = [_SFPBImage alloc];
      objc_msgSend(v4, "attributionGlyph");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = -[_SFPBImage initWithFacade:](v51, "initWithFacade:", v52);
      -[_SFPBDescriptionCardSection setAttributionGlyph:](v5, "setAttributionGlyph:", v53);

    }
    objc_msgSend(v4, "richDescriptions");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    if (v54)
      v55 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v55 = 0;

    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    objc_msgSend(v4, "richDescriptions", 0);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v64, v72, 16);
    if (v57)
    {
      v58 = v57;
      v59 = *(_QWORD *)v65;
      do
      {
        for (j = 0; j != v58; ++j)
        {
          if (*(_QWORD *)v65 != v59)
            objc_enumerationMutation(v56);
          v61 = -[_SFPBRichText initWithFacade:]([_SFPBRichText alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * j));
          if (v61)
            objc_msgSend(v55, "addObject:", v61);

        }
        v58 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v64, v72, 16);
      }
      while (v58);
    }

    -[_SFPBDescriptionCardSection setRichDescriptions:](v5, "setRichDescriptions:", v55);
    v62 = v5;

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

- (void)setSubtitle:(id)a3
{
  NSString *v4;
  NSString *subtitle;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  subtitle = self->_subtitle;
  self->_subtitle = v4;

}

- (void)setDescriptionText:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionText, a3);
}

- (void)setExpandText:(id)a3
{
  NSString *v4;
  NSString *expandText;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  expandText = self->_expandText;
  self->_expandText = v4;

}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (void)setTitleNoWrap:(BOOL)a3
{
  self->_titleNoWrap = a3;
}

- (void)setTitleWeight:(int)a3
{
  self->_titleWeight = a3;
}

- (void)setDescriptionSize:(int)a3
{
  self->_descriptionSize = a3;
}

- (void)setDescriptionWeight:(int)a3
{
  self->_descriptionWeight = a3;
}

- (void)setDescriptionExpand:(BOOL)a3
{
  self->_descriptionExpand = a3;
}

- (void)setImageAlign:(int)a3
{
  self->_imageAlign = a3;
}

- (void)setTextAlign:(int)a3
{
  self->_textAlign = a3;
}

- (void)setAttributionText:(id)a3
{
  NSString *v4;
  NSString *attributionText;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  attributionText = self->_attributionText;
  self->_attributionText = v4;

}

- (void)setAttributionURL:(id)a3
{
  objc_storeStrong((id *)&self->_attributionURL, a3);
}

- (void)setAttributionGlyph:(id)a3
{
  objc_storeStrong((id *)&self->_attributionGlyph, a3);
}

- (void)setRichDescriptions:(id)a3
{
  NSArray *v4;
  NSArray *richDescriptions;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  richDescriptions = self->_richDescriptions;
  self->_richDescriptions = v4;

}

- (void)clearRichDescriptions
{
  -[NSArray removeAllObjects](self->_richDescriptions, "removeAllObjects");
}

- (void)addRichDescriptions:(id)a3
{
  id v4;
  NSArray *richDescriptions;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  richDescriptions = self->_richDescriptions;
  v8 = v4;
  if (!richDescriptions)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_richDescriptions;
    self->_richDescriptions = v6;

    v4 = v8;
    richDescriptions = self->_richDescriptions;
  }
  -[NSArray addObject:](richDescriptions, "addObject:", v4);

}

- (unint64_t)richDescriptionsCount
{
  return -[NSArray count](self->_richDescriptions, "count");
}

- (id)richDescriptionsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_richDescriptions, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBDescriptionCardSectionReadFrom(self, (uint64_t)a3);
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
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_SFPBDescriptionCardSection punchoutOptions](self, "punchoutOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v32;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v32 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v7);
  }

  -[_SFPBDescriptionCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    PBDataWriterWriteStringField();

  -[_SFPBDescriptionCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    PBDataWriterWriteStringField();

  if (-[_SFPBDescriptionCardSection canBeHidden](self, "canBeHidden"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBDescriptionCardSection hasTopPadding](self, "hasTopPadding"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBDescriptionCardSection hasBottomPadding](self, "hasBottomPadding"))
    PBDataWriterWriteBOOLField();
  -[_SFPBDescriptionCardSection type](self, "type");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    PBDataWriterWriteStringField();

  if (-[_SFPBDescriptionCardSection separatorStyle](self, "separatorStyle"))
    PBDataWriterWriteInt32Field();
  -[_SFPBDescriptionCardSection backgroundColor](self, "backgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    PBDataWriterWriteSubmessage();

  -[_SFPBDescriptionCardSection title](self, "title");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    PBDataWriterWriteStringField();

  -[_SFPBDescriptionCardSection subtitle](self, "subtitle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    PBDataWriterWriteStringField();

  -[_SFPBDescriptionCardSection descriptionText](self, "descriptionText");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    PBDataWriterWriteSubmessage();

  -[_SFPBDescriptionCardSection expandText](self, "expandText");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    PBDataWriterWriteStringField();

  -[_SFPBDescriptionCardSection image](self, "image");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
    PBDataWriterWriteSubmessage();

  if (-[_SFPBDescriptionCardSection titleNoWrap](self, "titleNoWrap"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBDescriptionCardSection titleWeight](self, "titleWeight"))
    PBDataWriterWriteInt32Field();
  if (-[_SFPBDescriptionCardSection descriptionSize](self, "descriptionSize"))
    PBDataWriterWriteInt32Field();
  if (-[_SFPBDescriptionCardSection descriptionWeight](self, "descriptionWeight"))
    PBDataWriterWriteInt32Field();
  if (-[_SFPBDescriptionCardSection descriptionExpand](self, "descriptionExpand"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBDescriptionCardSection imageAlign](self, "imageAlign"))
    PBDataWriterWriteInt32Field();
  if (-[_SFPBDescriptionCardSection textAlign](self, "textAlign"))
    PBDataWriterWriteInt32Field();
  -[_SFPBDescriptionCardSection attributionText](self, "attributionText");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    PBDataWriterWriteStringField();

  -[_SFPBDescriptionCardSection attributionURL](self, "attributionURL");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
    PBDataWriterWriteSubmessage();

  -[_SFPBDescriptionCardSection attributionGlyph](self, "attributionGlyph");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
    PBDataWriterWriteSubmessage();

  -[_SFPBDescriptionCardSection richDescriptions](self, "richDescriptions");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v28;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v28 != v25)
          objc_enumerationMutation(v22);
        PBDataWriterWriteSubmessage();
        ++v26;
      }
      while (v24 != v26);
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v24);
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
  int v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  int v60;
  int titleNoWrap;
  int titleWeight;
  int descriptionSize;
  int descriptionWeight;
  int descriptionExpand;
  int imageAlign;
  int textAlign;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  int v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  int v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  int v82;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  char v87;
  BOOL v88;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_83;
  -[_SFPBDescriptionCardSection punchoutOptions](self, "punchoutOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "punchoutOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_82;
  -[_SFPBDescriptionCardSection punchoutOptions](self, "punchoutOptions");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBDescriptionCardSection punchoutOptions](self, "punchoutOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "punchoutOptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_83;
  }
  else
  {

  }
  -[_SFPBDescriptionCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "punchoutPickerTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_82;
  -[_SFPBDescriptionCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBDescriptionCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "punchoutPickerTitle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_83;
  }
  else
  {

  }
  -[_SFPBDescriptionCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "punchoutPickerDismissText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_82;
  -[_SFPBDescriptionCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_SFPBDescriptionCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "punchoutPickerDismissText");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_83;
  }
  else
  {

  }
  canBeHidden = self->_canBeHidden;
  if (canBeHidden != objc_msgSend(v4, "canBeHidden"))
    goto LABEL_83;
  hasTopPadding = self->_hasTopPadding;
  if (hasTopPadding != objc_msgSend(v4, "hasTopPadding"))
    goto LABEL_83;
  hasBottomPadding = self->_hasBottomPadding;
  if (hasBottomPadding != objc_msgSend(v4, "hasBottomPadding"))
    goto LABEL_83;
  -[_SFPBDescriptionCardSection type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_82;
  -[_SFPBDescriptionCardSection type](self, "type");
  v25 = objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v26 = (void *)v25;
    -[_SFPBDescriptionCardSection type](self, "type");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "type");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v27, "isEqual:", v28);

    if (!v29)
      goto LABEL_83;
  }
  else
  {

  }
  separatorStyle = self->_separatorStyle;
  if (separatorStyle != objc_msgSend(v4, "separatorStyle"))
    goto LABEL_83;
  -[_SFPBDescriptionCardSection backgroundColor](self, "backgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_82;
  -[_SFPBDescriptionCardSection backgroundColor](self, "backgroundColor");
  v31 = objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    v32 = (void *)v31;
    -[_SFPBDescriptionCardSection backgroundColor](self, "backgroundColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "backgroundColor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v33, "isEqual:", v34);

    if (!v35)
      goto LABEL_83;
  }
  else
  {

  }
  -[_SFPBDescriptionCardSection title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_82;
  -[_SFPBDescriptionCardSection title](self, "title");
  v36 = objc_claimAutoreleasedReturnValue();
  if (v36)
  {
    v37 = (void *)v36;
    -[_SFPBDescriptionCardSection title](self, "title");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "title");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v38, "isEqual:", v39);

    if (!v40)
      goto LABEL_83;
  }
  else
  {

  }
  -[_SFPBDescriptionCardSection subtitle](self, "subtitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subtitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_82;
  -[_SFPBDescriptionCardSection subtitle](self, "subtitle");
  v41 = objc_claimAutoreleasedReturnValue();
  if (v41)
  {
    v42 = (void *)v41;
    -[_SFPBDescriptionCardSection subtitle](self, "subtitle");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subtitle");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v43, "isEqual:", v44);

    if (!v45)
      goto LABEL_83;
  }
  else
  {

  }
  -[_SFPBDescriptionCardSection descriptionText](self, "descriptionText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "descriptionText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_82;
  -[_SFPBDescriptionCardSection descriptionText](self, "descriptionText");
  v46 = objc_claimAutoreleasedReturnValue();
  if (v46)
  {
    v47 = (void *)v46;
    -[_SFPBDescriptionCardSection descriptionText](self, "descriptionText");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "descriptionText");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v48, "isEqual:", v49);

    if (!v50)
      goto LABEL_83;
  }
  else
  {

  }
  -[_SFPBDescriptionCardSection expandText](self, "expandText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "expandText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_82;
  -[_SFPBDescriptionCardSection expandText](self, "expandText");
  v51 = objc_claimAutoreleasedReturnValue();
  if (v51)
  {
    v52 = (void *)v51;
    -[_SFPBDescriptionCardSection expandText](self, "expandText");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "expandText");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v53, "isEqual:", v54);

    if (!v55)
      goto LABEL_83;
  }
  else
  {

  }
  -[_SFPBDescriptionCardSection image](self, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_82;
  -[_SFPBDescriptionCardSection image](self, "image");
  v56 = objc_claimAutoreleasedReturnValue();
  if (v56)
  {
    v57 = (void *)v56;
    -[_SFPBDescriptionCardSection image](self, "image");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "image");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v58, "isEqual:", v59);

    if (!v60)
      goto LABEL_83;
  }
  else
  {

  }
  titleNoWrap = self->_titleNoWrap;
  if (titleNoWrap != objc_msgSend(v4, "titleNoWrap"))
    goto LABEL_83;
  titleWeight = self->_titleWeight;
  if (titleWeight != objc_msgSend(v4, "titleWeight"))
    goto LABEL_83;
  descriptionSize = self->_descriptionSize;
  if (descriptionSize != objc_msgSend(v4, "descriptionSize"))
    goto LABEL_83;
  descriptionWeight = self->_descriptionWeight;
  if (descriptionWeight != objc_msgSend(v4, "descriptionWeight"))
    goto LABEL_83;
  descriptionExpand = self->_descriptionExpand;
  if (descriptionExpand != objc_msgSend(v4, "descriptionExpand"))
    goto LABEL_83;
  imageAlign = self->_imageAlign;
  if (imageAlign != objc_msgSend(v4, "imageAlign"))
    goto LABEL_83;
  textAlign = self->_textAlign;
  if (textAlign != objc_msgSend(v4, "textAlign"))
    goto LABEL_83;
  -[_SFPBDescriptionCardSection attributionText](self, "attributionText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributionText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_82;
  -[_SFPBDescriptionCardSection attributionText](self, "attributionText");
  v68 = objc_claimAutoreleasedReturnValue();
  if (v68)
  {
    v69 = (void *)v68;
    -[_SFPBDescriptionCardSection attributionText](self, "attributionText");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "attributionText");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = objc_msgSend(v70, "isEqual:", v71);

    if (!v72)
      goto LABEL_83;
  }
  else
  {

  }
  -[_SFPBDescriptionCardSection attributionURL](self, "attributionURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributionURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_82;
  -[_SFPBDescriptionCardSection attributionURL](self, "attributionURL");
  v73 = objc_claimAutoreleasedReturnValue();
  if (v73)
  {
    v74 = (void *)v73;
    -[_SFPBDescriptionCardSection attributionURL](self, "attributionURL");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "attributionURL");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = objc_msgSend(v75, "isEqual:", v76);

    if (!v77)
      goto LABEL_83;
  }
  else
  {

  }
  -[_SFPBDescriptionCardSection attributionGlyph](self, "attributionGlyph");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributionGlyph");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_82;
  -[_SFPBDescriptionCardSection attributionGlyph](self, "attributionGlyph");
  v78 = objc_claimAutoreleasedReturnValue();
  if (v78)
  {
    v79 = (void *)v78;
    -[_SFPBDescriptionCardSection attributionGlyph](self, "attributionGlyph");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "attributionGlyph");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = objc_msgSend(v80, "isEqual:", v81);

    if (!v82)
      goto LABEL_83;
  }
  else
  {

  }
  -[_SFPBDescriptionCardSection richDescriptions](self, "richDescriptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "richDescriptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_82:

    goto LABEL_83;
  }
  -[_SFPBDescriptionCardSection richDescriptions](self, "richDescriptions");
  v83 = objc_claimAutoreleasedReturnValue();
  if (!v83)
  {

LABEL_86:
    v88 = 1;
    goto LABEL_84;
  }
  v84 = (void *)v83;
  -[_SFPBDescriptionCardSection richDescriptions](self, "richDescriptions");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "richDescriptions");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = objc_msgSend(v85, "isEqual:", v86);

  if ((v87 & 1) != 0)
    goto LABEL_86;
LABEL_83:
  v88 = 0;
LABEL_84:

  return v88;
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
  NSUInteger v11;
  unint64_t v12;
  NSUInteger v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSUInteger v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v22;
  uint64_t v23;
  NSUInteger v24;
  NSUInteger v25;
  uint64_t v26;

  v26 = -[NSArray hash](self->_punchoutOptions, "hash");
  v25 = -[NSString hash](self->_punchoutPickerTitle, "hash");
  v3 = -[NSString hash](self->_punchoutPickerDismissText, "hash");
  if (self->_canBeHidden)
    v4 = 2654435761;
  else
    v4 = 0;
  v23 = v4;
  v24 = v3;
  if (self->_hasTopPadding)
    v5 = 2654435761;
  else
    v5 = 0;
  v22 = v5;
  if (self->_hasBottomPadding)
    v6 = 2654435761;
  else
    v6 = 0;
  v7 = -[NSString hash](self->_type, "hash");
  v8 = 2654435761 * self->_separatorStyle;
  v9 = -[_SFPBColor hash](self->_backgroundColor, "hash");
  v10 = -[NSString hash](self->_title, "hash");
  v11 = -[NSString hash](self->_subtitle, "hash");
  v12 = -[_SFPBText hash](self->_descriptionText, "hash");
  v13 = -[NSString hash](self->_expandText, "hash");
  v14 = -[_SFPBImage hash](self->_image, "hash");
  if (self->_titleNoWrap)
    v15 = 2654435761;
  else
    v15 = 0;
  if (self->_descriptionExpand)
    v16 = 2654435761;
  else
    v16 = 0;
  v17 = v25 ^ v26 ^ v24 ^ v23 ^ v22 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ (2654435761
                                                                                             * self->_titleWeight) ^ (2654435761 * self->_descriptionSize) ^ (2654435761 * self->_descriptionWeight) ^ v16 ^ (2654435761 * self->_imageAlign) ^ (2654435761 * self->_textAlign);
  v18 = -[NSString hash](self->_attributionText, "hash");
  v19 = v18 ^ -[_SFPBURL hash](self->_attributionURL, "hash");
  v20 = v19 ^ -[_SFPBImage hash](self->_attributionGlyph, "hash");
  return v17 ^ v20 ^ -[NSArray hash](self->_richDescriptions, "hash");
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
  unint64_t v15;
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
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  NSArray *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSArray *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t j;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_attributionGlyph)
  {
    -[_SFPBDescriptionCardSection attributionGlyph](self, "attributionGlyph");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("attributionGlyph"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("attributionGlyph"));

    }
  }
  if (self->_attributionText)
  {
    -[_SFPBDescriptionCardSection attributionText](self, "attributionText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("attributionText"));

  }
  if (self->_attributionURL)
  {
    -[_SFPBDescriptionCardSection attributionURL](self, "attributionURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("attributionURL"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("attributionURL"));

    }
  }
  if (self->_backgroundColor)
  {
    -[_SFPBDescriptionCardSection backgroundColor](self, "backgroundColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("backgroundColor"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("backgroundColor"));

    }
  }
  v15 = 0x1E0CB3000uLL;
  if (self->_canBeHidden)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBDescriptionCardSection canBeHidden](self, "canBeHidden"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("canBeHidden"));

  }
  if (self->_descriptionExpand)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBDescriptionCardSection descriptionExpand](self, "descriptionExpand"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("descriptionExpand"));

  }
  if (self->_descriptionSize)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_SFPBDescriptionCardSection descriptionSize](self, "descriptionSize"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("descriptionSize"));

  }
  if (self->_descriptionText)
  {
    -[_SFPBDescriptionCardSection descriptionText](self, "descriptionText");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("descriptionText"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("descriptionText"));

    }
  }
  if (self->_descriptionWeight)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_SFPBDescriptionCardSection descriptionWeight](self, "descriptionWeight"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("descriptionWeight"));

  }
  if (self->_expandText)
  {
    -[_SFPBDescriptionCardSection expandText](self, "expandText");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v23, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("expandText"));

  }
  if (self->_hasBottomPadding)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBDescriptionCardSection hasBottomPadding](self, "hasBottomPadding"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("hasBottomPadding"));

  }
  if (self->_hasTopPadding)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBDescriptionCardSection hasTopPadding](self, "hasTopPadding"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("hasTopPadding"));

  }
  if (self->_image)
  {
    -[_SFPBDescriptionCardSection image](self, "image");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "dictionaryRepresentation");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("image"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("image"));

    }
  }
  if (self->_imageAlign)
  {
    v30 = -[_SFPBDescriptionCardSection imageAlign](self, "imageAlign");
    if (v30 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v31 = *(&off_1E4042078 + v30);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("imageAlign"));

  }
  if (-[NSArray count](self->_punchoutOptions, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v33 = self->_punchoutOptions;
    v34 = -[NSArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v70, v75, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v71;
      do
      {
        for (i = 0; i != v35; ++i)
        {
          if (*(_QWORD *)v71 != v36)
            objc_enumerationMutation(v33);
          objc_msgSend(*(id *)(*((_QWORD *)&v70 + 1) + 8 * i), "dictionaryRepresentation");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          if (v38)
          {
            objc_msgSend(v32, "addObject:", v38);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "addObject:", v39);

          }
        }
        v35 = -[NSArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v70, v75, 16);
      }
      while (v35);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("punchoutOptions"));
    v15 = 0x1E0CB3000;
  }
  if (self->_punchoutPickerDismissText)
  {
    -[_SFPBDescriptionCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = (void *)objc_msgSend(v40, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("punchoutPickerDismissText"));

  }
  if (self->_punchoutPickerTitle)
  {
    -[_SFPBDescriptionCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (void *)objc_msgSend(v42, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v43, CFSTR("punchoutPickerTitle"));

  }
  if (-[NSArray count](self->_richDescriptions, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v45 = self->_richDescriptions;
    v46 = -[NSArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
    if (v46)
    {
      v47 = v46;
      v48 = *(_QWORD *)v67;
      do
      {
        for (j = 0; j != v47; ++j)
        {
          if (*(_QWORD *)v67 != v48)
            objc_enumerationMutation(v45);
          objc_msgSend(*(id *)(*((_QWORD *)&v66 + 1) + 8 * j), "dictionaryRepresentation");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          if (v50)
          {
            objc_msgSend(v44, "addObject:", v50);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "addObject:", v51);

          }
        }
        v47 = -[NSArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
      }
      while (v47);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v44, CFSTR("richDescriptions"));
    v15 = 0x1E0CB3000uLL;
  }
  if (self->_separatorStyle)
  {
    v52 = -[_SFPBDescriptionCardSection separatorStyle](self, "separatorStyle");
    if (v52 >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v53 = *(&off_1E40421B0 + v52);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v53, CFSTR("separatorStyle"));

  }
  if (self->_subtitle)
  {
    -[_SFPBDescriptionCardSection subtitle](self, "subtitle");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = (void *)objc_msgSend(v54, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v55, CFSTR("subtitle"));

  }
  if (self->_textAlign)
  {
    v56 = -[_SFPBDescriptionCardSection textAlign](self, "textAlign");
    if (v56 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v57 = *(&off_1E4042178 + v56);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v57, CFSTR("textAlign"));

  }
  if (self->_title)
  {
    -[_SFPBDescriptionCardSection title](self, "title");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = (void *)objc_msgSend(v58, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v59, CFSTR("title"));

  }
  if (self->_titleNoWrap)
  {
    objc_msgSend(*(id *)(v15 + 2024), "numberWithBool:", -[_SFPBDescriptionCardSection titleNoWrap](self, "titleNoWrap"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v60, CFSTR("titleNoWrap"));

  }
  if (self->_titleWeight)
  {
    objc_msgSend(*(id *)(v15 + 2024), "numberWithInt:", -[_SFPBDescriptionCardSection titleWeight](self, "titleWeight"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v61, CFSTR("titleWeight"));

  }
  if (self->_type)
  {
    -[_SFPBDescriptionCardSection type](self, "type");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = (void *)objc_msgSend(v62, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v63, CFSTR("type"));

  }
  v64 = v3;

  return v64;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBDescriptionCardSection dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBDescriptionCardSection)initWithJSON:(id)a3
{
  void *v4;
  _SFPBDescriptionCardSection *v5;
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
    self = -[_SFPBDescriptionCardSection initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBDescriptionCardSection)initWithDictionary:(id)a3
{
  id v4;
  _SFPBDescriptionCardSection *v5;
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
  uint64_t v30;
  _SFPBText *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  _SFPBImage *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  _SFPBURL *v49;
  uint64_t v50;
  _SFPBImage *v51;
  void *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t j;
  uint64_t v58;
  _SFPBRichText *v59;
  _SFPBDescriptionCardSection *v60;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  objc_super v93;
  _BYTE v94[128];
  _BYTE v95[128];
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v93.receiver = self;
  v93.super_class = (Class)_SFPBDescriptionCardSection;
  v5 = -[_SFPBDescriptionCardSection init](&v93, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("punchoutOptions"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v91 = 0u;
      v92 = 0u;
      v89 = 0u;
      v90 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v89, v95, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v90;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v90 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v89 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v13 = -[_SFPBPunchout initWithDictionary:]([_SFPBPunchout alloc], "initWithDictionary:", v12);
              -[_SFPBDescriptionCardSection addPunchoutOptions:](v5, "addPunchoutOptions:", v13);

            }
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v89, v95, 16);
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
      -[_SFPBDescriptionCardSection setPunchoutPickerTitle:](v5, "setPunchoutPickerTitle:", v15);

    }
    v84 = v14;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("punchoutPickerDismissText"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = (void *)objc_msgSend(v16, "copy");
      -[_SFPBDescriptionCardSection setPunchoutPickerDismissText:](v5, "setPunchoutPickerDismissText:", v17);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("canBeHidden"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBDescriptionCardSection setCanBeHidden:](v5, "setCanBeHidden:", objc_msgSend(v18, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasTopPadding"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v83 = v19;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBDescriptionCardSection setHasTopPadding:](v5, "setHasTopPadding:", objc_msgSend(v19, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasBottomPadding"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v82 = v20;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBDescriptionCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", objc_msgSend(v20, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v81 = v21;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = (void *)objc_msgSend(v21, "copy");
      -[_SFPBDescriptionCardSection setType:](v5, "setType:", v22);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("separatorStyle"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v80 = v23;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBDescriptionCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", objc_msgSend(v23, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("backgroundColor"));
    v24 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v79 = (void *)v24;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = -[_SFPBColor initWithDictionary:]([_SFPBColor alloc], "initWithDictionary:", v24);
      -[_SFPBDescriptionCardSection setBackgroundColor:](v5, "setBackgroundColor:", v25);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("title"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v78 = v26;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = (void *)objc_msgSend(v26, "copy");
      -[_SFPBDescriptionCardSection setTitle:](v5, "setTitle:", v27);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("subtitle"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v77 = v28;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v29 = (void *)objc_msgSend(v28, "copy");
      -[_SFPBDescriptionCardSection setSubtitle:](v5, "setSubtitle:", v29);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("descriptionText"));
    v30 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v76 = (void *)v30;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v31 = -[_SFPBText initWithDictionary:]([_SFPBText alloc], "initWithDictionary:", v30);
      -[_SFPBDescriptionCardSection setDescriptionText:](v5, "setDescriptionText:", v31);

    }
    v69 = v18;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("expandText"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v33 = (void *)objc_msgSend(v32, "copy");
      -[_SFPBDescriptionCardSection setExpandText:](v5, "setExpandText:", v33);

    }
    v68 = v32;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("image"));
    v34 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v75 = (void *)v34;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v35 = -[_SFPBImage initWithDictionary:]([_SFPBImage alloc], "initWithDictionary:", v34);
      -[_SFPBDescriptionCardSection setImage:](v5, "setImage:", v35);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("titleNoWrap"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBDescriptionCardSection setTitleNoWrap:](v5, "setTitleNoWrap:", objc_msgSend(v36, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("titleWeight"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v74 = v37;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBDescriptionCardSection setTitleWeight:](v5, "setTitleWeight:", objc_msgSend(v37, "intValue"));
    v38 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("descriptionSize"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBDescriptionCardSection setDescriptionSize:](v5, "setDescriptionSize:", objc_msgSend(v39, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("descriptionWeight"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v73 = v40;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBDescriptionCardSection setDescriptionWeight:](v5, "setDescriptionWeight:", objc_msgSend(v40, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("descriptionExpand"));
    v41 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v72 = (void *)v41;
    v42 = v38;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBDescriptionCardSection setDescriptionExpand:](v5, "setDescriptionExpand:", objc_msgSend(v72, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("imageAlign"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBDescriptionCardSection setImageAlign:](v5, "setImageAlign:", objc_msgSend(v43, "intValue"));
    v67 = v36;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("textAlign"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBDescriptionCardSection setTextAlign:](v5, "setTextAlign:", objc_msgSend(v44, "intValue"));
    v66 = v44;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("attributionText"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v46 = v84;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v47 = (void *)objc_msgSend(v45, "copy");
      -[_SFPBDescriptionCardSection setAttributionText:](v5, "setAttributionText:", v47);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("attributionURL"));
    v48 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v71 = (void *)v48;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v49 = -[_SFPBURL initWithDictionary:]([_SFPBURL alloc], "initWithDictionary:", v48);
      -[_SFPBDescriptionCardSection setAttributionURL:](v5, "setAttributionURL:", v49);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("attributionGlyph"));
    v50 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v70 = (void *)v50;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v51 = -[_SFPBImage initWithDictionary:]([_SFPBImage alloc], "initWithDictionary:", v50);
      -[_SFPBDescriptionCardSection setAttributionGlyph:](v5, "setAttributionGlyph:", v51);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("richDescriptions"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v62 = v45;
      v63 = v43;
      v64 = v39;
      v65 = v42;
      v87 = 0u;
      v88 = 0u;
      v85 = 0u;
      v86 = 0u;
      v53 = v52;
      v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v85, v94, 16);
      if (v54)
      {
        v55 = v54;
        v56 = *(_QWORD *)v86;
        do
        {
          for (j = 0; j != v55; ++j)
          {
            if (*(_QWORD *)v86 != v56)
              objc_enumerationMutation(v53);
            v58 = *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v59 = -[_SFPBRichText initWithDictionary:]([_SFPBRichText alloc], "initWithDictionary:", v58);
              -[_SFPBDescriptionCardSection addRichDescriptions:](v5, "addRichDescriptions:", v59);

            }
          }
          v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v85, v94, 16);
        }
        while (v55);
      }

      v42 = v65;
      v46 = v84;
      v43 = v63;
      v39 = v64;
      v45 = v62;
    }
    v60 = v5;

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

- (NSString)subtitle
{
  return self->_subtitle;
}

- (_SFPBText)descriptionText
{
  return self->_descriptionText;
}

- (NSString)expandText
{
  return self->_expandText;
}

- (_SFPBImage)image
{
  return self->_image;
}

- (BOOL)titleNoWrap
{
  return self->_titleNoWrap;
}

- (int)titleWeight
{
  return self->_titleWeight;
}

- (int)descriptionSize
{
  return self->_descriptionSize;
}

- (int)descriptionWeight
{
  return self->_descriptionWeight;
}

- (BOOL)descriptionExpand
{
  return self->_descriptionExpand;
}

- (int)imageAlign
{
  return self->_imageAlign;
}

- (int)textAlign
{
  return self->_textAlign;
}

- (NSString)attributionText
{
  return self->_attributionText;
}

- (_SFPBURL)attributionURL
{
  return self->_attributionURL;
}

- (_SFPBImage)attributionGlyph
{
  return self->_attributionGlyph;
}

- (NSArray)richDescriptions
{
  return self->_richDescriptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_richDescriptions, 0);
  objc_storeStrong((id *)&self->_attributionGlyph, 0);
  objc_storeStrong((id *)&self->_attributionURL, 0);
  objc_storeStrong((id *)&self->_attributionText, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_expandText, 0);
  objc_storeStrong((id *)&self->_descriptionText, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_punchoutPickerDismissText, 0);
  objc_storeStrong((id *)&self->_punchoutPickerTitle, 0);
  objc_storeStrong((id *)&self->_punchoutOptions, 0);
}

@end
