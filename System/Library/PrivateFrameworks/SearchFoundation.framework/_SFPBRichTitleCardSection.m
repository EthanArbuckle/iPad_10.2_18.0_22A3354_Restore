@implementation _SFPBRichTitleCardSection

- (_SFPBRichTitleCardSection)initWithFacade:(id)a3
{
  id v4;
  _SFPBRichTitleCardSection *v5;
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
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _SFPBImage *v41;
  void *v42;
  _SFPBImage *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t j;
  _SFPBImage *v53;
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
  _SFPBImage *v65;
  void *v66;
  _SFPBImage *v67;
  void *v68;
  _SFPBActionItem *v69;
  void *v70;
  _SFPBActionItem *v71;
  void *v72;
  id v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t k;
  _SFPBMediaOffer *v79;
  void *v80;
  void *v81;
  void *v82;
  _SFPBRichText *v83;
  void *v84;
  _SFPBRichText *v85;
  void *v86;
  id v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t m;
  _SFPBButtonItem *v93;
  _SFPBRichTitleCardSection *v94;
  _SFPBRichTitleCardSection *v96;
  id v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
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
  _BYTE v114[128];
  _BYTE v115[128];
  _BYTE v116[128];
  _BYTE v117[128];
  uint64_t v118;

  v118 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[_SFPBRichTitleCardSection init](self, "init");

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

    v112 = 0u;
    v113 = 0u;
    v110 = 0u;
    v111 = 0u;
    objc_msgSend(v4, "punchoutOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v110, v117, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v111;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v111 != v11)
            objc_enumerationMutation(v8);
          v13 = -[_SFPBPunchout initWithFacade:]([_SFPBPunchout alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v110 + 1) + 8 * i));
          if (v13)
            objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v110, v117, 16);
      }
      while (v10);
    }

    -[_SFPBRichTitleCardSection setPunchoutOptions:](v5, "setPunchoutOptions:", v7);
    objc_msgSend(v4, "punchoutPickerTitle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v4, "punchoutPickerTitle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBRichTitleCardSection setPunchoutPickerTitle:](v5, "setPunchoutPickerTitle:", v15);

    }
    objc_msgSend(v4, "punchoutPickerDismissText");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v4, "punchoutPickerDismissText");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBRichTitleCardSection setPunchoutPickerDismissText:](v5, "setPunchoutPickerDismissText:", v17);

    }
    if (objc_msgSend(v4, "hasCanBeHidden"))
      -[_SFPBRichTitleCardSection setCanBeHidden:](v5, "setCanBeHidden:", objc_msgSend(v4, "canBeHidden"));
    if (objc_msgSend(v4, "hasHasTopPadding"))
      -[_SFPBRichTitleCardSection setHasTopPadding:](v5, "setHasTopPadding:", objc_msgSend(v4, "hasTopPadding"));
    if (objc_msgSend(v4, "hasHasBottomPadding"))
      -[_SFPBRichTitleCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", objc_msgSend(v4, "hasBottomPadding"));
    objc_msgSend(v4, "type");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v4, "type");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBRichTitleCardSection setType:](v5, "setType:", v19);

    }
    if (objc_msgSend(v4, "hasSeparatorStyle"))
      -[_SFPBRichTitleCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", objc_msgSend(v4, "separatorStyle"));
    objc_msgSend(v4, "backgroundColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v21 = [_SFPBColor alloc];
      objc_msgSend(v4, "backgroundColor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[_SFPBColor initWithFacade:](v21, "initWithFacade:", v22);
      -[_SFPBRichTitleCardSection setBackgroundColor:](v5, "setBackgroundColor:", v23);

    }
    objc_msgSend(v4, "title");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v4, "title");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBRichTitleCardSection setTitle:](v5, "setTitle:", v25);

    }
    objc_msgSend(v4, "subtitle");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      objc_msgSend(v4, "subtitle");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBRichTitleCardSection setSubtitle:](v5, "setSubtitle:", v27);

    }
    objc_msgSend(v4, "contentAdvisory");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend(v4, "contentAdvisory");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBRichTitleCardSection setContentAdvisory:](v5, "setContentAdvisory:", v29);

    }
    objc_msgSend(v4, "titleImage");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      v31 = [_SFPBImage alloc];
      objc_msgSend(v4, "titleImage");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = -[_SFPBImage initWithFacade:](v31, "initWithFacade:", v32);
      -[_SFPBRichTitleCardSection setTitleImage:](v5, "setTitleImage:", v33);

    }
    if (objc_msgSend(v4, "hasIsCentered"))
      -[_SFPBRichTitleCardSection setIsCentered:](v5, "setIsCentered:", objc_msgSend(v4, "isCentered"));
    objc_msgSend(v4, "descriptionText");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      objc_msgSend(v4, "descriptionText");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBRichTitleCardSection setDescriptionText:](v5, "setDescriptionText:", v35);

    }
    objc_msgSend(v4, "rating");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      objc_msgSend(v4, "rating");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "floatValue");
      -[_SFPBRichTitleCardSection setRating:](v5, "setRating:");

    }
    objc_msgSend(v4, "ratingText");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      objc_msgSend(v4, "ratingText");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBRichTitleCardSection setRatingText:](v5, "setRatingText:", v39);

    }
    objc_msgSend(v4, "reviewGlyph");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (v40)
    {
      v41 = [_SFPBImage alloc];
      objc_msgSend(v4, "reviewGlyph");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = -[_SFPBImage initWithFacade:](v41, "initWithFacade:", v42);
      -[_SFPBRichTitleCardSection setReviewGlyph:](v5, "setReviewGlyph:", v43);

    }
    objc_msgSend(v4, "reviewText");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v44)
    {
      objc_msgSend(v4, "reviewText");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBRichTitleCardSection setReviewText:](v5, "setReviewText:", v45);

    }
    if (objc_msgSend(v4, "hasReviewNewLine"))
      -[_SFPBRichTitleCardSection setReviewNewLine:](v5, "setReviewNewLine:", objc_msgSend(v4, "reviewNewLine"));
    objc_msgSend(v4, "moreGlyphs");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (v46)
    {
      v47 = objc_alloc_init(MEMORY[0x1E0C99DE8]);

    }
    else
    {
      v47 = 0;
    }

    v108 = 0u;
    v109 = 0u;
    v106 = 0u;
    v107 = 0u;
    objc_msgSend(v4, "moreGlyphs");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v106, v116, 16);
    if (v49)
    {
      v50 = v49;
      v51 = *(_QWORD *)v107;
      do
      {
        for (j = 0; j != v50; ++j)
        {
          if (*(_QWORD *)v107 != v51)
            objc_enumerationMutation(v48);
          v53 = -[_SFPBImage initWithFacade:]([_SFPBImage alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v106 + 1) + 8 * j));
          if (v53)
            objc_msgSend(v47, "addObject:", v53);

        }
        v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v106, v116, 16);
      }
      while (v50);
    }

    -[_SFPBRichTitleCardSection setMoreGlyphs:](v5, "setMoreGlyphs:", v47);
    objc_msgSend(v4, "auxiliaryTopText");
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    if (v54)
    {
      objc_msgSend(v4, "auxiliaryTopText");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBRichTitleCardSection setAuxiliaryTopText:](v5, "setAuxiliaryTopText:", v55);

    }
    objc_msgSend(v4, "auxiliaryMiddleText");
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    if (v56)
    {
      objc_msgSend(v4, "auxiliaryMiddleText");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBRichTitleCardSection setAuxiliaryMiddleText:](v5, "setAuxiliaryMiddleText:", v57);

    }
    objc_msgSend(v4, "auxiliaryBottomText");
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    if (v58)
    {
      objc_msgSend(v4, "auxiliaryBottomText");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBRichTitleCardSection setAuxiliaryBottomText:](v5, "setAuxiliaryBottomText:", v59);

    }
    if (objc_msgSend(v4, "hasAuxiliaryBottomTextColor"))
      -[_SFPBRichTitleCardSection setAuxiliaryBottomTextColor:](v5, "setAuxiliaryBottomTextColor:", objc_msgSend(v4, "auxiliaryBottomTextColor"));
    objc_msgSend(v4, "auxiliaryAlignment");
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    if (v60)
    {
      objc_msgSend(v4, "auxiliaryAlignment");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBRichTitleCardSection setAuxiliaryAlignment:](v5, "setAuxiliaryAlignment:", objc_msgSend(v61, "intValue"));

    }
    if (objc_msgSend(v4, "hasHideVerticalDivider"))
      -[_SFPBRichTitleCardSection setHideVerticalDivider:](v5, "setHideVerticalDivider:", objc_msgSend(v4, "hideVerticalDivider"));
    if (objc_msgSend(v4, "hasTitleAlign"))
      -[_SFPBRichTitleCardSection setTitleAlign:](v5, "setTitleAlign:", objc_msgSend(v4, "titleAlign"));
    objc_msgSend(v4, "titleWeight");
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    if (v62)
    {
      objc_msgSend(v4, "titleWeight");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBRichTitleCardSection setTitleWeight:](v5, "setTitleWeight:", objc_msgSend(v63, "intValue"));

    }
    if (objc_msgSend(v4, "hasTitleNoWrap"))
      -[_SFPBRichTitleCardSection setTitleNoWrap:](v5, "setTitleNoWrap:", objc_msgSend(v4, "titleNoWrap"));
    if (objc_msgSend(v4, "hasThumbnailCropCircle"))
      -[_SFPBRichTitleCardSection setThumbnailCropCircle:](v5, "setThumbnailCropCircle:", objc_msgSend(v4, "thumbnailCropCircle"));
    objc_msgSend(v4, "imageOverlay");
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    if (v64)
    {
      v65 = [_SFPBImage alloc];
      objc_msgSend(v4, "imageOverlay");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = -[_SFPBImage initWithFacade:](v65, "initWithFacade:", v66);
      -[_SFPBRichTitleCardSection setImageOverlay:](v5, "setImageOverlay:", v67);

    }
    objc_msgSend(v4, "playAction");
    v68 = (void *)objc_claimAutoreleasedReturnValue();

    if (v68)
    {
      v69 = [_SFPBActionItem alloc];
      objc_msgSend(v4, "playAction");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = -[_SFPBActionItem initWithFacade:](v69, "initWithFacade:", v70);
      -[_SFPBRichTitleCardSection setPlayAction:](v5, "setPlayAction:", v71);

    }
    if (objc_msgSend(v4, "hasPlayActionAlign"))
      -[_SFPBRichTitleCardSection setPlayActionAlign:](v5, "setPlayActionAlign:", objc_msgSend(v4, "playActionAlign"));
    objc_msgSend(v4, "offers");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    if (v72)
    {
      v73 = objc_alloc_init(MEMORY[0x1E0C99DE8]);

    }
    else
    {
      v73 = 0;
    }

    v104 = 0u;
    v105 = 0u;
    v102 = 0u;
    v103 = 0u;
    v97 = v4;
    objc_msgSend(v4, "offers");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v102, v115, 16);
    if (v75)
    {
      v76 = v75;
      v77 = *(_QWORD *)v103;
      do
      {
        for (k = 0; k != v76; ++k)
        {
          if (*(_QWORD *)v103 != v77)
            objc_enumerationMutation(v74);
          v79 = -[_SFPBMediaOffer initWithFacade:]([_SFPBMediaOffer alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v102 + 1) + 8 * k));
          if (v79)
            objc_msgSend(v73, "addObject:", v79);

        }
        v76 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v102, v115, 16);
      }
      while (v76);
    }

    -[_SFPBRichTitleCardSection setOffers:](v5, "setOffers:", v73);
    objc_msgSend(v4, "footnote");
    v80 = (void *)objc_claimAutoreleasedReturnValue();

    if (v80)
    {
      objc_msgSend(v4, "footnote");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBRichTitleCardSection setFootnote:](v5, "setFootnote:", v81);

    }
    objc_msgSend(v4, "richSubtitle");
    v82 = (void *)objc_claimAutoreleasedReturnValue();

    if (v82)
    {
      v83 = [_SFPBRichText alloc];
      objc_msgSend(v4, "richSubtitle");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = -[_SFPBRichText initWithFacade:](v83, "initWithFacade:", v84);
      -[_SFPBRichTitleCardSection setRichSubtitle:](v5, "setRichSubtitle:", v85);

    }
    if (objc_msgSend(v4, "hasSubtitleIsEmphasized"))
      -[_SFPBRichTitleCardSection setSubtitleIsEmphasized:](v5, "setSubtitleIsEmphasized:", objc_msgSend(v4, "subtitleIsEmphasized"));
    objc_msgSend(v4, "buttonItems");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = v5;
    if (v86)
    {
      v87 = objc_alloc_init(MEMORY[0x1E0C99DE8]);

    }
    else
    {
      v87 = 0;
    }

    v100 = 0u;
    v101 = 0u;
    v98 = 0u;
    v99 = 0u;
    objc_msgSend(v4, "buttonItems");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v98, v114, 16);
    if (v89)
    {
      v90 = v89;
      v91 = *(_QWORD *)v99;
      do
      {
        for (m = 0; m != v90; ++m)
        {
          if (*(_QWORD *)v99 != v91)
            objc_enumerationMutation(v88);
          v93 = -[_SFPBButtonItem initWithFacade:]([_SFPBButtonItem alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v98 + 1) + 8 * m));
          if (v93)
            objc_msgSend(v87, "addObject:", v93);

        }
        v90 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v98, v114, 16);
      }
      while (v90);
    }

    v5 = v96;
    -[_SFPBRichTitleCardSection setButtonItems:](v96, "setButtonItems:", v87);
    v94 = v96;

    v4 = v97;
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

- (void)setContentAdvisory:(id)a3
{
  NSString *v4;
  NSString *contentAdvisory;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  contentAdvisory = self->_contentAdvisory;
  self->_contentAdvisory = v4;

}

- (void)setTitleImage:(id)a3
{
  objc_storeStrong((id *)&self->_titleImage, a3);
}

- (void)setIsCentered:(BOOL)a3
{
  self->_isCentered = a3;
}

- (void)setDescriptionText:(id)a3
{
  NSString *v4;
  NSString *descriptionText;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  descriptionText = self->_descriptionText;
  self->_descriptionText = v4;

}

- (void)setRating:(float)a3
{
  self->_rating = a3;
}

- (void)setRatingText:(id)a3
{
  NSString *v4;
  NSString *ratingText;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  ratingText = self->_ratingText;
  self->_ratingText = v4;

}

- (void)setReviewGlyph:(id)a3
{
  objc_storeStrong((id *)&self->_reviewGlyph, a3);
}

- (void)setReviewText:(id)a3
{
  NSString *v4;
  NSString *reviewText;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  reviewText = self->_reviewText;
  self->_reviewText = v4;

}

- (void)setReviewNewLine:(BOOL)a3
{
  self->_reviewNewLine = a3;
}

- (void)setMoreGlyphs:(id)a3
{
  NSArray *v4;
  NSArray *moreGlyphs;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  moreGlyphs = self->_moreGlyphs;
  self->_moreGlyphs = v4;

}

- (void)clearMoreGlyphs
{
  -[NSArray removeAllObjects](self->_moreGlyphs, "removeAllObjects");
}

- (void)addMoreGlyphs:(id)a3
{
  id v4;
  NSArray *moreGlyphs;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  moreGlyphs = self->_moreGlyphs;
  v8 = v4;
  if (!moreGlyphs)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_moreGlyphs;
    self->_moreGlyphs = v6;

    v4 = v8;
    moreGlyphs = self->_moreGlyphs;
  }
  -[NSArray addObject:](moreGlyphs, "addObject:", v4);

}

- (unint64_t)moreGlyphsCount
{
  return -[NSArray count](self->_moreGlyphs, "count");
}

- (id)moreGlyphsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_moreGlyphs, "objectAtIndexedSubscript:", a3);
}

- (void)setAuxiliaryTopText:(id)a3
{
  NSString *v4;
  NSString *auxiliaryTopText;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  auxiliaryTopText = self->_auxiliaryTopText;
  self->_auxiliaryTopText = v4;

}

- (void)setAuxiliaryMiddleText:(id)a3
{
  NSString *v4;
  NSString *auxiliaryMiddleText;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  auxiliaryMiddleText = self->_auxiliaryMiddleText;
  self->_auxiliaryMiddleText = v4;

}

- (void)setAuxiliaryBottomText:(id)a3
{
  NSString *v4;
  NSString *auxiliaryBottomText;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  auxiliaryBottomText = self->_auxiliaryBottomText;
  self->_auxiliaryBottomText = v4;

}

- (void)setAuxiliaryBottomTextColor:(int)a3
{
  self->_auxiliaryBottomTextColor = a3;
}

- (void)setAuxiliaryAlignment:(int)a3
{
  self->_auxiliaryAlignment = a3;
}

- (void)setHideVerticalDivider:(BOOL)a3
{
  self->_hideVerticalDivider = a3;
}

- (void)setTitleAlign:(int)a3
{
  self->_titleAlign = a3;
}

- (void)setTitleWeight:(int)a3
{
  self->_titleWeight = a3;
}

- (void)setTitleNoWrap:(BOOL)a3
{
  self->_titleNoWrap = a3;
}

- (void)setThumbnailCropCircle:(BOOL)a3
{
  self->_thumbnailCropCircle = a3;
}

- (void)setImageOverlay:(id)a3
{
  objc_storeStrong((id *)&self->_imageOverlay, a3);
}

- (void)setPlayAction:(id)a3
{
  objc_storeStrong((id *)&self->_playAction, a3);
}

- (void)setPlayActionAlign:(int)a3
{
  self->_playActionAlign = a3;
}

- (void)setOffers:(id)a3
{
  NSArray *v4;
  NSArray *offers;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  offers = self->_offers;
  self->_offers = v4;

}

- (void)clearOffers
{
  -[NSArray removeAllObjects](self->_offers, "removeAllObjects");
}

- (void)addOffers:(id)a3
{
  id v4;
  NSArray *offers;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  offers = self->_offers;
  v8 = v4;
  if (!offers)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_offers;
    self->_offers = v6;

    v4 = v8;
    offers = self->_offers;
  }
  -[NSArray addObject:](offers, "addObject:", v4);

}

- (unint64_t)offersCount
{
  return -[NSArray count](self->_offers, "count");
}

- (id)offersAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_offers, "objectAtIndexedSubscript:", a3);
}

- (void)setFootnote:(id)a3
{
  NSString *v4;
  NSString *footnote;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  footnote = self->_footnote;
  self->_footnote = v4;

}

- (void)setRichSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_richSubtitle, a3);
}

- (void)setSubtitleIsEmphasized:(BOOL)a3
{
  self->_subtitleIsEmphasized = a3;
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

- (BOOL)readFrom:(id)a3
{
  double v3;

  return _SFPBRichTitleCardSectionReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;
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
  float v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
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
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_SFPBRichTitleCardSection punchoutOptions](self, "punchoutOptions");
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v57, v64, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v58;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v58 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v57, v64, 16);
    }
    while (v7);
  }

  -[_SFPBRichTitleCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    PBDataWriterWriteStringField();

  -[_SFPBRichTitleCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    PBDataWriterWriteStringField();

  if (-[_SFPBRichTitleCardSection canBeHidden](self, "canBeHidden"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBRichTitleCardSection hasTopPadding](self, "hasTopPadding"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBRichTitleCardSection hasBottomPadding](self, "hasBottomPadding"))
    PBDataWriterWriteBOOLField();
  -[_SFPBRichTitleCardSection type](self, "type");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    PBDataWriterWriteStringField();

  if (-[_SFPBRichTitleCardSection separatorStyle](self, "separatorStyle"))
    PBDataWriterWriteInt32Field();
  -[_SFPBRichTitleCardSection backgroundColor](self, "backgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    PBDataWriterWriteSubmessage();

  -[_SFPBRichTitleCardSection title](self, "title");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    PBDataWriterWriteStringField();

  -[_SFPBRichTitleCardSection subtitle](self, "subtitle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    PBDataWriterWriteStringField();

  -[_SFPBRichTitleCardSection contentAdvisory](self, "contentAdvisory");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    PBDataWriterWriteStringField();

  -[_SFPBRichTitleCardSection titleImage](self, "titleImage");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    PBDataWriterWriteSubmessage();

  if (-[_SFPBRichTitleCardSection isCentered](self, "isCentered"))
    PBDataWriterWriteBOOLField();
  -[_SFPBRichTitleCardSection descriptionText](self, "descriptionText");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
    PBDataWriterWriteStringField();

  -[_SFPBRichTitleCardSection rating](self, "rating");
  if (v19 != 0.0)
    PBDataWriterWriteFloatField();
  -[_SFPBRichTitleCardSection ratingText](self, "ratingText");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
    PBDataWriterWriteStringField();

  -[_SFPBRichTitleCardSection reviewGlyph](self, "reviewGlyph");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
    PBDataWriterWriteSubmessage();

  -[_SFPBRichTitleCardSection reviewText](self, "reviewText");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
    PBDataWriterWriteStringField();

  if (-[_SFPBRichTitleCardSection reviewNewLine](self, "reviewNewLine"))
    PBDataWriterWriteBOOLField();
  -[_SFPBRichTitleCardSection moreGlyphs](self, "moreGlyphs");
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v54;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v54 != v26)
          objc_enumerationMutation(v23);
        PBDataWriterWriteSubmessage();
        ++v27;
      }
      while (v25 != v27);
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
    }
    while (v25);
  }

  -[_SFPBRichTitleCardSection auxiliaryTopText](self, "auxiliaryTopText");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
    PBDataWriterWriteStringField();

  -[_SFPBRichTitleCardSection auxiliaryMiddleText](self, "auxiliaryMiddleText");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
    PBDataWriterWriteStringField();

  -[_SFPBRichTitleCardSection auxiliaryBottomText](self, "auxiliaryBottomText");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
    PBDataWriterWriteStringField();

  if (-[_SFPBRichTitleCardSection auxiliaryBottomTextColor](self, "auxiliaryBottomTextColor"))
    PBDataWriterWriteInt32Field();
  if (-[_SFPBRichTitleCardSection auxiliaryAlignment](self, "auxiliaryAlignment"))
    PBDataWriterWriteInt32Field();
  if (-[_SFPBRichTitleCardSection hideVerticalDivider](self, "hideVerticalDivider"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBRichTitleCardSection titleAlign](self, "titleAlign"))
    PBDataWriterWriteInt32Field();
  if (-[_SFPBRichTitleCardSection titleWeight](self, "titleWeight"))
    PBDataWriterWriteInt32Field();
  if (-[_SFPBRichTitleCardSection titleNoWrap](self, "titleNoWrap"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBRichTitleCardSection thumbnailCropCircle](self, "thumbnailCropCircle"))
    PBDataWriterWriteBOOLField();
  -[_SFPBRichTitleCardSection imageOverlay](self, "imageOverlay");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
    PBDataWriterWriteSubmessage();

  -[_SFPBRichTitleCardSection playAction](self, "playAction");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32)
    PBDataWriterWriteSubmessage();

  if (-[_SFPBRichTitleCardSection playActionAlign](self, "playActionAlign"))
    PBDataWriterWriteInt32Field();
  -[_SFPBRichTitleCardSection offers](self, "offers");
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v33 = (id)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v49, v62, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v50;
    do
    {
      v37 = 0;
      do
      {
        if (*(_QWORD *)v50 != v36)
          objc_enumerationMutation(v33);
        PBDataWriterWriteSubmessage();
        ++v37;
      }
      while (v35 != v37);
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v49, v62, 16);
    }
    while (v35);
  }

  -[_SFPBRichTitleCardSection footnote](self, "footnote");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (v38)
    PBDataWriterWriteStringField();

  -[_SFPBRichTitleCardSection richSubtitle](self, "richSubtitle");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (v39)
    PBDataWriterWriteSubmessage();

  if (-[_SFPBRichTitleCardSection subtitleIsEmphasized](self, "subtitleIsEmphasized"))
    PBDataWriterWriteBOOLField();
  -[_SFPBRichTitleCardSection buttonItems](self, "buttonItems");
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v40 = (id)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v45, v61, 16);
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v46;
    do
    {
      v44 = 0;
      do
      {
        if (*(_QWORD *)v46 != v43)
          objc_enumerationMutation(v40);
        PBDataWriterWriteSubmessage();
        ++v44;
      }
      while (v42 != v44);
      v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v45, v61, 16);
    }
    while (v42);
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
  int isCentered;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  int v61;
  float rating;
  float v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  int v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  int v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  int v78;
  int reviewNewLine;
  uint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  int v84;
  uint64_t v85;
  void *v86;
  void *v87;
  void *v88;
  int v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  int v94;
  uint64_t v95;
  void *v96;
  void *v97;
  void *v98;
  int v99;
  int auxiliaryBottomTextColor;
  int auxiliaryAlignment;
  int hideVerticalDivider;
  int titleAlign;
  int titleWeight;
  int titleNoWrap;
  int thumbnailCropCircle;
  uint64_t v107;
  void *v108;
  void *v109;
  void *v110;
  int v111;
  uint64_t v112;
  void *v113;
  void *v114;
  void *v115;
  int v116;
  int playActionAlign;
  uint64_t v118;
  void *v119;
  void *v120;
  void *v121;
  int v122;
  uint64_t v123;
  void *v124;
  void *v125;
  void *v126;
  int v127;
  uint64_t v128;
  void *v129;
  void *v130;
  void *v131;
  int v132;
  int subtitleIsEmphasized;
  uint64_t v134;
  void *v135;
  void *v136;
  void *v137;
  char v138;
  BOOL v139;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_133;
  -[_SFPBRichTitleCardSection punchoutOptions](self, "punchoutOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "punchoutOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_132;
  -[_SFPBRichTitleCardSection punchoutOptions](self, "punchoutOptions");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBRichTitleCardSection punchoutOptions](self, "punchoutOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "punchoutOptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_133;
  }
  else
  {

  }
  -[_SFPBRichTitleCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "punchoutPickerTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_132;
  -[_SFPBRichTitleCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBRichTitleCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "punchoutPickerTitle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_133;
  }
  else
  {

  }
  -[_SFPBRichTitleCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "punchoutPickerDismissText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_132;
  -[_SFPBRichTitleCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_SFPBRichTitleCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "punchoutPickerDismissText");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_133;
  }
  else
  {

  }
  canBeHidden = self->_canBeHidden;
  if (canBeHidden != objc_msgSend(v4, "canBeHidden"))
    goto LABEL_133;
  hasTopPadding = self->_hasTopPadding;
  if (hasTopPadding != objc_msgSend(v4, "hasTopPadding"))
    goto LABEL_133;
  hasBottomPadding = self->_hasBottomPadding;
  if (hasBottomPadding != objc_msgSend(v4, "hasBottomPadding"))
    goto LABEL_133;
  -[_SFPBRichTitleCardSection type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_132;
  -[_SFPBRichTitleCardSection type](self, "type");
  v25 = objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v26 = (void *)v25;
    -[_SFPBRichTitleCardSection type](self, "type");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "type");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v27, "isEqual:", v28);

    if (!v29)
      goto LABEL_133;
  }
  else
  {

  }
  separatorStyle = self->_separatorStyle;
  if (separatorStyle != objc_msgSend(v4, "separatorStyle"))
    goto LABEL_133;
  -[_SFPBRichTitleCardSection backgroundColor](self, "backgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_132;
  -[_SFPBRichTitleCardSection backgroundColor](self, "backgroundColor");
  v31 = objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    v32 = (void *)v31;
    -[_SFPBRichTitleCardSection backgroundColor](self, "backgroundColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "backgroundColor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v33, "isEqual:", v34);

    if (!v35)
      goto LABEL_133;
  }
  else
  {

  }
  -[_SFPBRichTitleCardSection title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_132;
  -[_SFPBRichTitleCardSection title](self, "title");
  v36 = objc_claimAutoreleasedReturnValue();
  if (v36)
  {
    v37 = (void *)v36;
    -[_SFPBRichTitleCardSection title](self, "title");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "title");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v38, "isEqual:", v39);

    if (!v40)
      goto LABEL_133;
  }
  else
  {

  }
  -[_SFPBRichTitleCardSection subtitle](self, "subtitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subtitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_132;
  -[_SFPBRichTitleCardSection subtitle](self, "subtitle");
  v41 = objc_claimAutoreleasedReturnValue();
  if (v41)
  {
    v42 = (void *)v41;
    -[_SFPBRichTitleCardSection subtitle](self, "subtitle");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subtitle");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v43, "isEqual:", v44);

    if (!v45)
      goto LABEL_133;
  }
  else
  {

  }
  -[_SFPBRichTitleCardSection contentAdvisory](self, "contentAdvisory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentAdvisory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_132;
  -[_SFPBRichTitleCardSection contentAdvisory](self, "contentAdvisory");
  v46 = objc_claimAutoreleasedReturnValue();
  if (v46)
  {
    v47 = (void *)v46;
    -[_SFPBRichTitleCardSection contentAdvisory](self, "contentAdvisory");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentAdvisory");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v48, "isEqual:", v49);

    if (!v50)
      goto LABEL_133;
  }
  else
  {

  }
  -[_SFPBRichTitleCardSection titleImage](self, "titleImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "titleImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_132;
  -[_SFPBRichTitleCardSection titleImage](self, "titleImage");
  v51 = objc_claimAutoreleasedReturnValue();
  if (v51)
  {
    v52 = (void *)v51;
    -[_SFPBRichTitleCardSection titleImage](self, "titleImage");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "titleImage");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v53, "isEqual:", v54);

    if (!v55)
      goto LABEL_133;
  }
  else
  {

  }
  isCentered = self->_isCentered;
  if (isCentered != objc_msgSend(v4, "isCentered"))
    goto LABEL_133;
  -[_SFPBRichTitleCardSection descriptionText](self, "descriptionText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "descriptionText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_132;
  -[_SFPBRichTitleCardSection descriptionText](self, "descriptionText");
  v57 = objc_claimAutoreleasedReturnValue();
  if (v57)
  {
    v58 = (void *)v57;
    -[_SFPBRichTitleCardSection descriptionText](self, "descriptionText");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "descriptionText");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(v59, "isEqual:", v60);

    if (!v61)
      goto LABEL_133;
  }
  else
  {

  }
  rating = self->_rating;
  objc_msgSend(v4, "rating");
  if (rating != v63)
    goto LABEL_133;
  -[_SFPBRichTitleCardSection ratingText](self, "ratingText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ratingText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_132;
  -[_SFPBRichTitleCardSection ratingText](self, "ratingText");
  v64 = objc_claimAutoreleasedReturnValue();
  if (v64)
  {
    v65 = (void *)v64;
    -[_SFPBRichTitleCardSection ratingText](self, "ratingText");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ratingText");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = objc_msgSend(v66, "isEqual:", v67);

    if (!v68)
      goto LABEL_133;
  }
  else
  {

  }
  -[_SFPBRichTitleCardSection reviewGlyph](self, "reviewGlyph");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reviewGlyph");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_132;
  -[_SFPBRichTitleCardSection reviewGlyph](self, "reviewGlyph");
  v69 = objc_claimAutoreleasedReturnValue();
  if (v69)
  {
    v70 = (void *)v69;
    -[_SFPBRichTitleCardSection reviewGlyph](self, "reviewGlyph");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reviewGlyph");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = objc_msgSend(v71, "isEqual:", v72);

    if (!v73)
      goto LABEL_133;
  }
  else
  {

  }
  -[_SFPBRichTitleCardSection reviewText](self, "reviewText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reviewText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_132;
  -[_SFPBRichTitleCardSection reviewText](self, "reviewText");
  v74 = objc_claimAutoreleasedReturnValue();
  if (v74)
  {
    v75 = (void *)v74;
    -[_SFPBRichTitleCardSection reviewText](self, "reviewText");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reviewText");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = objc_msgSend(v76, "isEqual:", v77);

    if (!v78)
      goto LABEL_133;
  }
  else
  {

  }
  reviewNewLine = self->_reviewNewLine;
  if (reviewNewLine != objc_msgSend(v4, "reviewNewLine"))
    goto LABEL_133;
  -[_SFPBRichTitleCardSection moreGlyphs](self, "moreGlyphs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "moreGlyphs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_132;
  -[_SFPBRichTitleCardSection moreGlyphs](self, "moreGlyphs");
  v80 = objc_claimAutoreleasedReturnValue();
  if (v80)
  {
    v81 = (void *)v80;
    -[_SFPBRichTitleCardSection moreGlyphs](self, "moreGlyphs");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "moreGlyphs");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = objc_msgSend(v82, "isEqual:", v83);

    if (!v84)
      goto LABEL_133;
  }
  else
  {

  }
  -[_SFPBRichTitleCardSection auxiliaryTopText](self, "auxiliaryTopText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "auxiliaryTopText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_132;
  -[_SFPBRichTitleCardSection auxiliaryTopText](self, "auxiliaryTopText");
  v85 = objc_claimAutoreleasedReturnValue();
  if (v85)
  {
    v86 = (void *)v85;
    -[_SFPBRichTitleCardSection auxiliaryTopText](self, "auxiliaryTopText");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "auxiliaryTopText");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = objc_msgSend(v87, "isEqual:", v88);

    if (!v89)
      goto LABEL_133;
  }
  else
  {

  }
  -[_SFPBRichTitleCardSection auxiliaryMiddleText](self, "auxiliaryMiddleText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "auxiliaryMiddleText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_132;
  -[_SFPBRichTitleCardSection auxiliaryMiddleText](self, "auxiliaryMiddleText");
  v90 = objc_claimAutoreleasedReturnValue();
  if (v90)
  {
    v91 = (void *)v90;
    -[_SFPBRichTitleCardSection auxiliaryMiddleText](self, "auxiliaryMiddleText");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "auxiliaryMiddleText");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = objc_msgSend(v92, "isEqual:", v93);

    if (!v94)
      goto LABEL_133;
  }
  else
  {

  }
  -[_SFPBRichTitleCardSection auxiliaryBottomText](self, "auxiliaryBottomText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "auxiliaryBottomText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_132;
  -[_SFPBRichTitleCardSection auxiliaryBottomText](self, "auxiliaryBottomText");
  v95 = objc_claimAutoreleasedReturnValue();
  if (v95)
  {
    v96 = (void *)v95;
    -[_SFPBRichTitleCardSection auxiliaryBottomText](self, "auxiliaryBottomText");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "auxiliaryBottomText");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v99 = objc_msgSend(v97, "isEqual:", v98);

    if (!v99)
      goto LABEL_133;
  }
  else
  {

  }
  auxiliaryBottomTextColor = self->_auxiliaryBottomTextColor;
  if (auxiliaryBottomTextColor != objc_msgSend(v4, "auxiliaryBottomTextColor"))
    goto LABEL_133;
  auxiliaryAlignment = self->_auxiliaryAlignment;
  if (auxiliaryAlignment != objc_msgSend(v4, "auxiliaryAlignment"))
    goto LABEL_133;
  hideVerticalDivider = self->_hideVerticalDivider;
  if (hideVerticalDivider != objc_msgSend(v4, "hideVerticalDivider"))
    goto LABEL_133;
  titleAlign = self->_titleAlign;
  if (titleAlign != objc_msgSend(v4, "titleAlign"))
    goto LABEL_133;
  titleWeight = self->_titleWeight;
  if (titleWeight != objc_msgSend(v4, "titleWeight"))
    goto LABEL_133;
  titleNoWrap = self->_titleNoWrap;
  if (titleNoWrap != objc_msgSend(v4, "titleNoWrap"))
    goto LABEL_133;
  thumbnailCropCircle = self->_thumbnailCropCircle;
  if (thumbnailCropCircle != objc_msgSend(v4, "thumbnailCropCircle"))
    goto LABEL_133;
  -[_SFPBRichTitleCardSection imageOverlay](self, "imageOverlay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageOverlay");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_132;
  -[_SFPBRichTitleCardSection imageOverlay](self, "imageOverlay");
  v107 = objc_claimAutoreleasedReturnValue();
  if (v107)
  {
    v108 = (void *)v107;
    -[_SFPBRichTitleCardSection imageOverlay](self, "imageOverlay");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageOverlay");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    v111 = objc_msgSend(v109, "isEqual:", v110);

    if (!v111)
      goto LABEL_133;
  }
  else
  {

  }
  -[_SFPBRichTitleCardSection playAction](self, "playAction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "playAction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_132;
  -[_SFPBRichTitleCardSection playAction](self, "playAction");
  v112 = objc_claimAutoreleasedReturnValue();
  if (v112)
  {
    v113 = (void *)v112;
    -[_SFPBRichTitleCardSection playAction](self, "playAction");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "playAction");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    v116 = objc_msgSend(v114, "isEqual:", v115);

    if (!v116)
      goto LABEL_133;
  }
  else
  {

  }
  playActionAlign = self->_playActionAlign;
  if (playActionAlign != objc_msgSend(v4, "playActionAlign"))
    goto LABEL_133;
  -[_SFPBRichTitleCardSection offers](self, "offers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "offers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_132;
  -[_SFPBRichTitleCardSection offers](self, "offers");
  v118 = objc_claimAutoreleasedReturnValue();
  if (v118)
  {
    v119 = (void *)v118;
    -[_SFPBRichTitleCardSection offers](self, "offers");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "offers");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    v122 = objc_msgSend(v120, "isEqual:", v121);

    if (!v122)
      goto LABEL_133;
  }
  else
  {

  }
  -[_SFPBRichTitleCardSection footnote](self, "footnote");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "footnote");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_132;
  -[_SFPBRichTitleCardSection footnote](self, "footnote");
  v123 = objc_claimAutoreleasedReturnValue();
  if (v123)
  {
    v124 = (void *)v123;
    -[_SFPBRichTitleCardSection footnote](self, "footnote");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "footnote");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    v127 = objc_msgSend(v125, "isEqual:", v126);

    if (!v127)
      goto LABEL_133;
  }
  else
  {

  }
  -[_SFPBRichTitleCardSection richSubtitle](self, "richSubtitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "richSubtitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_132;
  -[_SFPBRichTitleCardSection richSubtitle](self, "richSubtitle");
  v128 = objc_claimAutoreleasedReturnValue();
  if (v128)
  {
    v129 = (void *)v128;
    -[_SFPBRichTitleCardSection richSubtitle](self, "richSubtitle");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "richSubtitle");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    v132 = objc_msgSend(v130, "isEqual:", v131);

    if (!v132)
      goto LABEL_133;
  }
  else
  {

  }
  subtitleIsEmphasized = self->_subtitleIsEmphasized;
  if (subtitleIsEmphasized != objc_msgSend(v4, "subtitleIsEmphasized"))
    goto LABEL_133;
  -[_SFPBRichTitleCardSection buttonItems](self, "buttonItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "buttonItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_132:

    goto LABEL_133;
  }
  -[_SFPBRichTitleCardSection buttonItems](self, "buttonItems");
  v134 = objc_claimAutoreleasedReturnValue();
  if (!v134)
  {

LABEL_136:
    v139 = 1;
    goto LABEL_134;
  }
  v135 = (void *)v134;
  -[_SFPBRichTitleCardSection buttonItems](self, "buttonItems");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "buttonItems");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  v138 = objc_msgSend(v136, "isEqual:", v137);

  if ((v138 & 1) != 0)
    goto LABEL_136;
LABEL_133:
  v139 = 0;
LABEL_134:

  return v139;
}

- (unint64_t)hash
{
  _BOOL4 canBeHidden;
  _BOOL4 hasTopPadding;
  _BOOL4 hasBottomPadding;
  uint64_t separatorStyle;
  _BOOL4 isCentered;
  float rating;
  BOOL v9;
  double v10;
  double v11;
  long double v12;
  double v13;
  double v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSUInteger v22;
  uint64_t v23;
  NSUInteger v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSUInteger v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSUInteger v41;
  NSUInteger v42;
  NSUInteger v43;
  uint64_t v44;
  uint64_t v45;
  NSUInteger v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  NSUInteger v52;
  uint64_t v53;
  unint64_t v54;
  NSUInteger v55;
  unint64_t v56;
  NSUInteger v57;
  NSUInteger v58;
  NSUInteger v59;
  unint64_t v60;
  NSUInteger v61;
  NSUInteger v62;
  NSUInteger v63;
  uint64_t v64;

  v64 = -[NSArray hash](self->_punchoutOptions, "hash");
  v63 = -[NSString hash](self->_punchoutPickerTitle, "hash");
  v62 = -[NSString hash](self->_punchoutPickerDismissText, "hash");
  canBeHidden = self->_canBeHidden;
  hasTopPadding = self->_hasTopPadding;
  hasBottomPadding = self->_hasBottomPadding;
  v61 = -[NSString hash](self->_type, "hash");
  separatorStyle = self->_separatorStyle;
  v60 = -[_SFPBColor hash](self->_backgroundColor, "hash");
  v58 = -[NSString hash](self->_title, "hash");
  v59 = -[NSString hash](self->_subtitle, "hash");
  v57 = -[NSString hash](self->_contentAdvisory, "hash");
  v56 = -[_SFPBImage hash](self->_titleImage, "hash");
  isCentered = self->_isCentered;
  v55 = -[NSString hash](self->_descriptionText, "hash");
  rating = self->_rating;
  v9 = rating < 0.0;
  if (rating == 0.0)
  {
    v54 = 0;
  }
  else
  {
    v10 = rating;
    v11 = -v10;
    if (!v9)
      v11 = v10;
    v12 = floor(v11 + 0.5);
    v13 = (v11 - v12) * 1.84467441e19;
    v14 = fmod(v12, 1.84467441e19);
    v15 = 2654435761u * (unint64_t)v14;
    v16 = v15 + (unint64_t)v13;
    if (v13 <= 0.0)
      v16 = 2654435761u * (unint64_t)v14;
    v17 = v15 - (unint64_t)fabs(v13);
    if (v13 >= 0.0)
      v17 = v16;
    v54 = v17;
  }
  if (isCentered)
    v18 = 2654435761;
  else
    v18 = 0;
  v53 = v18;
  if (hasBottomPadding)
    v19 = 2654435761;
  else
    v19 = 0;
  v50 = v19;
  v51 = 2654435761 * separatorStyle;
  if (hasTopPadding)
    v20 = 2654435761;
  else
    v20 = 0;
  if (canBeHidden)
    v21 = 2654435761;
  else
    v21 = 0;
  v47 = v21;
  v48 = v20;
  v52 = -[NSString hash](self->_ratingText, "hash");
  v49 = -[_SFPBImage hash](self->_reviewGlyph, "hash");
  v22 = -[NSString hash](self->_reviewText, "hash");
  if (self->_reviewNewLine)
    v23 = 2654435761;
  else
    v23 = 0;
  v45 = v23;
  v46 = v22;
  v44 = -[NSArray hash](self->_moreGlyphs, "hash");
  v43 = -[NSString hash](self->_auxiliaryTopText, "hash");
  v42 = -[NSString hash](self->_auxiliaryMiddleText, "hash");
  v24 = -[NSString hash](self->_auxiliaryBottomText, "hash");
  v40 = 2654435761 * self->_auxiliaryBottomTextColor;
  v41 = v24;
  if (self->_hideVerticalDivider)
    v25 = 2654435761;
  else
    v25 = 0;
  v38 = v25;
  v39 = 2654435761 * self->_auxiliaryAlignment;
  v37 = 2654435761 * self->_titleAlign;
  v26 = 2654435761 * self->_titleWeight;
  if (self->_titleNoWrap)
    v27 = 2654435761;
  else
    v27 = 0;
  if (self->_thumbnailCropCircle)
    v28 = 2654435761;
  else
    v28 = 0;
  v29 = -[_SFPBImage hash](self->_imageOverlay, "hash");
  v30 = -[_SFPBActionItem hash](self->_playAction, "hash");
  v31 = 2654435761 * self->_playActionAlign;
  v32 = -[NSArray hash](self->_offers, "hash");
  v33 = -[NSString hash](self->_footnote, "hash");
  v34 = -[_SFPBRichText hash](self->_richSubtitle, "hash");
  if (self->_subtitleIsEmphasized)
    v35 = 2654435761;
  else
    v35 = 0;
  return v63 ^ v64 ^ v62 ^ v47 ^ v48 ^ v50 ^ v61 ^ v51 ^ v60 ^ v58 ^ v59 ^ v57 ^ v56 ^ v53 ^ v55 ^ v54 ^ v52 ^ v49 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v26 ^ v27 ^ v28 ^ v29 ^ v30 ^ v31 ^ v32 ^ v33 ^ v34 ^ v35 ^ -[NSArray hash](self->_buttonItems, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
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
  NSArray *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t j;
  void *v45;
  void *v46;
  void *v47;
  NSArray *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t k;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  NSArray *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t m;
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
  uint64_t v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  uint64_t v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  id v102;
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
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  _BYTE v120[128];
  _BYTE v121[128];
  _BYTE v122[128];
  _BYTE v123[128];
  uint64_t v124;

  v124 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0x1E0CB3000uLL;
  if (self->_auxiliaryAlignment)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_SFPBRichTitleCardSection auxiliaryAlignment](self, "auxiliaryAlignment"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("auxiliaryAlignment"));

  }
  if (self->_auxiliaryBottomText)
  {
    -[_SFPBRichTitleCardSection auxiliaryBottomText](self, "auxiliaryBottomText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("auxiliaryBottomText"));

  }
  if (self->_auxiliaryBottomTextColor)
  {
    v8 = -[_SFPBRichTitleCardSection auxiliaryBottomTextColor](self, "auxiliaryBottomTextColor");
    if (v8 >= 8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = *(&off_1E40420A0 + v8);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("auxiliaryBottomTextColor"));

  }
  if (self->_auxiliaryMiddleText)
  {
    -[_SFPBRichTitleCardSection auxiliaryMiddleText](self, "auxiliaryMiddleText");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("auxiliaryMiddleText"));

  }
  if (self->_auxiliaryTopText)
  {
    -[_SFPBRichTitleCardSection auxiliaryTopText](self, "auxiliaryTopText");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("auxiliaryTopText"));

  }
  if (self->_backgroundColor)
  {
    -[_SFPBRichTitleCardSection backgroundColor](self, "backgroundColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("backgroundColor"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("backgroundColor"));

    }
  }
  if (-[NSArray count](self->_buttonItems, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v116 = 0u;
    v117 = 0u;
    v118 = 0u;
    v119 = 0u;
    v18 = self->_buttonItems;
    v19 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v116, v123, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v117;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v117 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(*(id *)(*((_QWORD *)&v116 + 1) + 8 * i), "dictionaryRepresentation");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23)
          {
            objc_msgSend(v17, "addObject:", v23);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "addObject:", v24);

          }
        }
        v20 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v116, v123, 16);
      }
      while (v20);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("buttonItems"));
    v4 = 0x1E0CB3000uLL;
  }
  if (self->_canBeHidden)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBRichTitleCardSection canBeHidden](self, "canBeHidden"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("canBeHidden"));

  }
  if (self->_contentAdvisory)
  {
    -[_SFPBRichTitleCardSection contentAdvisory](self, "contentAdvisory");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v26, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("contentAdvisory"));

  }
  if (self->_descriptionText)
  {
    -[_SFPBRichTitleCardSection descriptionText](self, "descriptionText");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v28, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("descriptionText"));

  }
  if (self->_footnote)
  {
    -[_SFPBRichTitleCardSection footnote](self, "footnote");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(v30, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("footnote"));

  }
  if (self->_hasBottomPadding)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBRichTitleCardSection hasBottomPadding](self, "hasBottomPadding"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("hasBottomPadding"));

  }
  if (self->_hasTopPadding)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBRichTitleCardSection hasTopPadding](self, "hasTopPadding"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("hasTopPadding"));

  }
  if (self->_hideVerticalDivider)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBRichTitleCardSection hideVerticalDivider](self, "hideVerticalDivider"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("hideVerticalDivider"));

  }
  if (self->_imageOverlay)
  {
    -[_SFPBRichTitleCardSection imageOverlay](self, "imageOverlay");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "dictionaryRepresentation");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (v36)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("imageOverlay"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR("imageOverlay"));

    }
  }
  if (self->_isCentered)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBRichTitleCardSection isCentered](self, "isCentered"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, CFSTR("isCentered"));

  }
  if (-[NSArray count](self->_moreGlyphs, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v112 = 0u;
    v113 = 0u;
    v114 = 0u;
    v115 = 0u;
    v40 = self->_moreGlyphs;
    v41 = -[NSArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v112, v122, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v113;
      do
      {
        for (j = 0; j != v42; ++j)
        {
          if (*(_QWORD *)v113 != v43)
            objc_enumerationMutation(v40);
          objc_msgSend(*(id *)(*((_QWORD *)&v112 + 1) + 8 * j), "dictionaryRepresentation");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          if (v45)
          {
            objc_msgSend(v39, "addObject:", v45);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "addObject:", v46);

          }
        }
        v42 = -[NSArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v112, v122, 16);
      }
      while (v42);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, CFSTR("moreGlyphs"));
    v4 = 0x1E0CB3000;
  }
  if (-[NSArray count](self->_offers, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v108 = 0u;
    v109 = 0u;
    v110 = 0u;
    v111 = 0u;
    v48 = self->_offers;
    v49 = -[NSArray countByEnumeratingWithState:objects:count:](v48, "countByEnumeratingWithState:objects:count:", &v108, v121, 16);
    if (v49)
    {
      v50 = v49;
      v51 = *(_QWORD *)v109;
      do
      {
        for (k = 0; k != v50; ++k)
        {
          if (*(_QWORD *)v109 != v51)
            objc_enumerationMutation(v48);
          objc_msgSend(*(id *)(*((_QWORD *)&v108 + 1) + 8 * k), "dictionaryRepresentation");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          if (v53)
          {
            objc_msgSend(v47, "addObject:", v53);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "addObject:", v54);

          }
        }
        v50 = -[NSArray countByEnumeratingWithState:objects:count:](v48, "countByEnumeratingWithState:objects:count:", &v108, v121, 16);
      }
      while (v50);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v47, CFSTR("offers"));
    v4 = 0x1E0CB3000;
  }
  if (self->_playAction)
  {
    -[_SFPBRichTitleCardSection playAction](self, "playAction");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "dictionaryRepresentation");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    if (v56)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v56, CFSTR("playAction"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v57, CFSTR("playAction"));

    }
  }
  if (self->_playActionAlign)
  {
    v58 = -[_SFPBRichTitleCardSection playActionAlign](self, "playActionAlign");
    if (v58 >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v58);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v59 = *(&off_1E40421B0 + v58);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v59, CFSTR("playActionAlign"));

  }
  if (-[NSArray count](self->_punchoutOptions, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = 0u;
    v105 = 0u;
    v106 = 0u;
    v107 = 0u;
    v61 = self->_punchoutOptions;
    v62 = -[NSArray countByEnumeratingWithState:objects:count:](v61, "countByEnumeratingWithState:objects:count:", &v104, v120, 16);
    if (v62)
    {
      v63 = v62;
      v64 = *(_QWORD *)v105;
      do
      {
        for (m = 0; m != v63; ++m)
        {
          if (*(_QWORD *)v105 != v64)
            objc_enumerationMutation(v61);
          objc_msgSend(*(id *)(*((_QWORD *)&v104 + 1) + 8 * m), "dictionaryRepresentation");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          if (v66)
          {
            objc_msgSend(v60, "addObject:", v66);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "addObject:", v67);

          }
        }
        v63 = -[NSArray countByEnumeratingWithState:objects:count:](v61, "countByEnumeratingWithState:objects:count:", &v104, v120, 16);
      }
      while (v63);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v60, CFSTR("punchoutOptions"));
    v4 = 0x1E0CB3000uLL;
  }
  if (self->_punchoutPickerDismissText)
  {
    -[_SFPBRichTitleCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = (void *)objc_msgSend(v68, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v69, CFSTR("punchoutPickerDismissText"));

  }
  if (self->_punchoutPickerTitle)
  {
    -[_SFPBRichTitleCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = (void *)objc_msgSend(v70, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v71, CFSTR("punchoutPickerTitle"));

  }
  if (self->_rating != 0.0)
  {
    v72 = *(void **)(v4 + 2024);
    -[_SFPBRichTitleCardSection rating](self, "rating");
    objc_msgSend(v72, "numberWithFloat:");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v73, CFSTR("rating"));

  }
  if (self->_ratingText)
  {
    -[_SFPBRichTitleCardSection ratingText](self, "ratingText");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = (void *)objc_msgSend(v74, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v75, CFSTR("ratingText"));

  }
  if (self->_reviewGlyph)
  {
    -[_SFPBRichTitleCardSection reviewGlyph](self, "reviewGlyph");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "dictionaryRepresentation");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    if (v77)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v77, CFSTR("reviewGlyph"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v78, CFSTR("reviewGlyph"));

    }
  }
  if (self->_reviewNewLine)
  {
    objc_msgSend(*(id *)(v4 + 2024), "numberWithBool:", -[_SFPBRichTitleCardSection reviewNewLine](self, "reviewNewLine"));
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v79, CFSTR("reviewNewLine"));

  }
  if (self->_reviewText)
  {
    -[_SFPBRichTitleCardSection reviewText](self, "reviewText");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = (void *)objc_msgSend(v80, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v81, CFSTR("reviewText"));

  }
  if (self->_richSubtitle)
  {
    -[_SFPBRichTitleCardSection richSubtitle](self, "richSubtitle");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "dictionaryRepresentation");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    if (v83)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v83, CFSTR("richSubtitle"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v84, CFSTR("richSubtitle"));

    }
  }
  if (self->_separatorStyle)
  {
    v85 = -[_SFPBRichTitleCardSection separatorStyle](self, "separatorStyle");
    if (v85 >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v85);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v86 = *(&off_1E40421B0 + v85);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v86, CFSTR("separatorStyle"));

  }
  if (self->_subtitle)
  {
    -[_SFPBRichTitleCardSection subtitle](self, "subtitle");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = (void *)objc_msgSend(v87, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v88, CFSTR("subtitle"));

  }
  if (self->_subtitleIsEmphasized)
  {
    objc_msgSend(*(id *)(v4 + 2024), "numberWithBool:", -[_SFPBRichTitleCardSection subtitleIsEmphasized](self, "subtitleIsEmphasized"));
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v89, CFSTR("subtitleIsEmphasized"));

  }
  if (self->_thumbnailCropCircle)
  {
    objc_msgSend(*(id *)(v4 + 2024), "numberWithBool:", -[_SFPBRichTitleCardSection thumbnailCropCircle](self, "thumbnailCropCircle"));
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v90, CFSTR("thumbnailCropCircle"));

  }
  if (self->_title)
  {
    -[_SFPBRichTitleCardSection title](self, "title");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = (void *)objc_msgSend(v91, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v92, CFSTR("title"));

  }
  if (self->_titleAlign)
  {
    v93 = -[_SFPBRichTitleCardSection titleAlign](self, "titleAlign");
    if (v93 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v93);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v94 = *(&off_1E4042178 + v93);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v94, CFSTR("titleAlign"));

  }
  if (self->_titleImage)
  {
    -[_SFPBRichTitleCardSection titleImage](self, "titleImage");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "dictionaryRepresentation");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    if (v96)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v96, CFSTR("titleImage"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v97, CFSTR("titleImage"));

    }
  }
  if (self->_titleNoWrap)
  {
    objc_msgSend(*(id *)(v4 + 2024), "numberWithBool:", -[_SFPBRichTitleCardSection titleNoWrap](self, "titleNoWrap"));
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v98, CFSTR("titleNoWrap"));

  }
  if (self->_titleWeight)
  {
    objc_msgSend(*(id *)(v4 + 2024), "numberWithInt:", -[_SFPBRichTitleCardSection titleWeight](self, "titleWeight"));
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v99, CFSTR("titleWeight"));

  }
  if (self->_type)
  {
    -[_SFPBRichTitleCardSection type](self, "type");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = (void *)objc_msgSend(v100, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v101, CFSTR("type"));

  }
  v102 = v3;

  return v102;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBRichTitleCardSection dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBRichTitleCardSection)initWithJSON:(id)a3
{
  void *v4;
  _SFPBRichTitleCardSection *v5;
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
    self = -[_SFPBRichTitleCardSection initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBRichTitleCardSection)initWithDictionary:(id)a3
{
  id v4;
  _SFPBRichTitleCardSection *v5;
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
  uint64_t v32;
  _SFPBImage *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  _SFPBImage *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t j;
  uint64_t v51;
  _SFPBImage *v52;
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
  uint64_t v66;
  _SFPBImage *v67;
  void *v68;
  _SFPBActionItem *v69;
  void *v70;
  void *v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t k;
  uint64_t v77;
  _SFPBMediaOffer *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  _SFPBRichText *v83;
  void *v84;
  void *v85;
  id v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t m;
  uint64_t v91;
  _SFPBButtonItem *v92;
  _SFPBRichTitleCardSection *v93;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  objc_super v149;
  _BYTE v150[128];
  _BYTE v151[128];
  _BYTE v152[128];
  _BYTE v153[128];
  uint64_t v154;

  v154 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v149.receiver = self;
  v149.super_class = (Class)_SFPBRichTitleCardSection;
  v5 = -[_SFPBRichTitleCardSection init](&v149, sel_init);

  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("punchoutOptions"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v132 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v147 = 0u;
      v148 = 0u;
      v145 = 0u;
      v146 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v145, v153, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v146;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v146 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v145 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v13 = -[_SFPBPunchout initWithDictionary:]([_SFPBPunchout alloc], "initWithDictionary:", v12);
              -[_SFPBRichTitleCardSection addPunchoutOptions:](v5, "addPunchoutOptions:", v13);

            }
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v145, v153, 16);
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
      -[_SFPBRichTitleCardSection setPunchoutPickerTitle:](v5, "setPunchoutPickerTitle:", v15);

    }
    v101 = v14;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("punchoutPickerDismissText"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = (void *)objc_msgSend(v16, "copy");
      -[_SFPBRichTitleCardSection setPunchoutPickerDismissText:](v5, "setPunchoutPickerDismissText:", v17);

    }
    v100 = v16;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("canBeHidden"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v131 = v18;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBRichTitleCardSection setCanBeHidden:](v5, "setCanBeHidden:", objc_msgSend(v18, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasTopPadding"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v130 = v19;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBRichTitleCardSection setHasTopPadding:](v5, "setHasTopPadding:", objc_msgSend(v19, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasBottomPadding"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v129 = v20;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBRichTitleCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", objc_msgSend(v20, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v128 = v21;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = (void *)objc_msgSend(v21, "copy");
      -[_SFPBRichTitleCardSection setType:](v5, "setType:", v22);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("separatorStyle"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v127 = v23;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBRichTitleCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", objc_msgSend(v23, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("backgroundColor"));
    v24 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v126 = (void *)v24;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = -[_SFPBColor initWithDictionary:]([_SFPBColor alloc], "initWithDictionary:", v24);
      -[_SFPBRichTitleCardSection setBackgroundColor:](v5, "setBackgroundColor:", v25);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("title"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v125 = v26;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = (void *)objc_msgSend(v26, "copy");
      -[_SFPBRichTitleCardSection setTitle:](v5, "setTitle:", v27);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("subtitle"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v124 = v28;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v29 = (void *)objc_msgSend(v28, "copy");
      -[_SFPBRichTitleCardSection setSubtitle:](v5, "setSubtitle:", v29);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contentAdvisory"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v123 = v30;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v31 = (void *)objc_msgSend(v30, "copy");
      -[_SFPBRichTitleCardSection setContentAdvisory:](v5, "setContentAdvisory:", v31);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("titleImage"));
    v32 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v122 = (void *)v32;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v33 = -[_SFPBImage initWithDictionary:]([_SFPBImage alloc], "initWithDictionary:", v32);
      -[_SFPBRichTitleCardSection setTitleImage:](v5, "setTitleImage:", v33);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isCentered"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v121 = v34;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBRichTitleCardSection setIsCentered:](v5, "setIsCentered:", objc_msgSend(v34, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("descriptionText"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v120 = v35;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v36 = (void *)objc_msgSend(v35, "copy");
      -[_SFPBRichTitleCardSection setDescriptionText:](v5, "setDescriptionText:", v36);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rating"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v119 = v37;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v37, "floatValue");
      -[_SFPBRichTitleCardSection setRating:](v5, "setRating:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ratingText"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v118 = v38;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v39 = (void *)objc_msgSend(v38, "copy");
      -[_SFPBRichTitleCardSection setRatingText:](v5, "setRatingText:", v39);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("reviewGlyph"));
    v40 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v117 = (void *)v40;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v41 = -[_SFPBImage initWithDictionary:]([_SFPBImage alloc], "initWithDictionary:", v40);
      -[_SFPBRichTitleCardSection setReviewGlyph:](v5, "setReviewGlyph:", v41);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("reviewText"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v116 = v42;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v43 = (void *)objc_msgSend(v42, "copy");
      -[_SFPBRichTitleCardSection setReviewText:](v5, "setReviewText:", v43);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("reviewNewLine"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v115 = v44;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBRichTitleCardSection setReviewNewLine:](v5, "setReviewNewLine:", objc_msgSend(v44, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("moreGlyphs"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v114 = v45;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v143 = 0u;
      v144 = 0u;
      v141 = 0u;
      v142 = 0u;
      v46 = v45;
      v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v141, v152, 16);
      if (v47)
      {
        v48 = v47;
        v49 = *(_QWORD *)v142;
        do
        {
          for (j = 0; j != v48; ++j)
          {
            if (*(_QWORD *)v142 != v49)
              objc_enumerationMutation(v46);
            v51 = *(_QWORD *)(*((_QWORD *)&v141 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v52 = -[_SFPBImage initWithDictionary:]([_SFPBImage alloc], "initWithDictionary:", v51);
              -[_SFPBRichTitleCardSection addMoreGlyphs:](v5, "addMoreGlyphs:", v52);

            }
          }
          v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v141, v152, 16);
        }
        while (v48);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("auxiliaryTopText"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v54 = (void *)objc_msgSend(v53, "copy");
      -[_SFPBRichTitleCardSection setAuxiliaryTopText:](v5, "setAuxiliaryTopText:", v54);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("auxiliaryMiddleText"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v113 = v55;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v56 = (void *)objc_msgSend(v55, "copy");
      -[_SFPBRichTitleCardSection setAuxiliaryMiddleText:](v5, "setAuxiliaryMiddleText:", v56);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("auxiliaryBottomText"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v112 = v57;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v58 = (void *)objc_msgSend(v57, "copy");
      -[_SFPBRichTitleCardSection setAuxiliaryBottomText:](v5, "setAuxiliaryBottomText:", v58);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("auxiliaryBottomTextColor"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v111 = v59;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBRichTitleCardSection setAuxiliaryBottomTextColor:](v5, "setAuxiliaryBottomTextColor:", objc_msgSend(v59, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("auxiliaryAlignment"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v110 = v60;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBRichTitleCardSection setAuxiliaryAlignment:](v5, "setAuxiliaryAlignment:", objc_msgSend(v60, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hideVerticalDivider"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v109 = v61;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBRichTitleCardSection setHideVerticalDivider:](v5, "setHideVerticalDivider:", objc_msgSend(v61, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("titleAlign"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v108 = v62;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBRichTitleCardSection setTitleAlign:](v5, "setTitleAlign:", objc_msgSend(v62, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("titleWeight"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v107 = v63;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBRichTitleCardSection setTitleWeight:](v5, "setTitleWeight:", objc_msgSend(v63, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("titleNoWrap"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v106 = v64;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBRichTitleCardSection setTitleNoWrap:](v5, "setTitleNoWrap:", objc_msgSend(v64, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("thumbnailCropCircle"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v105 = v65;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBRichTitleCardSection setThumbnailCropCircle:](v5, "setThumbnailCropCircle:", objc_msgSend(v65, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("imageOverlay"));
    v66 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v104 = (void *)v66;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v67 = -[_SFPBImage initWithDictionary:]([_SFPBImage alloc], "initWithDictionary:", v66);
      -[_SFPBRichTitleCardSection setImageOverlay:](v5, "setImageOverlay:", v67);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("playAction"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v69 = -[_SFPBActionItem initWithDictionary:]([_SFPBActionItem alloc], "initWithDictionary:", v68);
      -[_SFPBRichTitleCardSection setPlayAction:](v5, "setPlayAction:", v69);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("playActionAlign"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v103 = v70;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBRichTitleCardSection setPlayActionAlign:](v5, "setPlayActionAlign:", objc_msgSend(v70, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("offers"));
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v102 = v71;
    v98 = v68;
    v99 = v53;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v139 = 0u;
      v140 = 0u;
      v137 = 0u;
      v138 = 0u;
      v72 = v71;
      v73 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v137, v151, 16);
      if (v73)
      {
        v74 = v73;
        v75 = *(_QWORD *)v138;
        do
        {
          for (k = 0; k != v74; ++k)
          {
            if (*(_QWORD *)v138 != v75)
              objc_enumerationMutation(v72);
            v77 = *(_QWORD *)(*((_QWORD *)&v137 + 1) + 8 * k);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v78 = -[_SFPBMediaOffer initWithDictionary:]([_SFPBMediaOffer alloc], "initWithDictionary:", v77);
              -[_SFPBRichTitleCardSection addOffers:](v5, "addOffers:", v78);

            }
          }
          v74 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v137, v151, 16);
        }
        while (v74);
      }

      v68 = v98;
      v53 = v99;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("footnote"));
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v80 = (void *)objc_msgSend(v79, "copy");
      -[_SFPBRichTitleCardSection setFootnote:](v5, "setFootnote:", v80);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("richSubtitle"));
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v82 = v81;
      v83 = -[_SFPBRichText initWithDictionary:]([_SFPBRichText alloc], "initWithDictionary:", v81);
      -[_SFPBRichTitleCardSection setRichSubtitle:](v5, "setRichSubtitle:", v83);

      v81 = v82;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("subtitleIsEmphasized"));
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBRichTitleCardSection setSubtitleIsEmphasized:](v5, "setSubtitleIsEmphasized:", objc_msgSend(v84, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("buttonItems"));
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v95 = v84;
      v96 = v81;
      v97 = v79;
      v135 = 0u;
      v136 = 0u;
      v133 = 0u;
      v134 = 0u;
      v86 = v85;
      v87 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v133, v150, 16);
      if (v87)
      {
        v88 = v87;
        v89 = *(_QWORD *)v134;
        do
        {
          for (m = 0; m != v88; ++m)
          {
            if (*(_QWORD *)v134 != v89)
              objc_enumerationMutation(v86);
            v91 = *(_QWORD *)(*((_QWORD *)&v133 + 1) + 8 * m);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v92 = -[_SFPBButtonItem initWithDictionary:]([_SFPBButtonItem alloc], "initWithDictionary:", v91);
              -[_SFPBRichTitleCardSection addButtonItems:](v5, "addButtonItems:", v92);

            }
          }
          v88 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v133, v150, 16);
        }
        while (v88);
      }

      v68 = v98;
      v53 = v99;
      v81 = v96;
      v79 = v97;
      v84 = v95;
    }
    v93 = v5;

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

- (NSString)contentAdvisory
{
  return self->_contentAdvisory;
}

- (_SFPBImage)titleImage
{
  return self->_titleImage;
}

- (BOOL)isCentered
{
  return self->_isCentered;
}

- (NSString)descriptionText
{
  return self->_descriptionText;
}

- (float)rating
{
  return self->_rating;
}

- (NSString)ratingText
{
  return self->_ratingText;
}

- (_SFPBImage)reviewGlyph
{
  return self->_reviewGlyph;
}

- (NSString)reviewText
{
  return self->_reviewText;
}

- (BOOL)reviewNewLine
{
  return self->_reviewNewLine;
}

- (NSArray)moreGlyphs
{
  return self->_moreGlyphs;
}

- (NSString)auxiliaryTopText
{
  return self->_auxiliaryTopText;
}

- (NSString)auxiliaryMiddleText
{
  return self->_auxiliaryMiddleText;
}

- (NSString)auxiliaryBottomText
{
  return self->_auxiliaryBottomText;
}

- (int)auxiliaryBottomTextColor
{
  return self->_auxiliaryBottomTextColor;
}

- (int)auxiliaryAlignment
{
  return self->_auxiliaryAlignment;
}

- (BOOL)hideVerticalDivider
{
  return self->_hideVerticalDivider;
}

- (int)titleAlign
{
  return self->_titleAlign;
}

- (int)titleWeight
{
  return self->_titleWeight;
}

- (BOOL)titleNoWrap
{
  return self->_titleNoWrap;
}

- (BOOL)thumbnailCropCircle
{
  return self->_thumbnailCropCircle;
}

- (_SFPBImage)imageOverlay
{
  return self->_imageOverlay;
}

- (_SFPBActionItem)playAction
{
  return self->_playAction;
}

- (int)playActionAlign
{
  return self->_playActionAlign;
}

- (NSArray)offers
{
  return self->_offers;
}

- (NSString)footnote
{
  return self->_footnote;
}

- (_SFPBRichText)richSubtitle
{
  return self->_richSubtitle;
}

- (BOOL)subtitleIsEmphasized
{
  return self->_subtitleIsEmphasized;
}

- (NSArray)buttonItems
{
  return self->_buttonItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonItems, 0);
  objc_storeStrong((id *)&self->_richSubtitle, 0);
  objc_storeStrong((id *)&self->_footnote, 0);
  objc_storeStrong((id *)&self->_offers, 0);
  objc_storeStrong((id *)&self->_playAction, 0);
  objc_storeStrong((id *)&self->_imageOverlay, 0);
  objc_storeStrong((id *)&self->_auxiliaryBottomText, 0);
  objc_storeStrong((id *)&self->_auxiliaryMiddleText, 0);
  objc_storeStrong((id *)&self->_auxiliaryTopText, 0);
  objc_storeStrong((id *)&self->_moreGlyphs, 0);
  objc_storeStrong((id *)&self->_reviewText, 0);
  objc_storeStrong((id *)&self->_reviewGlyph, 0);
  objc_storeStrong((id *)&self->_ratingText, 0);
  objc_storeStrong((id *)&self->_descriptionText, 0);
  objc_storeStrong((id *)&self->_titleImage, 0);
  objc_storeStrong((id *)&self->_contentAdvisory, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_punchoutPickerDismissText, 0);
  objc_storeStrong((id *)&self->_punchoutPickerTitle, 0);
  objc_storeStrong((id *)&self->_punchoutOptions, 0);
}

@end
