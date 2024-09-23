@implementation _SFPBDetailedRowCardSection

- (_SFPBDetailedRowCardSection)initWithFacade:(id)a3
{
  id v4;
  _SFPBDetailedRowCardSection *v5;
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
  _SFPBFormattedText *v33;
  void *v34;
  _SFPBFormattedText *v35;
  void *v36;
  _SFPBImage *v37;
  void *v38;
  _SFPBImage *v39;
  void *v40;
  id v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t j;
  _SFPBRichText *v47;
  void *v48;
  _SFPBRichText *v49;
  void *v50;
  _SFPBRichText *v51;
  void *v52;
  _SFPBFormattedText *v53;
  void *v54;
  _SFPBFormattedText *v55;
  void *v56;
  _SFPBFormattedText *v57;
  void *v58;
  _SFPBFormattedText *v59;
  void *v60;
  _SFPBFormattedText *v61;
  void *v62;
  _SFPBFormattedText *v63;
  void *v64;
  _SFPBActionItem *v65;
  void *v66;
  _SFPBActionItem *v67;
  void *v68;
  _SFPBButton *v69;
  void *v70;
  _SFPBButton *v71;
  void *v72;
  id v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t k;
  _SFPBButtonItem *v79;
  void *v80;
  _SFPBImage *v81;
  void *v82;
  _SFPBImage *v83;
  void *v84;
  _SFPBRichText *v85;
  void *v86;
  _SFPBRichText *v87;
  void *v88;
  _SFPBRichText *v89;
  void *v90;
  _SFPBRichText *v91;
  void *v92;
  _SFPBRichText *v93;
  void *v94;
  _SFPBRichText *v95;
  void *v96;
  _SFPBRichText *v97;
  void *v98;
  _SFPBRichText *v99;
  _SFPBDetailedRowCardSection *v100;
  _SFPBDetailedRowCardSection *v102;
  void *v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  _BYTE v116[128];
  _BYTE v117[128];
  _BYTE v118[128];
  uint64_t v119;

  v119 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[_SFPBDetailedRowCardSection init](self, "init");

  if (v5)
  {
    objc_msgSend(v4, "punchoutOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);

    }
    else
    {
      v7 = 0;
    }

    v114 = 0u;
    v115 = 0u;
    v112 = 0u;
    v113 = 0u;
    objc_msgSend(v4, "punchoutOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v112, v118, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v113;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v113 != v11)
            objc_enumerationMutation(v8);
          v13 = -[_SFPBPunchout initWithFacade:]([_SFPBPunchout alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v112 + 1) + 8 * i));
          if (v13)
            objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v112, v118, 16);
      }
      while (v10);
    }

    -[_SFPBDetailedRowCardSection setPunchoutOptions:](v5, "setPunchoutOptions:", v7);
    objc_msgSend(v4, "punchoutPickerTitle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v4, "punchoutPickerTitle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBDetailedRowCardSection setPunchoutPickerTitle:](v5, "setPunchoutPickerTitle:", v15);

    }
    objc_msgSend(v4, "punchoutPickerDismissText");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v4, "punchoutPickerDismissText");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBDetailedRowCardSection setPunchoutPickerDismissText:](v5, "setPunchoutPickerDismissText:", v17);

    }
    if (objc_msgSend(v4, "hasCanBeHidden"))
      -[_SFPBDetailedRowCardSection setCanBeHidden:](v5, "setCanBeHidden:", objc_msgSend(v4, "canBeHidden"));
    if (objc_msgSend(v4, "hasHasTopPadding"))
      -[_SFPBDetailedRowCardSection setHasTopPadding:](v5, "setHasTopPadding:", objc_msgSend(v4, "hasTopPadding"));
    if (objc_msgSend(v4, "hasHasBottomPadding"))
      -[_SFPBDetailedRowCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", objc_msgSend(v4, "hasBottomPadding"));
    objc_msgSend(v4, "type");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v4, "type");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBDetailedRowCardSection setType:](v5, "setType:", v19);

    }
    if (objc_msgSend(v4, "hasSeparatorStyle"))
      -[_SFPBDetailedRowCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", objc_msgSend(v4, "separatorStyle"));
    objc_msgSend(v4, "backgroundColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v21 = [_SFPBColor alloc];
      objc_msgSend(v4, "backgroundColor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[_SFPBColor initWithFacade:](v21, "initWithFacade:", v22);
      -[_SFPBDetailedRowCardSection setBackgroundColor:](v5, "setBackgroundColor:", v23);

    }
    objc_msgSend(v4, "thumbnail");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      v25 = [_SFPBImage alloc];
      objc_msgSend(v4, "thumbnail");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[_SFPBImage initWithFacade:](v25, "initWithFacade:", v26);
      -[_SFPBDetailedRowCardSection setThumbnail:](v5, "setThumbnail:", v27);

    }
    if (objc_msgSend(v4, "hasPreventThumbnailImageScaling"))
      -[_SFPBDetailedRowCardSection setPreventThumbnailImageScaling:](v5, "setPreventThumbnailImageScaling:", objc_msgSend(v4, "preventThumbnailImageScaling"));
    objc_msgSend(v4, "title");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      v29 = [_SFPBRichText alloc];
      objc_msgSend(v4, "title");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = -[_SFPBRichText initWithFacade:](v29, "initWithFacade:", v30);
      -[_SFPBDetailedRowCardSection setTitle:](v5, "setTitle:", v31);

    }
    objc_msgSend(v4, "secondaryTitle");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      v33 = [_SFPBFormattedText alloc];
      objc_msgSend(v4, "secondaryTitle");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = -[_SFPBFormattedText initWithFacade:](v33, "initWithFacade:", v34);
      -[_SFPBDetailedRowCardSection setSecondaryTitle:](v5, "setSecondaryTitle:", v35);

    }
    objc_msgSend(v4, "secondaryTitleImage");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      v37 = [_SFPBImage alloc];
      objc_msgSend(v4, "secondaryTitleImage");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = -[_SFPBImage initWithFacade:](v37, "initWithFacade:", v38);
      -[_SFPBDetailedRowCardSection setSecondaryTitleImage:](v5, "setSecondaryTitleImage:", v39);

    }
    if (objc_msgSend(v4, "hasIsSecondaryTitleDetached"))
      -[_SFPBDetailedRowCardSection setIsSecondaryTitleDetached:](v5, "setIsSecondaryTitleDetached:", objc_msgSend(v4, "isSecondaryTitleDetached"));
    objc_msgSend(v4, "descriptions");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (v40)
    {
      v41 = objc_alloc_init(MEMORY[0x1E0C99DE8]);

    }
    else
    {
      v41 = 0;
    }

    v110 = 0u;
    v111 = 0u;
    v108 = 0u;
    v109 = 0u;
    v103 = v4;
    objc_msgSend(v4, "descriptions");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v108, v117, 16);
    if (v43)
    {
      v44 = v43;
      v45 = *(_QWORD *)v109;
      do
      {
        for (j = 0; j != v44; ++j)
        {
          if (*(_QWORD *)v109 != v45)
            objc_enumerationMutation(v42);
          v47 = -[_SFPBRichText initWithFacade:]([_SFPBRichText alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v108 + 1) + 8 * j));
          if (v47)
            objc_msgSend(v41, "addObject:", v47);

        }
        v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v108, v117, 16);
      }
      while (v44);
    }

    -[_SFPBDetailedRowCardSection setDescriptions:](v5, "setDescriptions:", v41);
    objc_msgSend(v103, "footnote");
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    if (v48)
    {
      v49 = [_SFPBRichText alloc];
      objc_msgSend(v103, "footnote");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = -[_SFPBRichText initWithFacade:](v49, "initWithFacade:", v50);
      -[_SFPBDetailedRowCardSection setFootnote:](v5, "setFootnote:", v51);

    }
    objc_msgSend(v103, "trailingTopText");
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    if (v52)
    {
      v53 = [_SFPBFormattedText alloc];
      objc_msgSend(v103, "trailingTopText");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = -[_SFPBFormattedText initWithFacade:](v53, "initWithFacade:", v54);
      -[_SFPBDetailedRowCardSection setTrailingTopText:](v5, "setTrailingTopText:", v55);

    }
    objc_msgSend(v103, "trailingMiddleText");
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    if (v56)
    {
      v57 = [_SFPBFormattedText alloc];
      objc_msgSend(v103, "trailingMiddleText");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = -[_SFPBFormattedText initWithFacade:](v57, "initWithFacade:", v58);
      -[_SFPBDetailedRowCardSection setTrailingMiddleText:](v5, "setTrailingMiddleText:", v59);

    }
    objc_msgSend(v103, "trailingBottomText");
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    if (v60)
    {
      v61 = [_SFPBFormattedText alloc];
      objc_msgSend(v103, "trailingBottomText");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = -[_SFPBFormattedText initWithFacade:](v61, "initWithFacade:", v62);
      -[_SFPBDetailedRowCardSection setTrailingBottomText:](v5, "setTrailingBottomText:", v63);

    }
    objc_msgSend(v103, "action");
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    if (v64)
    {
      v65 = [_SFPBActionItem alloc];
      objc_msgSend(v103, "action");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = -[_SFPBActionItem initWithFacade:](v65, "initWithFacade:", v66);
      -[_SFPBDetailedRowCardSection setAction:](v5, "setAction:", v67);

    }
    objc_msgSend(v103, "button");
    v68 = (void *)objc_claimAutoreleasedReturnValue();

    if (v68)
    {
      v69 = [_SFPBButton alloc];
      objc_msgSend(v103, "button");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = -[_SFPBButton initWithFacade:](v69, "initWithFacade:", v70);
      -[_SFPBDetailedRowCardSection setButton:](v5, "setButton:", v71);

    }
    if (objc_msgSend(v103, "hasShouldUseCompactDisplay"))
      -[_SFPBDetailedRowCardSection setShouldUseCompactDisplay:](v5, "setShouldUseCompactDisplay:", objc_msgSend(v103, "shouldUseCompactDisplay"));
    objc_msgSend(v103, "buttonItems");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = v5;
    if (v72)
    {
      v73 = objc_alloc_init(MEMORY[0x1E0C99DE8]);

    }
    else
    {
      v73 = 0;
    }

    v106 = 0u;
    v107 = 0u;
    v104 = 0u;
    v105 = 0u;
    objc_msgSend(v103, "buttonItems");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v104, v116, 16);
    if (v75)
    {
      v76 = v75;
      v77 = *(_QWORD *)v105;
      do
      {
        for (k = 0; k != v76; ++k)
        {
          if (*(_QWORD *)v105 != v77)
            objc_enumerationMutation(v74);
          v79 = -[_SFPBButtonItem initWithFacade:]([_SFPBButtonItem alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v104 + 1) + 8 * k));
          if (v79)
            objc_msgSend(v73, "addObject:", v79);

        }
        v76 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v104, v116, 16);
      }
      while (v76);
    }

    v5 = v102;
    -[_SFPBDetailedRowCardSection setButtonItems:](v102, "setButtonItems:", v73);
    v4 = v103;
    objc_msgSend(v103, "trailingThumbnail");
    v80 = (void *)objc_claimAutoreleasedReturnValue();

    if (v80)
    {
      v81 = [_SFPBImage alloc];
      objc_msgSend(v103, "trailingThumbnail");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = -[_SFPBImage initWithFacade:](v81, "initWithFacade:", v82);
      -[_SFPBDetailedRowCardSection setTrailingThumbnail:](v102, "setTrailingThumbnail:", v83);

    }
    if (objc_msgSend(v103, "hasButtonItemsAreTrailing", v102))
      -[_SFPBDetailedRowCardSection setButtonItemsAreTrailing:](v5, "setButtonItemsAreTrailing:", objc_msgSend(v103, "buttonItemsAreTrailing"));
    objc_msgSend(v103, "topText");
    v84 = (void *)objc_claimAutoreleasedReturnValue();

    if (v84)
    {
      v85 = [_SFPBRichText alloc];
      objc_msgSend(v103, "topText");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v87 = -[_SFPBRichText initWithFacade:](v85, "initWithFacade:", v86);
      -[_SFPBDetailedRowCardSection setTopText:](v5, "setTopText:", v87);

    }
    objc_msgSend(v103, "richTrailingTopText");
    v88 = (void *)objc_claimAutoreleasedReturnValue();

    if (v88)
    {
      v89 = [_SFPBRichText alloc];
      objc_msgSend(v103, "richTrailingTopText");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v91 = -[_SFPBRichText initWithFacade:](v89, "initWithFacade:", v90);
      -[_SFPBDetailedRowCardSection setRichTrailingTopText:](v5, "setRichTrailingTopText:", v91);

    }
    objc_msgSend(v103, "richTrailingMiddleText");
    v92 = (void *)objc_claimAutoreleasedReturnValue();

    if (v92)
    {
      v93 = [_SFPBRichText alloc];
      objc_msgSend(v103, "richTrailingMiddleText");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v95 = -[_SFPBRichText initWithFacade:](v93, "initWithFacade:", v94);
      -[_SFPBDetailedRowCardSection setRichTrailingMiddleText:](v5, "setRichTrailingMiddleText:", v95);

    }
    objc_msgSend(v103, "richTrailingBottomText");
    v96 = (void *)objc_claimAutoreleasedReturnValue();

    if (v96)
    {
      v97 = [_SFPBRichText alloc];
      objc_msgSend(v103, "richTrailingBottomText");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      v99 = -[_SFPBRichText initWithFacade:](v97, "initWithFacade:", v98);
      -[_SFPBDetailedRowCardSection setRichTrailingBottomText:](v5, "setRichTrailingBottomText:", v99);

    }
    v100 = v5;

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

- (void)setPreventThumbnailImageScaling:(BOOL)a3
{
  self->_preventThumbnailImageScaling = a3;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (void)setSecondaryTitle:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryTitle, a3);
}

- (void)setSecondaryTitleImage:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryTitleImage, a3);
}

- (void)setIsSecondaryTitleDetached:(BOOL)a3
{
  self->_isSecondaryTitleDetached = a3;
}

- (void)setDescriptions:(id)a3
{
  NSArray *v4;
  NSArray *descriptions;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  descriptions = self->_descriptions;
  self->_descriptions = v4;

}

- (void)clearDescriptions
{
  -[NSArray removeAllObjects](self->_descriptions, "removeAllObjects");
}

- (void)addDescriptions:(id)a3
{
  id v4;
  NSArray *descriptions;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  descriptions = self->_descriptions;
  v8 = v4;
  if (!descriptions)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_descriptions;
    self->_descriptions = v6;

    v4 = v8;
    descriptions = self->_descriptions;
  }
  -[NSArray addObject:](descriptions, "addObject:", v4);

}

- (unint64_t)descriptionsCount
{
  return -[NSArray count](self->_descriptions, "count");
}

- (id)descriptionsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_descriptions, "objectAtIndexedSubscript:", a3);
}

- (void)setFootnote:(id)a3
{
  objc_storeStrong((id *)&self->_footnote, a3);
}

- (void)setTrailingTopText:(id)a3
{
  objc_storeStrong((id *)&self->_trailingTopText, a3);
}

- (void)setTrailingMiddleText:(id)a3
{
  objc_storeStrong((id *)&self->_trailingMiddleText, a3);
}

- (void)setTrailingBottomText:(id)a3
{
  objc_storeStrong((id *)&self->_trailingBottomText, a3);
}

- (void)setAction:(id)a3
{
  objc_storeStrong((id *)&self->_action, a3);
}

- (void)setButton:(id)a3
{
  objc_storeStrong((id *)&self->_button, a3);
}

- (void)setShouldUseCompactDisplay:(BOOL)a3
{
  self->_shouldUseCompactDisplay = a3;
}

- (void)setButtonItems:(id)a3
{
  NSArray *v4;
  NSArray *buttonItems;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  buttonItems = self->_buttonItems;
  self->_buttonItems = v4;

}

- (void)clearButtonItems
{
  -[NSArray removeAllObjects](self->_buttonItems, "removeAllObjects");
}

- (void)addButtonItems:(id)a3
{
  id v4;
  NSArray *buttonItems;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  buttonItems = self->_buttonItems;
  v8 = v4;
  if (!buttonItems)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_buttonItems;
    self->_buttonItems = v6;

    v4 = v8;
    buttonItems = self->_buttonItems;
  }
  -[NSArray addObject:](buttonItems, "addObject:", v4);

}

- (unint64_t)buttonItemsCount
{
  return -[NSArray count](self->_buttonItems, "count");
}

- (id)buttonItemsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_buttonItems, "objectAtIndexedSubscript:", a3);
}

- (void)setTrailingThumbnail:(id)a3
{
  objc_storeStrong((id *)&self->_trailingThumbnail, a3);
}

- (void)setButtonItemsAreTrailing:(BOOL)a3
{
  self->_buttonItemsAreTrailing = a3;
}

- (void)setTopText:(id)a3
{
  objc_storeStrong((id *)&self->_topText, a3);
}

- (void)setRichTrailingTopText:(id)a3
{
  objc_storeStrong((id *)&self->_richTrailingTopText, a3);
}

- (void)setRichTrailingMiddleText:(id)a3
{
  objc_storeStrong((id *)&self->_richTrailingMiddleText, a3);
}

- (void)setRichTrailingBottomText:(id)a3
{
  objc_storeStrong((id *)&self->_richTrailingBottomText, a3);
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBDetailedRowCardSectionReadFrom(self, (uint64_t)a3);
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_SFPBDetailedRowCardSection punchoutOptions](self, "punchoutOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v48;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v48 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
    }
    while (v7);
  }

  -[_SFPBDetailedRowCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    PBDataWriterWriteStringField();

  -[_SFPBDetailedRowCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    PBDataWriterWriteStringField();

  if (-[_SFPBDetailedRowCardSection canBeHidden](self, "canBeHidden"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBDetailedRowCardSection hasTopPadding](self, "hasTopPadding"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBDetailedRowCardSection hasBottomPadding](self, "hasBottomPadding"))
    PBDataWriterWriteBOOLField();
  -[_SFPBDetailedRowCardSection type](self, "type");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    PBDataWriterWriteStringField();

  if (-[_SFPBDetailedRowCardSection separatorStyle](self, "separatorStyle"))
    PBDataWriterWriteInt32Field();
  -[_SFPBDetailedRowCardSection backgroundColor](self, "backgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    PBDataWriterWriteSubmessage();

  -[_SFPBDetailedRowCardSection thumbnail](self, "thumbnail");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    PBDataWriterWriteSubmessage();

  if (-[_SFPBDetailedRowCardSection preventThumbnailImageScaling](self, "preventThumbnailImageScaling"))
    PBDataWriterWriteBOOLField();
  -[_SFPBDetailedRowCardSection title](self, "title");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    PBDataWriterWriteSubmessage();

  -[_SFPBDetailedRowCardSection secondaryTitle](self, "secondaryTitle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    PBDataWriterWriteSubmessage();

  -[_SFPBDetailedRowCardSection secondaryTitleImage](self, "secondaryTitleImage");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    PBDataWriterWriteSubmessage();

  if (-[_SFPBDetailedRowCardSection isSecondaryTitleDetached](self, "isSecondaryTitleDetached"))
    PBDataWriterWriteBOOLField();
  -[_SFPBDetailedRowCardSection descriptions](self, "descriptions");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v44;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v44 != v21)
          objc_enumerationMutation(v18);
        PBDataWriterWriteSubmessage();
        ++v22;
      }
      while (v20 != v22);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
    }
    while (v20);
  }

  -[_SFPBDetailedRowCardSection footnote](self, "footnote");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
    PBDataWriterWriteSubmessage();

  -[_SFPBDetailedRowCardSection trailingTopText](self, "trailingTopText");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
    PBDataWriterWriteSubmessage();

  -[_SFPBDetailedRowCardSection trailingMiddleText](self, "trailingMiddleText");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
    PBDataWriterWriteSubmessage();

  -[_SFPBDetailedRowCardSection trailingBottomText](self, "trailingBottomText");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
    PBDataWriterWriteSubmessage();

  -[_SFPBDetailedRowCardSection action](self, "action");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
    PBDataWriterWriteSubmessage();

  -[_SFPBDetailedRowCardSection button](self, "button");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
    PBDataWriterWriteSubmessage();

  if (-[_SFPBDetailedRowCardSection shouldUseCompactDisplay](self, "shouldUseCompactDisplay"))
    PBDataWriterWriteBOOLField();
  -[_SFPBDetailedRowCardSection buttonItems](self, "buttonItems");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v40;
    do
    {
      v33 = 0;
      do
      {
        if (*(_QWORD *)v40 != v32)
          objc_enumerationMutation(v29);
        PBDataWriterWriteSubmessage();
        ++v33;
      }
      while (v31 != v33);
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
    }
    while (v31);
  }

  -[_SFPBDetailedRowCardSection trailingThumbnail](self, "trailingThumbnail");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34)
    PBDataWriterWriteSubmessage();

  if (-[_SFPBDetailedRowCardSection buttonItemsAreTrailing](self, "buttonItemsAreTrailing"))
    PBDataWriterWriteBOOLField();
  -[_SFPBDetailedRowCardSection topText](self, "topText");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35)
    PBDataWriterWriteSubmessage();

  -[_SFPBDetailedRowCardSection richTrailingTopText](self, "richTrailingTopText");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (v36)
    PBDataWriterWriteSubmessage();

  -[_SFPBDetailedRowCardSection richTrailingMiddleText](self, "richTrailingMiddleText");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (v37)
    PBDataWriterWriteSubmessage();

  -[_SFPBDetailedRowCardSection richTrailingBottomText](self, "richTrailingBottomText");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (v38)
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
  int preventThumbnailImageScaling;
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
  int isSecondaryTitleDetached;
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
  int v87;
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  int v92;
  int shouldUseCompactDisplay;
  uint64_t v94;
  void *v95;
  void *v96;
  void *v97;
  int v98;
  uint64_t v99;
  void *v100;
  void *v101;
  void *v102;
  int v103;
  int buttonItemsAreTrailing;
  uint64_t v105;
  void *v106;
  void *v107;
  void *v108;
  int v109;
  uint64_t v110;
  void *v111;
  void *v112;
  void *v113;
  int v114;
  uint64_t v115;
  void *v116;
  void *v117;
  void *v118;
  int v119;
  uint64_t v120;
  void *v121;
  void *v122;
  void *v123;
  char v124;
  BOOL v125;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_120;
  -[_SFPBDetailedRowCardSection punchoutOptions](self, "punchoutOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "punchoutOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_119;
  -[_SFPBDetailedRowCardSection punchoutOptions](self, "punchoutOptions");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBDetailedRowCardSection punchoutOptions](self, "punchoutOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "punchoutOptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_120;
  }
  else
  {

  }
  -[_SFPBDetailedRowCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "punchoutPickerTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_119;
  -[_SFPBDetailedRowCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBDetailedRowCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "punchoutPickerTitle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_120;
  }
  else
  {

  }
  -[_SFPBDetailedRowCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "punchoutPickerDismissText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_119;
  -[_SFPBDetailedRowCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_SFPBDetailedRowCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "punchoutPickerDismissText");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_120;
  }
  else
  {

  }
  canBeHidden = self->_canBeHidden;
  if (canBeHidden != objc_msgSend(v4, "canBeHidden"))
    goto LABEL_120;
  hasTopPadding = self->_hasTopPadding;
  if (hasTopPadding != objc_msgSend(v4, "hasTopPadding"))
    goto LABEL_120;
  hasBottomPadding = self->_hasBottomPadding;
  if (hasBottomPadding != objc_msgSend(v4, "hasBottomPadding"))
    goto LABEL_120;
  -[_SFPBDetailedRowCardSection type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_119;
  -[_SFPBDetailedRowCardSection type](self, "type");
  v25 = objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v26 = (void *)v25;
    -[_SFPBDetailedRowCardSection type](self, "type");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "type");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v27, "isEqual:", v28);

    if (!v29)
      goto LABEL_120;
  }
  else
  {

  }
  separatorStyle = self->_separatorStyle;
  if (separatorStyle != objc_msgSend(v4, "separatorStyle"))
    goto LABEL_120;
  -[_SFPBDetailedRowCardSection backgroundColor](self, "backgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_119;
  -[_SFPBDetailedRowCardSection backgroundColor](self, "backgroundColor");
  v31 = objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    v32 = (void *)v31;
    -[_SFPBDetailedRowCardSection backgroundColor](self, "backgroundColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "backgroundColor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v33, "isEqual:", v34);

    if (!v35)
      goto LABEL_120;
  }
  else
  {

  }
  -[_SFPBDetailedRowCardSection thumbnail](self, "thumbnail");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "thumbnail");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_119;
  -[_SFPBDetailedRowCardSection thumbnail](self, "thumbnail");
  v36 = objc_claimAutoreleasedReturnValue();
  if (v36)
  {
    v37 = (void *)v36;
    -[_SFPBDetailedRowCardSection thumbnail](self, "thumbnail");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "thumbnail");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v38, "isEqual:", v39);

    if (!v40)
      goto LABEL_120;
  }
  else
  {

  }
  preventThumbnailImageScaling = self->_preventThumbnailImageScaling;
  if (preventThumbnailImageScaling != objc_msgSend(v4, "preventThumbnailImageScaling"))
    goto LABEL_120;
  -[_SFPBDetailedRowCardSection title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_119;
  -[_SFPBDetailedRowCardSection title](self, "title");
  v42 = objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    v43 = (void *)v42;
    -[_SFPBDetailedRowCardSection title](self, "title");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "title");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v44, "isEqual:", v45);

    if (!v46)
      goto LABEL_120;
  }
  else
  {

  }
  -[_SFPBDetailedRowCardSection secondaryTitle](self, "secondaryTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "secondaryTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_119;
  -[_SFPBDetailedRowCardSection secondaryTitle](self, "secondaryTitle");
  v47 = objc_claimAutoreleasedReturnValue();
  if (v47)
  {
    v48 = (void *)v47;
    -[_SFPBDetailedRowCardSection secondaryTitle](self, "secondaryTitle");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "secondaryTitle");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v49, "isEqual:", v50);

    if (!v51)
      goto LABEL_120;
  }
  else
  {

  }
  -[_SFPBDetailedRowCardSection secondaryTitleImage](self, "secondaryTitleImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "secondaryTitleImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_119;
  -[_SFPBDetailedRowCardSection secondaryTitleImage](self, "secondaryTitleImage");
  v52 = objc_claimAutoreleasedReturnValue();
  if (v52)
  {
    v53 = (void *)v52;
    -[_SFPBDetailedRowCardSection secondaryTitleImage](self, "secondaryTitleImage");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "secondaryTitleImage");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v54, "isEqual:", v55);

    if (!v56)
      goto LABEL_120;
  }
  else
  {

  }
  isSecondaryTitleDetached = self->_isSecondaryTitleDetached;
  if (isSecondaryTitleDetached != objc_msgSend(v4, "isSecondaryTitleDetached"))
    goto LABEL_120;
  -[_SFPBDetailedRowCardSection descriptions](self, "descriptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "descriptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_119;
  -[_SFPBDetailedRowCardSection descriptions](self, "descriptions");
  v58 = objc_claimAutoreleasedReturnValue();
  if (v58)
  {
    v59 = (void *)v58;
    -[_SFPBDetailedRowCardSection descriptions](self, "descriptions");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "descriptions");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v60, "isEqual:", v61);

    if (!v62)
      goto LABEL_120;
  }
  else
  {

  }
  -[_SFPBDetailedRowCardSection footnote](self, "footnote");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "footnote");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_119;
  -[_SFPBDetailedRowCardSection footnote](self, "footnote");
  v63 = objc_claimAutoreleasedReturnValue();
  if (v63)
  {
    v64 = (void *)v63;
    -[_SFPBDetailedRowCardSection footnote](self, "footnote");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "footnote");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend(v65, "isEqual:", v66);

    if (!v67)
      goto LABEL_120;
  }
  else
  {

  }
  -[_SFPBDetailedRowCardSection trailingTopText](self, "trailingTopText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trailingTopText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_119;
  -[_SFPBDetailedRowCardSection trailingTopText](self, "trailingTopText");
  v68 = objc_claimAutoreleasedReturnValue();
  if (v68)
  {
    v69 = (void *)v68;
    -[_SFPBDetailedRowCardSection trailingTopText](self, "trailingTopText");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "trailingTopText");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = objc_msgSend(v70, "isEqual:", v71);

    if (!v72)
      goto LABEL_120;
  }
  else
  {

  }
  -[_SFPBDetailedRowCardSection trailingMiddleText](self, "trailingMiddleText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trailingMiddleText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_119;
  -[_SFPBDetailedRowCardSection trailingMiddleText](self, "trailingMiddleText");
  v73 = objc_claimAutoreleasedReturnValue();
  if (v73)
  {
    v74 = (void *)v73;
    -[_SFPBDetailedRowCardSection trailingMiddleText](self, "trailingMiddleText");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "trailingMiddleText");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = objc_msgSend(v75, "isEqual:", v76);

    if (!v77)
      goto LABEL_120;
  }
  else
  {

  }
  -[_SFPBDetailedRowCardSection trailingBottomText](self, "trailingBottomText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trailingBottomText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_119;
  -[_SFPBDetailedRowCardSection trailingBottomText](self, "trailingBottomText");
  v78 = objc_claimAutoreleasedReturnValue();
  if (v78)
  {
    v79 = (void *)v78;
    -[_SFPBDetailedRowCardSection trailingBottomText](self, "trailingBottomText");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "trailingBottomText");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = objc_msgSend(v80, "isEqual:", v81);

    if (!v82)
      goto LABEL_120;
  }
  else
  {

  }
  -[_SFPBDetailedRowCardSection action](self, "action");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "action");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_119;
  -[_SFPBDetailedRowCardSection action](self, "action");
  v83 = objc_claimAutoreleasedReturnValue();
  if (v83)
  {
    v84 = (void *)v83;
    -[_SFPBDetailedRowCardSection action](self, "action");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "action");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = objc_msgSend(v85, "isEqual:", v86);

    if (!v87)
      goto LABEL_120;
  }
  else
  {

  }
  -[_SFPBDetailedRowCardSection button](self, "button");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "button");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_119;
  -[_SFPBDetailedRowCardSection button](self, "button");
  v88 = objc_claimAutoreleasedReturnValue();
  if (v88)
  {
    v89 = (void *)v88;
    -[_SFPBDetailedRowCardSection button](self, "button");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "button");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = objc_msgSend(v90, "isEqual:", v91);

    if (!v92)
      goto LABEL_120;
  }
  else
  {

  }
  shouldUseCompactDisplay = self->_shouldUseCompactDisplay;
  if (shouldUseCompactDisplay != objc_msgSend(v4, "shouldUseCompactDisplay"))
    goto LABEL_120;
  -[_SFPBDetailedRowCardSection buttonItems](self, "buttonItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "buttonItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_119;
  -[_SFPBDetailedRowCardSection buttonItems](self, "buttonItems");
  v94 = objc_claimAutoreleasedReturnValue();
  if (v94)
  {
    v95 = (void *)v94;
    -[_SFPBDetailedRowCardSection buttonItems](self, "buttonItems");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "buttonItems");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = objc_msgSend(v96, "isEqual:", v97);

    if (!v98)
      goto LABEL_120;
  }
  else
  {

  }
  -[_SFPBDetailedRowCardSection trailingThumbnail](self, "trailingThumbnail");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trailingThumbnail");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_119;
  -[_SFPBDetailedRowCardSection trailingThumbnail](self, "trailingThumbnail");
  v99 = objc_claimAutoreleasedReturnValue();
  if (v99)
  {
    v100 = (void *)v99;
    -[_SFPBDetailedRowCardSection trailingThumbnail](self, "trailingThumbnail");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "trailingThumbnail");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = objc_msgSend(v101, "isEqual:", v102);

    if (!v103)
      goto LABEL_120;
  }
  else
  {

  }
  buttonItemsAreTrailing = self->_buttonItemsAreTrailing;
  if (buttonItemsAreTrailing != objc_msgSend(v4, "buttonItemsAreTrailing"))
    goto LABEL_120;
  -[_SFPBDetailedRowCardSection topText](self, "topText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_119;
  -[_SFPBDetailedRowCardSection topText](self, "topText");
  v105 = objc_claimAutoreleasedReturnValue();
  if (v105)
  {
    v106 = (void *)v105;
    -[_SFPBDetailedRowCardSection topText](self, "topText");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "topText");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = objc_msgSend(v107, "isEqual:", v108);

    if (!v109)
      goto LABEL_120;
  }
  else
  {

  }
  -[_SFPBDetailedRowCardSection richTrailingTopText](self, "richTrailingTopText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "richTrailingTopText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_119;
  -[_SFPBDetailedRowCardSection richTrailingTopText](self, "richTrailingTopText");
  v110 = objc_claimAutoreleasedReturnValue();
  if (v110)
  {
    v111 = (void *)v110;
    -[_SFPBDetailedRowCardSection richTrailingTopText](self, "richTrailingTopText");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "richTrailingTopText");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    v114 = objc_msgSend(v112, "isEqual:", v113);

    if (!v114)
      goto LABEL_120;
  }
  else
  {

  }
  -[_SFPBDetailedRowCardSection richTrailingMiddleText](self, "richTrailingMiddleText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "richTrailingMiddleText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_119;
  -[_SFPBDetailedRowCardSection richTrailingMiddleText](self, "richTrailingMiddleText");
  v115 = objc_claimAutoreleasedReturnValue();
  if (v115)
  {
    v116 = (void *)v115;
    -[_SFPBDetailedRowCardSection richTrailingMiddleText](self, "richTrailingMiddleText");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "richTrailingMiddleText");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    v119 = objc_msgSend(v117, "isEqual:", v118);

    if (!v119)
      goto LABEL_120;
  }
  else
  {

  }
  -[_SFPBDetailedRowCardSection richTrailingBottomText](self, "richTrailingBottomText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "richTrailingBottomText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_119:

    goto LABEL_120;
  }
  -[_SFPBDetailedRowCardSection richTrailingBottomText](self, "richTrailingBottomText");
  v120 = objc_claimAutoreleasedReturnValue();
  if (!v120)
  {

LABEL_123:
    v125 = 1;
    goto LABEL_121;
  }
  v121 = (void *)v120;
  -[_SFPBDetailedRowCardSection richTrailingBottomText](self, "richTrailingBottomText");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "richTrailingBottomText");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v124 = objc_msgSend(v122, "isEqual:", v123);

  if ((v124 & 1) != 0)
    goto LABEL_123;
LABEL_120:
  v125 = 0;
LABEL_121:

  return v125;
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
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  NSUInteger v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSUInteger v39;
  NSUInteger v40;
  uint64_t v41;

  v41 = -[NSArray hash](self->_punchoutOptions, "hash");
  v40 = -[NSString hash](self->_punchoutPickerTitle, "hash");
  v3 = -[NSString hash](self->_punchoutPickerDismissText, "hash");
  if (self->_canBeHidden)
    v4 = 2654435761;
  else
    v4 = 0;
  v38 = v4;
  v39 = v3;
  if (self->_hasTopPadding)
    v5 = 2654435761;
  else
    v5 = 0;
  if (self->_hasBottomPadding)
    v6 = 2654435761;
  else
    v6 = 0;
  v36 = v6;
  v37 = v5;
  v7 = -[NSString hash](self->_type, "hash");
  v34 = 2654435761 * self->_separatorStyle;
  v35 = v7;
  v33 = -[_SFPBColor hash](self->_backgroundColor, "hash");
  v8 = -[_SFPBImage hash](self->_thumbnail, "hash");
  if (self->_preventThumbnailImageScaling)
    v9 = 2654435761;
  else
    v9 = 0;
  v31 = v9;
  v32 = v8;
  v30 = -[_SFPBRichText hash](self->_title, "hash");
  v29 = -[_SFPBFormattedText hash](self->_secondaryTitle, "hash");
  v10 = -[_SFPBImage hash](self->_secondaryTitleImage, "hash");
  if (self->_isSecondaryTitleDetached)
    v11 = 2654435761;
  else
    v11 = 0;
  v27 = v11;
  v28 = v10;
  v26 = -[NSArray hash](self->_descriptions, "hash");
  v12 = -[_SFPBRichText hash](self->_footnote, "hash");
  v13 = -[_SFPBFormattedText hash](self->_trailingTopText, "hash");
  v14 = -[_SFPBFormattedText hash](self->_trailingMiddleText, "hash");
  v15 = -[_SFPBFormattedText hash](self->_trailingBottomText, "hash");
  v16 = -[_SFPBActionItem hash](self->_action, "hash");
  v17 = -[_SFPBButton hash](self->_button, "hash");
  if (self->_shouldUseCompactDisplay)
    v18 = 2654435761;
  else
    v18 = 0;
  v19 = -[NSArray hash](self->_buttonItems, "hash");
  v20 = -[_SFPBImage hash](self->_trailingThumbnail, "hash");
  if (self->_buttonItemsAreTrailing)
    v21 = 2654435761;
  else
    v21 = 0;
  v22 = v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ -[_SFPBRichText hash](self->_topText, "hash");
  v23 = v40 ^ v41 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v12 ^ v13 ^ v14 ^ v15 ^ v22 ^ -[_SFPBRichText hash](self->_richTrailingTopText, "hash");
  v24 = -[_SFPBRichText hash](self->_richTrailingMiddleText, "hash");
  return v23 ^ v24 ^ -[_SFPBRichText hash](self->_richTrailingBottomText, "hash");
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
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
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
  void *v37;
  void *v38;
  NSArray *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t k;
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
  uint64_t v65;
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
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  id v91;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  _BYTE v105[128];
  _BYTE v106[128];
  _BYTE v107[128];
  uint64_t v108;

  v108 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_action)
  {
    -[_SFPBDetailedRowCardSection action](self, "action");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("action"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("action"));

    }
  }
  if (self->_backgroundColor)
  {
    -[_SFPBDetailedRowCardSection backgroundColor](self, "backgroundColor");
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
  if (self->_button)
  {
    -[_SFPBDetailedRowCardSection button](self, "button");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("button"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("button"));

    }
  }
  if (-[NSArray count](self->_buttonItems, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = 0u;
    v102 = 0u;
    v103 = 0u;
    v104 = 0u;
    v14 = self->_buttonItems;
    v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v101, v107, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v102;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v102 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v101 + 1) + 8 * i), "dictionaryRepresentation");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
          {
            objc_msgSend(v13, "addObject:", v19);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "addObject:", v20);

          }
        }
        v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v101, v107, 16);
      }
      while (v16);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("buttonItems"));
  }
  if (self->_buttonItemsAreTrailing)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBDetailedRowCardSection buttonItemsAreTrailing](self, "buttonItemsAreTrailing"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("buttonItemsAreTrailing"));

  }
  if (self->_canBeHidden)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBDetailedRowCardSection canBeHidden](self, "canBeHidden"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("canBeHidden"));

  }
  if (-[NSArray count](self->_descriptions, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = 0u;
    v98 = 0u;
    v99 = 0u;
    v100 = 0u;
    v24 = self->_descriptions;
    v25 = -[NSArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v97, v106, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v98;
      do
      {
        for (j = 0; j != v26; ++j)
        {
          if (*(_QWORD *)v98 != v27)
            objc_enumerationMutation(v24);
          objc_msgSend(*(id *)(*((_QWORD *)&v97 + 1) + 8 * j), "dictionaryRepresentation");
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
        v26 = -[NSArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v97, v106, 16);
      }
      while (v26);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("descriptions"));
  }
  if (self->_footnote)
  {
    -[_SFPBDetailedRowCardSection footnote](self, "footnote");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "dictionaryRepresentation");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("footnote"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("footnote"));

    }
  }
  if (self->_hasBottomPadding)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBDetailedRowCardSection hasBottomPadding](self, "hasBottomPadding"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("hasBottomPadding"));

  }
  if (self->_hasTopPadding)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBDetailedRowCardSection hasTopPadding](self, "hasTopPadding"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("hasTopPadding"));

  }
  if (self->_isSecondaryTitleDetached)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBDetailedRowCardSection isSecondaryTitleDetached](self, "isSecondaryTitleDetached"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("isSecondaryTitleDetached"));

  }
  if (self->_preventThumbnailImageScaling)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBDetailedRowCardSection preventThumbnailImageScaling](self, "preventThumbnailImageScaling"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR("preventThumbnailImageScaling"));

  }
  if (-[NSArray count](self->_punchoutOptions, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = 0u;
    v94 = 0u;
    v95 = 0u;
    v96 = 0u;
    v39 = self->_punchoutOptions;
    v40 = -[NSArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v93, v105, 16);
    if (v40)
    {
      v41 = v40;
      v42 = *(_QWORD *)v94;
      do
      {
        for (k = 0; k != v41; ++k)
        {
          if (*(_QWORD *)v94 != v42)
            objc_enumerationMutation(v39);
          objc_msgSend(*(id *)(*((_QWORD *)&v93 + 1) + 8 * k), "dictionaryRepresentation");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          if (v44)
          {
            objc_msgSend(v38, "addObject:", v44);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "addObject:", v45);

          }
        }
        v41 = -[NSArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v93, v105, 16);
      }
      while (v41);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, CFSTR("punchoutOptions"));
  }
  if (self->_punchoutPickerDismissText)
  {
    -[_SFPBDetailedRowCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = (void *)objc_msgSend(v46, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v47, CFSTR("punchoutPickerDismissText"));

  }
  if (self->_punchoutPickerTitle)
  {
    -[_SFPBDetailedRowCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = (void *)objc_msgSend(v48, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v49, CFSTR("punchoutPickerTitle"));

  }
  if (self->_richTrailingBottomText)
  {
    -[_SFPBDetailedRowCardSection richTrailingBottomText](self, "richTrailingBottomText");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "dictionaryRepresentation");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (v51)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v51, CFSTR("richTrailingBottomText"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v52, CFSTR("richTrailingBottomText"));

    }
  }
  if (self->_richTrailingMiddleText)
  {
    -[_SFPBDetailedRowCardSection richTrailingMiddleText](self, "richTrailingMiddleText");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "dictionaryRepresentation");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    if (v54)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v54, CFSTR("richTrailingMiddleText"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v55, CFSTR("richTrailingMiddleText"));

    }
  }
  if (self->_richTrailingTopText)
  {
    -[_SFPBDetailedRowCardSection richTrailingTopText](self, "richTrailingTopText");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "dictionaryRepresentation");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    if (v57)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v57, CFSTR("richTrailingTopText"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v58, CFSTR("richTrailingTopText"));

    }
  }
  if (self->_secondaryTitle)
  {
    -[_SFPBDetailedRowCardSection secondaryTitle](self, "secondaryTitle");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "dictionaryRepresentation");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    if (v60)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v60, CFSTR("secondaryTitle"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v61, CFSTR("secondaryTitle"));

    }
  }
  if (self->_secondaryTitleImage)
  {
    -[_SFPBDetailedRowCardSection secondaryTitleImage](self, "secondaryTitleImage");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "dictionaryRepresentation");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    if (v63)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v63, CFSTR("secondaryTitleImage"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v64, CFSTR("secondaryTitleImage"));

    }
  }
  if (self->_separatorStyle)
  {
    v65 = -[_SFPBDetailedRowCardSection separatorStyle](self, "separatorStyle");
    if (v65 >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v65);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v66 = *(&off_1E40421B0 + v65);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v66, CFSTR("separatorStyle"));

  }
  if (self->_shouldUseCompactDisplay)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBDetailedRowCardSection shouldUseCompactDisplay](self, "shouldUseCompactDisplay"));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v67, CFSTR("shouldUseCompactDisplay"));

  }
  if (self->_thumbnail)
  {
    -[_SFPBDetailedRowCardSection thumbnail](self, "thumbnail");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "dictionaryRepresentation");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    if (v69)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v69, CFSTR("thumbnail"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v70, CFSTR("thumbnail"));

    }
  }
  if (self->_title)
  {
    -[_SFPBDetailedRowCardSection title](self, "title");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "dictionaryRepresentation");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    if (v72)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v72, CFSTR("title"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v73, CFSTR("title"));

    }
  }
  if (self->_topText)
  {
    -[_SFPBDetailedRowCardSection topText](self, "topText");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "dictionaryRepresentation");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    if (v75)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v75, CFSTR("topText"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v76, CFSTR("topText"));

    }
  }
  if (self->_trailingBottomText)
  {
    -[_SFPBDetailedRowCardSection trailingBottomText](self, "trailingBottomText");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "dictionaryRepresentation");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    if (v78)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v78, CFSTR("trailingBottomText"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v79, CFSTR("trailingBottomText"));

    }
  }
  if (self->_trailingMiddleText)
  {
    -[_SFPBDetailedRowCardSection trailingMiddleText](self, "trailingMiddleText");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "dictionaryRepresentation");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    if (v81)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v81, CFSTR("trailingMiddleText"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v82, CFSTR("trailingMiddleText"));

    }
  }
  if (self->_trailingThumbnail)
  {
    -[_SFPBDetailedRowCardSection trailingThumbnail](self, "trailingThumbnail");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "dictionaryRepresentation");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    if (v84)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v84, CFSTR("trailingThumbnail"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v85, CFSTR("trailingThumbnail"));

    }
  }
  if (self->_trailingTopText)
  {
    -[_SFPBDetailedRowCardSection trailingTopText](self, "trailingTopText");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "dictionaryRepresentation");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    if (v87)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v87, CFSTR("trailingTopText"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v88, CFSTR("trailingTopText"));

    }
  }
  if (self->_type)
  {
    -[_SFPBDetailedRowCardSection type](self, "type");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = (void *)objc_msgSend(v89, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v90, CFSTR("type"));

  }
  v91 = v3;

  return v91;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBDetailedRowCardSection dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBDetailedRowCardSection)initWithJSON:(id)a3
{
  void *v4;
  _SFPBDetailedRowCardSection *v5;
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
    self = -[_SFPBDetailedRowCardSection initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBDetailedRowCardSection)initWithDictionary:(id)a3
{
  id v4;
  _SFPBDetailedRowCardSection *v5;
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
  __objc2_class **v27;
  _SFPBImage *v28;
  void *v29;
  uint64_t v30;
  _SFPBRichText *v31;
  uint64_t v32;
  _SFPBFormattedText *v33;
  uint64_t v34;
  _SFPBImage *v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  uint64_t v43;
  _SFPBRichText *v44;
  uint64_t v45;
  _SFPBRichText *v46;
  uint64_t v47;
  _SFPBFormattedText *v48;
  uint64_t v49;
  _SFPBFormattedText *v50;
  uint64_t v51;
  _SFPBFormattedText *v52;
  uint64_t v53;
  _SFPBActionItem *v54;
  uint64_t v55;
  _SFPBButton *v56;
  void *v57;
  void *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t k;
  uint64_t v64;
  _SFPBButtonItem *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  _SFPBRichText *v70;
  void *v71;
  _SFPBRichText *v72;
  void *v73;
  _SFPBRichText *v74;
  void *v75;
  _SFPBRichText *v76;
  _SFPBDetailedRowCardSection *v77;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  objc_super v114;
  _BYTE v115[128];
  _BYTE v116[128];
  _BYTE v117[128];
  uint64_t v118;

  v118 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v114.receiver = self;
  v114.super_class = (Class)_SFPBDetailedRowCardSection;
  v5 = -[_SFPBDetailedRowCardSection init](&v114, sel_init);

  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("punchoutOptions"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v112 = 0u;
      v113 = 0u;
      v110 = 0u;
      v111 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v110, v117, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v111;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v111 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v110 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v13 = -[_SFPBPunchout initWithDictionary:]([_SFPBPunchout alloc], "initWithDictionary:", v12);
              -[_SFPBDetailedRowCardSection addPunchoutOptions:](v5, "addPunchoutOptions:", v13);

            }
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v110, v117, 16);
        }
        while (v9);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("punchoutPickerTitle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v101 = v14;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = (void *)objc_msgSend(v14, "copy");
      -[_SFPBDetailedRowCardSection setPunchoutPickerTitle:](v5, "setPunchoutPickerTitle:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("punchoutPickerDismissText"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v100 = v16;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = (void *)objc_msgSend(v16, "copy");
      -[_SFPBDetailedRowCardSection setPunchoutPickerDismissText:](v5, "setPunchoutPickerDismissText:", v17);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("canBeHidden"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v99 = v18;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBDetailedRowCardSection setCanBeHidden:](v5, "setCanBeHidden:", objc_msgSend(v18, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasTopPadding"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v98 = v19;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBDetailedRowCardSection setHasTopPadding:](v5, "setHasTopPadding:", objc_msgSend(v19, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasBottomPadding"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v97 = v20;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBDetailedRowCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", objc_msgSend(v20, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v96 = v21;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = (void *)objc_msgSend(v21, "copy");
      -[_SFPBDetailedRowCardSection setType:](v5, "setType:", v22);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("separatorStyle"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v95 = v23;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBDetailedRowCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", objc_msgSend(v23, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("backgroundColor"));
    v24 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v94 = (void *)v24;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = -[_SFPBColor initWithDictionary:]([_SFPBColor alloc], "initWithDictionary:", v24);
      -[_SFPBDetailedRowCardSection setBackgroundColor:](v5, "setBackgroundColor:", v25);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("thumbnail"));
    v26 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v93 = (void *)v26;
    v27 = off_1E4040000;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v28 = -[_SFPBImage initWithDictionary:]([_SFPBImage alloc], "initWithDictionary:", v26);
      -[_SFPBDetailedRowCardSection setThumbnail:](v5, "setThumbnail:", v28);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("preventThumbnailImageScaling"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBDetailedRowCardSection setPreventThumbnailImageScaling:](v5, "setPreventThumbnailImageScaling:", objc_msgSend(v29, "BOOLValue"));
    v81 = v29;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("title"));
    v30 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v92 = (void *)v30;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v31 = -[_SFPBRichText initWithDictionary:]([_SFPBRichText alloc], "initWithDictionary:", v30);
      -[_SFPBDetailedRowCardSection setTitle:](v5, "setTitle:", v31);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("secondaryTitle"));
    v32 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v91 = (void *)v32;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v33 = -[_SFPBFormattedText initWithDictionary:]([_SFPBFormattedText alloc], "initWithDictionary:", v32);
      -[_SFPBDetailedRowCardSection setSecondaryTitle:](v5, "setSecondaryTitle:", v33);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("secondaryTitleImage"));
    v34 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v90 = (void *)v34;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v35 = -[_SFPBImage initWithDictionary:]([_SFPBImage alloc], "initWithDictionary:", v34);
      -[_SFPBDetailedRowCardSection setSecondaryTitleImage:](v5, "setSecondaryTitleImage:", v35);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isSecondaryTitleDetached"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBDetailedRowCardSection setIsSecondaryTitleDetached:](v5, "setIsSecondaryTitleDetached:", objc_msgSend(v36, "BOOLValue"));
    v80 = v36;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("descriptions"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v89 = v37;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v108 = 0u;
      v109 = 0u;
      v106 = 0u;
      v107 = 0u;
      v38 = v37;
      v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v106, v116, 16);
      if (v39)
      {
        v40 = v39;
        v41 = *(_QWORD *)v107;
        do
        {
          for (j = 0; j != v40; ++j)
          {
            if (*(_QWORD *)v107 != v41)
              objc_enumerationMutation(v38);
            v43 = *(_QWORD *)(*((_QWORD *)&v106 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v44 = -[_SFPBRichText initWithDictionary:]([_SFPBRichText alloc], "initWithDictionary:", v43);
              -[_SFPBDetailedRowCardSection addDescriptions:](v5, "addDescriptions:", v44);

            }
          }
          v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v106, v116, 16);
        }
        while (v40);
      }

      v27 = off_1E4040000;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("footnote"));
    v45 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v88 = (void *)v45;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v46 = -[_SFPBRichText initWithDictionary:]([_SFPBRichText alloc], "initWithDictionary:", v45);
      -[_SFPBDetailedRowCardSection setFootnote:](v5, "setFootnote:", v46);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trailingTopText"));
    v47 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v87 = (void *)v47;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v48 = -[_SFPBFormattedText initWithDictionary:]([_SFPBFormattedText alloc], "initWithDictionary:", v47);
      -[_SFPBDetailedRowCardSection setTrailingTopText:](v5, "setTrailingTopText:", v48);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trailingMiddleText"));
    v49 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v86 = (void *)v49;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v50 = -[_SFPBFormattedText initWithDictionary:]([_SFPBFormattedText alloc], "initWithDictionary:", v49);
      -[_SFPBDetailedRowCardSection setTrailingMiddleText:](v5, "setTrailingMiddleText:", v50);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trailingBottomText"));
    v51 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v85 = (void *)v51;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v52 = -[_SFPBFormattedText initWithDictionary:]([_SFPBFormattedText alloc], "initWithDictionary:", v51);
      -[_SFPBDetailedRowCardSection setTrailingBottomText:](v5, "setTrailingBottomText:", v52);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("action"));
    v53 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v84 = (void *)v53;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v54 = -[_SFPBActionItem initWithDictionary:]([_SFPBActionItem alloc], "initWithDictionary:", v53);
      -[_SFPBDetailedRowCardSection setAction:](v5, "setAction:", v54);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("button"));
    v55 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v83 = (void *)v55;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v56 = -[_SFPBButton initWithDictionary:]([_SFPBButton alloc], "initWithDictionary:", v55);
      -[_SFPBDetailedRowCardSection setButton:](v5, "setButton:", v56);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("shouldUseCompactDisplay"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBDetailedRowCardSection setShouldUseCompactDisplay:](v5, "setShouldUseCompactDisplay:", objc_msgSend(v57, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("buttonItems"), v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v82 = v58;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v104 = 0u;
      v105 = 0u;
      v102 = 0u;
      v103 = 0u;
      v59 = v58;
      v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v102, v115, 16);
      if (v60)
      {
        v61 = v60;
        v62 = *(_QWORD *)v103;
        do
        {
          for (k = 0; k != v61; ++k)
          {
            if (*(_QWORD *)v103 != v62)
              objc_enumerationMutation(v59);
            v64 = *(_QWORD *)(*((_QWORD *)&v102 + 1) + 8 * k);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v65 = -[_SFPBButtonItem initWithDictionary:]([_SFPBButtonItem alloc], "initWithDictionary:", v64);
              -[_SFPBDetailedRowCardSection addButtonItems:](v5, "addButtonItems:", v65);

            }
          }
          v61 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v102, v115, 16);
        }
        while (v61);
      }

      v27 = off_1E4040000;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trailingThumbnail"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v67 = (void *)objc_msgSend(objc_alloc(v27[368]), "initWithDictionary:", v66);
      -[_SFPBDetailedRowCardSection setTrailingThumbnail:](v5, "setTrailingThumbnail:", v67);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("buttonItemsAreTrailing"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBDetailedRowCardSection setButtonItemsAreTrailing:](v5, "setButtonItemsAreTrailing:", objc_msgSend(v68, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("topText"));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v70 = -[_SFPBRichText initWithDictionary:]([_SFPBRichText alloc], "initWithDictionary:", v69);
      -[_SFPBDetailedRowCardSection setTopText:](v5, "setTopText:", v70);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("richTrailingTopText"));
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v72 = -[_SFPBRichText initWithDictionary:]([_SFPBRichText alloc], "initWithDictionary:", v71);
      -[_SFPBDetailedRowCardSection setRichTrailingTopText:](v5, "setRichTrailingTopText:", v72);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("richTrailingMiddleText"));
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v74 = -[_SFPBRichText initWithDictionary:]([_SFPBRichText alloc], "initWithDictionary:", v73);
      -[_SFPBDetailedRowCardSection setRichTrailingMiddleText:](v5, "setRichTrailingMiddleText:", v74);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("richTrailingBottomText"));
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v76 = -[_SFPBRichText initWithDictionary:]([_SFPBRichText alloc], "initWithDictionary:", v75);
      -[_SFPBDetailedRowCardSection setRichTrailingBottomText:](v5, "setRichTrailingBottomText:", v76);

    }
    v77 = v5;

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

- (BOOL)preventThumbnailImageScaling
{
  return self->_preventThumbnailImageScaling;
}

- (_SFPBRichText)title
{
  return self->_title;
}

- (_SFPBFormattedText)secondaryTitle
{
  return self->_secondaryTitle;
}

- (_SFPBImage)secondaryTitleImage
{
  return self->_secondaryTitleImage;
}

- (BOOL)isSecondaryTitleDetached
{
  return self->_isSecondaryTitleDetached;
}

- (NSArray)descriptions
{
  return self->_descriptions;
}

- (_SFPBRichText)footnote
{
  return self->_footnote;
}

- (_SFPBFormattedText)trailingTopText
{
  return self->_trailingTopText;
}

- (_SFPBFormattedText)trailingMiddleText
{
  return self->_trailingMiddleText;
}

- (_SFPBFormattedText)trailingBottomText
{
  return self->_trailingBottomText;
}

- (_SFPBActionItem)action
{
  return self->_action;
}

- (_SFPBButton)button
{
  return self->_button;
}

- (BOOL)shouldUseCompactDisplay
{
  return self->_shouldUseCompactDisplay;
}

- (NSArray)buttonItems
{
  return self->_buttonItems;
}

- (_SFPBImage)trailingThumbnail
{
  return self->_trailingThumbnail;
}

- (BOOL)buttonItemsAreTrailing
{
  return self->_buttonItemsAreTrailing;
}

- (_SFPBRichText)topText
{
  return self->_topText;
}

- (_SFPBRichText)richTrailingTopText
{
  return self->_richTrailingTopText;
}

- (_SFPBRichText)richTrailingMiddleText
{
  return self->_richTrailingMiddleText;
}

- (_SFPBRichText)richTrailingBottomText
{
  return self->_richTrailingBottomText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_richTrailingBottomText, 0);
  objc_storeStrong((id *)&self->_richTrailingMiddleText, 0);
  objc_storeStrong((id *)&self->_richTrailingTopText, 0);
  objc_storeStrong((id *)&self->_topText, 0);
  objc_storeStrong((id *)&self->_trailingThumbnail, 0);
  objc_storeStrong((id *)&self->_buttonItems, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_trailingBottomText, 0);
  objc_storeStrong((id *)&self->_trailingMiddleText, 0);
  objc_storeStrong((id *)&self->_trailingTopText, 0);
  objc_storeStrong((id *)&self->_footnote, 0);
  objc_storeStrong((id *)&self->_descriptions, 0);
  objc_storeStrong((id *)&self->_secondaryTitleImage, 0);
  objc_storeStrong((id *)&self->_secondaryTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_punchoutPickerDismissText, 0);
  objc_storeStrong((id *)&self->_punchoutPickerTitle, 0);
  objc_storeStrong((id *)&self->_punchoutOptions, 0);
}

@end
