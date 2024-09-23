@implementation SFRichTitleCardSection

- (SFRichTitleCardSection)initWithProtobuf:(id)a3
{
  id v4;
  SFRichTitleCardSection *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  SFPunchout *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  SFColor *v21;
  void *v22;
  SFColor *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  SFImage *v31;
  void *v32;
  SFImage *v33;
  void *v34;
  void *v35;
  float v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  SFImage *v42;
  void *v43;
  SFImage *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t j;
  SFImage *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  SFImage *v64;
  void *v65;
  SFImage *v66;
  void *v67;
  SFActionItem *v68;
  void *v69;
  SFActionItem *v70;
  void *v71;
  id v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t k;
  SFMediaOffer *v78;
  void *v79;
  void *v80;
  void *v81;
  SFRichText *v82;
  void *v83;
  SFRichText *v84;
  void *v85;
  id v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t m;
  SFButtonItem *v92;
  SFRichTitleCardSection *v93;
  id v95;
  SFRichTitleCardSection *v96;
  __int128 v97;
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
  objc_super v113;
  _BYTE v114[128];
  _BYTE v115[128];
  _BYTE v116[128];
  _BYTE v117[128];
  uint64_t v118;

  v118 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v113.receiver = self;
  v113.super_class = (Class)SFRichTitleCardSection;
  v5 = -[SFCardSection init](&v113, sel_init);

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

    v111 = 0u;
    v112 = 0u;
    v109 = 0u;
    v110 = 0u;
    objc_msgSend(v4, "punchoutOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v109, v117, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v110;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v110 != v11)
            objc_enumerationMutation(v8);
          v13 = -[SFPunchout initWithProtobuf:]([SFPunchout alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v109 + 1) + 8 * i));
          if (v13)
            objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v109, v117, 16);
      }
      while (v10);
    }

    -[SFCardSection setPunchoutOptions:](v5, "setPunchoutOptions:", v7);
    objc_msgSend(v4, "punchoutPickerTitle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v4, "punchoutPickerTitle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCardSection setPunchoutPickerTitle:](v5, "setPunchoutPickerTitle:", v15);

    }
    objc_msgSend(v4, "punchoutPickerDismissText");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v4, "punchoutPickerDismissText");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCardSection setPunchoutPickerDismissText:](v5, "setPunchoutPickerDismissText:", v17);

    }
    if (objc_msgSend(v4, "canBeHidden"))
      -[SFCardSection setCanBeHidden:](v5, "setCanBeHidden:", objc_msgSend(v4, "canBeHidden"));
    if (objc_msgSend(v4, "hasTopPadding"))
      -[SFCardSection setHasTopPadding:](v5, "setHasTopPadding:", objc_msgSend(v4, "hasTopPadding"));
    if (objc_msgSend(v4, "hasBottomPadding"))
      -[SFCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", objc_msgSend(v4, "hasBottomPadding"));
    objc_msgSend(v4, "type");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v4, "type");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFTitleCardSection setType:](v5, "setType:", v19);

    }
    if (objc_msgSend(v4, "separatorStyle"))
      -[SFCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", objc_msgSend(v4, "separatorStyle"));
    objc_msgSend(v4, "backgroundColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v21 = [SFColor alloc];
      objc_msgSend(v4, "backgroundColor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[SFColor initWithProtobuf:](v21, "initWithProtobuf:", v22);
      -[SFCardSection setBackgroundColor:](v5, "setBackgroundColor:", v23);

    }
    objc_msgSend(v4, "title");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v4, "title");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFTitleCardSection setTitle:](v5, "setTitle:", v25);

    }
    objc_msgSend(v4, "subtitle");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      objc_msgSend(v4, "subtitle");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFTitleCardSection setSubtitle:](v5, "setSubtitle:", v27);

    }
    objc_msgSend(v4, "contentAdvisory");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend(v4, "contentAdvisory");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFRichTitleCardSection setContentAdvisory:](v5, "setContentAdvisory:", v29);

    }
    objc_msgSend(v4, "titleImage");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      v31 = [SFImage alloc];
      objc_msgSend(v4, "titleImage");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = -[SFImage initWithProtobuf:](v31, "initWithProtobuf:", v32);
      -[SFRichTitleCardSection setTitleImage:](v5, "setTitleImage:", v33);

    }
    if (objc_msgSend(v4, "isCentered"))
      -[SFTitleCardSection setIsCentered:](v5, "setIsCentered:", objc_msgSend(v4, "isCentered"));
    objc_msgSend(v4, "descriptionText");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      objc_msgSend(v4, "descriptionText");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFRichTitleCardSection setDescriptionText:](v5, "setDescriptionText:", v35);

    }
    objc_msgSend(v4, "rating");
    if (v36 != 0.0)
    {
      v37 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v4, "rating");
      objc_msgSend(v37, "numberWithFloat:");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFRichTitleCardSection setRating:](v5, "setRating:", v38);

    }
    objc_msgSend(v4, "ratingText");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (v39)
    {
      objc_msgSend(v4, "ratingText");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFRichTitleCardSection setRatingText:](v5, "setRatingText:", v40);

    }
    objc_msgSend(v4, "reviewGlyph");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (v41)
    {
      v42 = [SFImage alloc];
      objc_msgSend(v4, "reviewGlyph");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = -[SFImage initWithProtobuf:](v42, "initWithProtobuf:", v43);
      -[SFRichTitleCardSection setReviewGlyph:](v5, "setReviewGlyph:", v44);

    }
    objc_msgSend(v4, "reviewText");
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    if (v45)
    {
      objc_msgSend(v4, "reviewText");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFRichTitleCardSection setReviewText:](v5, "setReviewText:", v46);

    }
    if (objc_msgSend(v4, "reviewNewLine"))
      -[SFRichTitleCardSection setReviewNewLine:](v5, "setReviewNewLine:", objc_msgSend(v4, "reviewNewLine"));
    objc_msgSend(v4, "moreGlyphs");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = v5;
    if (v47)
    {
      v48 = objc_alloc_init(MEMORY[0x1E0C99DE8]);

    }
    else
    {
      v48 = 0;
    }

    v107 = 0u;
    v108 = 0u;
    v105 = 0u;
    v106 = 0u;
    objc_msgSend(v4, "moreGlyphs");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v105, v116, 16);
    if (v50)
    {
      v51 = v50;
      v52 = *(_QWORD *)v106;
      do
      {
        for (j = 0; j != v51; ++j)
        {
          if (*(_QWORD *)v106 != v52)
            objc_enumerationMutation(v49);
          v54 = -[SFImage initWithProtobuf:]([SFImage alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v105 + 1) + 8 * j));
          if (v54)
            objc_msgSend(v48, "addObject:", v54);

        }
        v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v105, v116, 16);
      }
      while (v51);
    }

    -[SFRichTitleCardSection setMoreGlyphs:](v96, "setMoreGlyphs:", v48);
    objc_msgSend(v4, "auxiliaryTopText");
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    if (v55)
    {
      objc_msgSend(v4, "auxiliaryTopText");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFRichTitleCardSection setAuxiliaryTopText:](v96, "setAuxiliaryTopText:", v56);

    }
    objc_msgSend(v4, "auxiliaryMiddleText");
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    if (v57)
    {
      objc_msgSend(v4, "auxiliaryMiddleText");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFRichTitleCardSection setAuxiliaryMiddleText:](v96, "setAuxiliaryMiddleText:", v58);

    }
    objc_msgSend(v4, "auxiliaryBottomText");
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    if (v59)
    {
      objc_msgSend(v4, "auxiliaryBottomText");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFRichTitleCardSection setAuxiliaryBottomText:](v96, "setAuxiliaryBottomText:", v60);

    }
    if (objc_msgSend(v4, "auxiliaryBottomTextColor"))
      -[SFRichTitleCardSection setAuxiliaryBottomTextColor:](v96, "setAuxiliaryBottomTextColor:", objc_msgSend(v4, "auxiliaryBottomTextColor"));
    if (objc_msgSend(v4, "auxiliaryAlignment"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "auxiliaryAlignment"));
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFRichTitleCardSection setAuxiliaryAlignment:](v96, "setAuxiliaryAlignment:", v61);

    }
    if (objc_msgSend(v4, "hideVerticalDivider"))
      -[SFRichTitleCardSection setHideVerticalDivider:](v96, "setHideVerticalDivider:", objc_msgSend(v4, "hideVerticalDivider"));
    if (objc_msgSend(v4, "titleAlign"))
      -[SFRichTitleCardSection setTitleAlign:](v96, "setTitleAlign:", objc_msgSend(v4, "titleAlign"));
    if (objc_msgSend(v4, "titleWeight"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "titleWeight"));
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFRichTitleCardSection setTitleWeight:](v96, "setTitleWeight:", v62);

    }
    if (objc_msgSend(v4, "titleNoWrap"))
      -[SFRichTitleCardSection setTitleNoWrap:](v96, "setTitleNoWrap:", objc_msgSend(v4, "titleNoWrap"));
    if (objc_msgSend(v4, "thumbnailCropCircle"))
      -[SFRichTitleCardSection setThumbnailCropCircle:](v96, "setThumbnailCropCircle:", objc_msgSend(v4, "thumbnailCropCircle"));
    objc_msgSend(v4, "imageOverlay");
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    if (v63)
    {
      v64 = [SFImage alloc];
      objc_msgSend(v4, "imageOverlay");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = -[SFImage initWithProtobuf:](v64, "initWithProtobuf:", v65);
      -[SFRichTitleCardSection setImageOverlay:](v96, "setImageOverlay:", v66);

    }
    objc_msgSend(v4, "playAction");
    v67 = (void *)objc_claimAutoreleasedReturnValue();

    if (v67)
    {
      v68 = [SFActionItem alloc];
      objc_msgSend(v4, "playAction");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = -[SFActionItem initWithProtobuf:](v68, "initWithProtobuf:", v69);
      -[SFRichTitleCardSection setPlayAction:](v96, "setPlayAction:", v70);

    }
    if (objc_msgSend(v4, "playActionAlign"))
      -[SFRichTitleCardSection setPlayActionAlign:](v96, "setPlayActionAlign:", objc_msgSend(v4, "playActionAlign"));
    objc_msgSend(v4, "offers");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    if (v71)
    {
      v72 = objc_alloc_init(MEMORY[0x1E0C99DE8]);

    }
    else
    {
      v72 = 0;
    }

    v103 = 0u;
    v104 = 0u;
    v101 = 0u;
    v102 = 0u;
    objc_msgSend(v4, "offers");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v101, v115, 16);
    if (v74)
    {
      v75 = v74;
      v76 = *(_QWORD *)v102;
      do
      {
        for (k = 0; k != v75; ++k)
        {
          if (*(_QWORD *)v102 != v76)
            objc_enumerationMutation(v73);
          v78 = -[SFMediaOffer initWithProtobuf:]([SFMediaOffer alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v101 + 1) + 8 * k));
          if (v78)
            objc_msgSend(v72, "addObject:", v78);

        }
        v75 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v101, v115, 16);
      }
      while (v75);
    }

    -[SFRichTitleCardSection setOffers:](v96, "setOffers:", v72);
    objc_msgSend(v4, "footnote");
    v79 = (void *)objc_claimAutoreleasedReturnValue();

    if (v79)
    {
      objc_msgSend(v4, "footnote");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFRichTitleCardSection setFootnote:](v96, "setFootnote:", v80);

    }
    objc_msgSend(v4, "richSubtitle");
    v81 = (void *)objc_claimAutoreleasedReturnValue();

    if (v81)
    {
      v82 = [SFRichText alloc];
      objc_msgSend(v4, "richSubtitle");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = -[SFRichText initWithProtobuf:](v82, "initWithProtobuf:", v83);
      -[SFRichTitleCardSection setRichSubtitle:](v96, "setRichSubtitle:", v84);

    }
    if (objc_msgSend(v4, "subtitleIsEmphasized"))
      -[SFRichTitleCardSection setSubtitleIsEmphasized:](v96, "setSubtitleIsEmphasized:", objc_msgSend(v4, "subtitleIsEmphasized"));
    objc_msgSend(v4, "buttonItems");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    if (v85)
    {
      v86 = objc_alloc_init(MEMORY[0x1E0C99DE8]);

    }
    else
    {
      v86 = 0;
    }

    v99 = 0u;
    v100 = 0u;
    v97 = 0u;
    v98 = 0u;
    v95 = v4;
    objc_msgSend(v4, "buttonItems");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v97, v114, 16);
    if (v88)
    {
      v89 = v88;
      v90 = *(_QWORD *)v98;
      do
      {
        for (m = 0; m != v89; ++m)
        {
          if (*(_QWORD *)v98 != v90)
            objc_enumerationMutation(v87);
          v92 = -[SFButtonItem initWithProtobuf:]([SFButtonItem alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v97 + 1) + 8 * m));
          if (v92)
            objc_msgSend(v86, "addObject:", v92);

        }
        v89 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v97, v114, 16);
      }
      while (v89);
    }

    v5 = v96;
    -[SFRichTitleCardSection setButtonItems:](v96, "setButtonItems:", v86);
    v93 = v96;

    v4 = v95;
  }

  return v5;
}

- (void)setReviewNewLine:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_reviewNewLine = a3;
}

- (BOOL)hasReviewNewLine
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setAuxiliaryBottomTextColor:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_auxiliaryBottomTextColor = a3;
}

- (BOOL)hasAuxiliaryBottomTextColor
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHideVerticalDivider:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_hideVerticalDivider = a3;
}

- (BOOL)hasHideVerticalDivider
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setTitleAlign:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_titleAlign = a3;
}

- (BOOL)hasTitleAlign
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setTitleNoWrap:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_titleNoWrap = a3;
}

- (BOOL)hasTitleNoWrap
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setThumbnailCropCircle:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_thumbnailCropCircle = a3;
}

- (BOOL)hasThumbnailCropCircle
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setPlayActionAlign:(int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_playActionAlign = a3;
}

- (BOOL)hasPlayActionAlign
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setSubtitleIsEmphasized:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_subtitleIsEmphasized = a3;
}

- (BOOL)hasSubtitleIsEmphasized
{
  return *(_BYTE *)&self->_has >> 7;
}

- (SFRichTitleCardSection)initWithCoder:(id)a3
{
  id v4;
  SFRichTitleCardSection *v5;
  void *v6;
  _SFPBCardSection *v7;
  SFCardSection *v8;
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
  void *v40;
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
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;

  v4 = a3;
  v5 = -[SFCardSection init](self, "init");
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[_SFPBCardSection initWithData:]([_SFPBCardSection alloc], "initWithData:", v6);
  v8 = -[SFCardSection initWithProtobuf:]([SFCardSection alloc], "initWithProtobuf:", v7);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SFCardSection punchoutOptions](v8, "punchoutOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutOptions:](v5, "setPunchoutOptions:", v9);

    -[SFCardSection punchoutPickerTitle](v8, "punchoutPickerTitle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerTitle:](v5, "setPunchoutPickerTitle:", v10);

    -[SFCardSection punchoutPickerDismissText](v8, "punchoutPickerDismissText");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerDismissText:](v5, "setPunchoutPickerDismissText:", v11);

    -[SFCardSection setCanBeHidden:](v5, "setCanBeHidden:", -[SFCardSection canBeHidden](v8, "canBeHidden"));
    -[SFCardSection setHasTopPadding:](v5, "setHasTopPadding:", -[SFCardSection hasTopPadding](v8, "hasTopPadding"));
    -[SFCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", -[SFCardSection hasBottomPadding](v8, "hasBottomPadding"));
    -[SFCardSection type](v8, "type");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFTitleCardSection setType:](v5, "setType:", v12);

    -[SFCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", -[SFCardSection separatorStyle](v8, "separatorStyle"));
    -[SFCardSection backgroundColor](v8, "backgroundColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setBackgroundColor:](v5, "setBackgroundColor:", v13);

    -[SFCardSection title](v8, "title");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFTitleCardSection setTitle:](v5, "setTitle:", v14);

    -[SFCardSection subtitle](v8, "subtitle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFTitleCardSection setSubtitle:](v5, "setSubtitle:", v15);

    -[SFCardSection contentAdvisory](v8, "contentAdvisory");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFRichTitleCardSection setContentAdvisory:](v5, "setContentAdvisory:", v16);

    -[SFCardSection titleImage](v8, "titleImage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFRichTitleCardSection setTitleImage:](v5, "setTitleImage:", v17);

    -[SFTitleCardSection setIsCentered:](v5, "setIsCentered:", -[SFCardSection isCentered](v8, "isCentered"));
    -[SFCardSection descriptionText](v8, "descriptionText");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFRichTitleCardSection setDescriptionText:](v5, "setDescriptionText:", v18);

    -[SFCardSection rating](v8, "rating");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFRichTitleCardSection setRating:](v5, "setRating:", v19);

    -[SFCardSection ratingText](v8, "ratingText");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFRichTitleCardSection setRatingText:](v5, "setRatingText:", v20);

    -[SFCardSection reviewGlyph](v8, "reviewGlyph");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFRichTitleCardSection setReviewGlyph:](v5, "setReviewGlyph:", v21);

    -[SFCardSection reviewText](v8, "reviewText");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFRichTitleCardSection setReviewText:](v5, "setReviewText:", v22);

    -[SFRichTitleCardSection setReviewNewLine:](v5, "setReviewNewLine:", -[SFCardSection reviewNewLine](v8, "reviewNewLine"));
    -[SFCardSection moreGlyphs](v8, "moreGlyphs");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFRichTitleCardSection setMoreGlyphs:](v5, "setMoreGlyphs:", v23);

    -[SFCardSection auxiliaryTopText](v8, "auxiliaryTopText");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFRichTitleCardSection setAuxiliaryTopText:](v5, "setAuxiliaryTopText:", v24);

    -[SFCardSection auxiliaryMiddleText](v8, "auxiliaryMiddleText");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFRichTitleCardSection setAuxiliaryMiddleText:](v5, "setAuxiliaryMiddleText:", v25);

    -[SFCardSection auxiliaryBottomText](v8, "auxiliaryBottomText");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFRichTitleCardSection setAuxiliaryBottomText:](v5, "setAuxiliaryBottomText:", v26);

    -[SFRichTitleCardSection setAuxiliaryBottomTextColor:](v5, "setAuxiliaryBottomTextColor:", -[SFCardSection auxiliaryBottomTextColor](v8, "auxiliaryBottomTextColor"));
    -[SFCardSection auxiliaryAlignment](v8, "auxiliaryAlignment");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFRichTitleCardSection setAuxiliaryAlignment:](v5, "setAuxiliaryAlignment:", v27);

    -[SFRichTitleCardSection setHideVerticalDivider:](v5, "setHideVerticalDivider:", -[SFCardSection hideVerticalDivider](v8, "hideVerticalDivider"));
    -[SFRichTitleCardSection setTitleAlign:](v5, "setTitleAlign:", -[SFCardSection titleAlign](v8, "titleAlign"));
    -[SFCardSection titleWeight](v8, "titleWeight");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFRichTitleCardSection setTitleWeight:](v5, "setTitleWeight:", v28);

    -[SFRichTitleCardSection setTitleNoWrap:](v5, "setTitleNoWrap:", -[SFCardSection titleNoWrap](v8, "titleNoWrap"));
    -[SFRichTitleCardSection setThumbnailCropCircle:](v5, "setThumbnailCropCircle:", -[SFCardSection thumbnailCropCircle](v8, "thumbnailCropCircle"));
    -[SFCardSection imageOverlay](v8, "imageOverlay");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFRichTitleCardSection setImageOverlay:](v5, "setImageOverlay:", v29);

    -[SFCardSection playAction](v8, "playAction");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFRichTitleCardSection setPlayAction:](v5, "setPlayAction:", v30);

    -[SFRichTitleCardSection setPlayActionAlign:](v5, "setPlayActionAlign:", -[SFCardSection playActionAlign](v8, "playActionAlign"));
    -[SFCardSection offers](v8, "offers");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFRichTitleCardSection setOffers:](v5, "setOffers:", v31);

    -[SFCardSection footnote](v8, "footnote");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFRichTitleCardSection setFootnote:](v5, "setFootnote:", v32);

    -[SFCardSection richSubtitle](v8, "richSubtitle");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFRichTitleCardSection setRichSubtitle:](v5, "setRichSubtitle:", v33);

    -[SFRichTitleCardSection setSubtitleIsEmphasized:](v5, "setSubtitleIsEmphasized:", -[SFCardSection subtitleIsEmphasized](v8, "subtitleIsEmphasized"));
    -[SFCardSection buttonItems](v8, "buttonItems");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFRichTitleCardSection setButtonItems:](v5, "setButtonItems:", v34);

    -[SFCardSection punchoutOptions](v8, "punchoutOptions");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutOptions:](v5, "setPunchoutOptions:", v35);

    -[SFCardSection punchoutPickerTitle](v8, "punchoutPickerTitle");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerTitle:](v5, "setPunchoutPickerTitle:", v36);

    -[SFCardSection punchoutPickerDismissText](v8, "punchoutPickerDismissText");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerDismissText:](v5, "setPunchoutPickerDismissText:", v37);

    -[SFCardSection setCanBeHidden:](v5, "setCanBeHidden:", -[SFCardSection canBeHidden](v8, "canBeHidden"));
    -[SFCardSection setHasTopPadding:](v5, "setHasTopPadding:", -[SFCardSection hasTopPadding](v8, "hasTopPadding"));
    -[SFCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", -[SFCardSection hasBottomPadding](v8, "hasBottomPadding"));
    -[SFCardSection type](v8, "type");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFTitleCardSection setType:](v5, "setType:", v38);

    -[SFCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", -[SFCardSection separatorStyle](v8, "separatorStyle"));
    -[SFCardSection backgroundColor](v8, "backgroundColor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setBackgroundColor:](v5, "setBackgroundColor:", v39);

    -[SFCardSection title](v8, "title");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFTitleCardSection setTitle:](v5, "setTitle:", v40);

    -[SFCardSection subtitle](v8, "subtitle");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFTitleCardSection setSubtitle:](v5, "setSubtitle:", v41);

    -[SFTitleCardSection setIsCentered:](v5, "setIsCentered:", -[SFCardSection isCentered](v8, "isCentered"));
    -[SFCardSection nextCard](v8, "nextCard");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setNextCard:](v5, "setNextCard:", v42);

    -[SFCardSection commands](v8, "commands");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCommands:](v5, "setCommands:", v43);

    -[SFCardSection parameterKeyPaths](v8, "parameterKeyPaths");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setParameterKeyPaths:](v5, "setParameterKeyPaths:", v44);

    -[SFCardSection cardSectionId](v8, "cardSectionId");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCardSectionId:](v5, "setCardSectionId:", v45);

    -[SFCardSection resultIdentifier](v8, "resultIdentifier");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setResultIdentifier:](v5, "setResultIdentifier:", v46);

    -[SFCardSection userReportRequest](v8, "userReportRequest");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setUserReportRequest:](v5, "setUserReportRequest:", v47);

    -[SFCardSection command](v8, "command");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCommand:](v5, "setCommand:", v48);

    -[SFCardSection previewCommand](v8, "previewCommand");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewCommand:](v5, "setPreviewCommand:", v49);

    -[SFCardSection previewButtonItems](v8, "previewButtonItems");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewButtonItems:](v5, "setPreviewButtonItems:", v50);

    -[SFCardSection cardSectionDetail](v8, "cardSectionDetail");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCardSectionDetail:](v5, "setCardSectionDetail:", v51);

    -[SFCardSection previewButtonItemsTitle](v8, "previewButtonItemsTitle");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewButtonItemsTitle:](v5, "setPreviewButtonItemsTitle:", v52);

    -[SFCardSection backgroundColor](v8, "backgroundColor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setBackgroundColor:](v5, "setBackgroundColor:", v53);

    -[SFCardSection setShouldHideInAmbientMode:](v5, "setShouldHideInAmbientMode:", -[SFCardSection shouldHideInAmbientMode](v8, "shouldHideInAmbientMode"));
    -[SFCardSection leadingSwipeButtonItems](v8, "leadingSwipeButtonItems");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setLeadingSwipeButtonItems:](v5, "setLeadingSwipeButtonItems:", v54);

    -[SFCardSection trailingSwipeButtonItems](v8, "trailingSwipeButtonItems");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setTrailingSwipeButtonItems:](v5, "setTrailingSwipeButtonItems:", v55);

    -[SFCardSection punchoutOptions](v8, "punchoutOptions");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutOptions:](v5, "setPunchoutOptions:", v56);

    -[SFCardSection punchoutPickerTitle](v8, "punchoutPickerTitle");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerTitle:](v5, "setPunchoutPickerTitle:", v57);

    -[SFCardSection punchoutPickerDismissText](v8, "punchoutPickerDismissText");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerDismissText:](v5, "setPunchoutPickerDismissText:", v58);

    -[SFCardSection setCanBeHidden:](v5, "setCanBeHidden:", -[SFCardSection canBeHidden](v8, "canBeHidden"));
    -[SFCardSection setHasTopPadding:](v5, "setHasTopPadding:", -[SFCardSection hasTopPadding](v8, "hasTopPadding"));
    -[SFCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", -[SFCardSection hasBottomPadding](v8, "hasBottomPadding"));
    -[SFCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", -[SFCardSection separatorStyle](v8, "separatorStyle"));
    -[SFCardSection referencedCommands](v8, "referencedCommands");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setReferencedCommands:](v5, "setReferencedCommands:", v59);

    -[SFCardSection setForceEnable3DTouch:](v5, "setForceEnable3DTouch:", -[SFCardSection forceEnable3DTouch](v8, "forceEnable3DTouch"));
    -[SFCardSection setShouldShowInSmartDialog:](v5, "setShouldShowInSmartDialog:", -[SFCardSection shouldShowInSmartDialog](v8, "shouldShowInSmartDialog"));
    -[SFCardSection appEntityAnnotation](v8, "appEntityAnnotation");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setAppEntityAnnotation:](v5, "setAppEntityAnnotation:", v60);

    -[SFCardSection emphasisSubjectId](v8, "emphasisSubjectId");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setEmphasisSubjectId:](v5, "setEmphasisSubjectId:", v61);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFRichTitleCardSection;
  -[SFTitleCardSection encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBRichTitleCardSection *v2;
  void *v3;

  v2 = -[_SFPBRichTitleCardSection initWithFacade:]([_SFPBRichTitleCardSection alloc], "initWithFacade:", self);
  -[_SFPBRichTitleCardSection dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBRichTitleCardSection *v2;
  void *v3;

  v2 = -[_SFPBRichTitleCardSection initWithFacade:]([_SFPBRichTitleCardSection alloc], "initWithFacade:", self);
  -[_SFPBRichTitleCardSection jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
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
  void *v40;
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
  void *v54;
  void *v55;
  void *v56;
  objc_super v58;

  v58.receiver = self;
  v58.super_class = (Class)SFRichTitleCardSection;
  v4 = -[SFTitleCardSection copyWithZone:](&v58, sel_copyWithZone_, a3);
  -[SFCardSection punchoutOptions](self, "punchoutOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setPunchoutOptions:", v6);

  -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setPunchoutPickerTitle:", v8);

  -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setPunchoutPickerDismissText:", v10);

  objc_msgSend(v4, "setCanBeHidden:", -[SFCardSection canBeHidden](self, "canBeHidden"));
  objc_msgSend(v4, "setHasTopPadding:", -[SFCardSection hasTopPadding](self, "hasTopPadding"));
  objc_msgSend(v4, "setHasBottomPadding:", -[SFCardSection hasBottomPadding](self, "hasBottomPadding"));
  -[SFTitleCardSection type](self, "type");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setType:", v12);

  objc_msgSend(v4, "setSeparatorStyle:", -[SFCardSection separatorStyle](self, "separatorStyle"));
  -[SFCardSection backgroundColor](self, "backgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setBackgroundColor:", v14);

  -[SFTitleCardSection title](self, "title");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v4, "setTitle:", v16);

  -[SFTitleCardSection subtitle](self, "subtitle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");
  objc_msgSend(v4, "setSubtitle:", v18);

  -[SFRichTitleCardSection contentAdvisory](self, "contentAdvisory");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");
  objc_msgSend(v4, "setContentAdvisory:", v20);

  -[SFRichTitleCardSection titleImage](self, "titleImage");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "copy");
  objc_msgSend(v4, "setTitleImage:", v22);

  objc_msgSend(v4, "setIsCentered:", -[SFTitleCardSection isCentered](self, "isCentered"));
  -[SFRichTitleCardSection descriptionText](self, "descriptionText");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v23, "copy");
  objc_msgSend(v4, "setDescriptionText:", v24);

  -[SFRichTitleCardSection rating](self, "rating");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v25, "copy");
  objc_msgSend(v4, "setRating:", v26);

  -[SFRichTitleCardSection ratingText](self, "ratingText");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v27, "copy");
  objc_msgSend(v4, "setRatingText:", v28);

  -[SFRichTitleCardSection reviewGlyph](self, "reviewGlyph");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v29, "copy");
  objc_msgSend(v4, "setReviewGlyph:", v30);

  -[SFRichTitleCardSection reviewText](self, "reviewText");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v31, "copy");
  objc_msgSend(v4, "setReviewText:", v32);

  objc_msgSend(v4, "setReviewNewLine:", -[SFRichTitleCardSection reviewNewLine](self, "reviewNewLine"));
  -[SFRichTitleCardSection moreGlyphs](self, "moreGlyphs");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend(v33, "copy");
  objc_msgSend(v4, "setMoreGlyphs:", v34);

  -[SFRichTitleCardSection auxiliaryTopText](self, "auxiliaryTopText");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)objc_msgSend(v35, "copy");
  objc_msgSend(v4, "setAuxiliaryTopText:", v36);

  -[SFRichTitleCardSection auxiliaryMiddleText](self, "auxiliaryMiddleText");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)objc_msgSend(v37, "copy");
  objc_msgSend(v4, "setAuxiliaryMiddleText:", v38);

  -[SFRichTitleCardSection auxiliaryBottomText](self, "auxiliaryBottomText");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)objc_msgSend(v39, "copy");
  objc_msgSend(v4, "setAuxiliaryBottomText:", v40);

  objc_msgSend(v4, "setAuxiliaryBottomTextColor:", -[SFRichTitleCardSection auxiliaryBottomTextColor](self, "auxiliaryBottomTextColor"));
  -[SFRichTitleCardSection auxiliaryAlignment](self, "auxiliaryAlignment");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)objc_msgSend(v41, "copy");
  objc_msgSend(v4, "setAuxiliaryAlignment:", v42);

  objc_msgSend(v4, "setHideVerticalDivider:", -[SFRichTitleCardSection hideVerticalDivider](self, "hideVerticalDivider"));
  objc_msgSend(v4, "setTitleAlign:", -[SFRichTitleCardSection titleAlign](self, "titleAlign"));
  -[SFRichTitleCardSection titleWeight](self, "titleWeight");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (void *)objc_msgSend(v43, "copy");
  objc_msgSend(v4, "setTitleWeight:", v44);

  objc_msgSend(v4, "setTitleNoWrap:", -[SFRichTitleCardSection titleNoWrap](self, "titleNoWrap"));
  objc_msgSend(v4, "setThumbnailCropCircle:", -[SFRichTitleCardSection thumbnailCropCircle](self, "thumbnailCropCircle"));
  -[SFRichTitleCardSection imageOverlay](self, "imageOverlay");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = (void *)objc_msgSend(v45, "copy");
  objc_msgSend(v4, "setImageOverlay:", v46);

  -[SFRichTitleCardSection playAction](self, "playAction");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = (void *)objc_msgSend(v47, "copy");
  objc_msgSend(v4, "setPlayAction:", v48);

  objc_msgSend(v4, "setPlayActionAlign:", -[SFRichTitleCardSection playActionAlign](self, "playActionAlign"));
  -[SFRichTitleCardSection offers](self, "offers");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = (void *)objc_msgSend(v49, "copy");
  objc_msgSend(v4, "setOffers:", v50);

  -[SFRichTitleCardSection footnote](self, "footnote");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = (void *)objc_msgSend(v51, "copy");
  objc_msgSend(v4, "setFootnote:", v52);

  -[SFRichTitleCardSection richSubtitle](self, "richSubtitle");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = (void *)objc_msgSend(v53, "copy");
  objc_msgSend(v4, "setRichSubtitle:", v54);

  objc_msgSend(v4, "setSubtitleIsEmphasized:", -[SFRichTitleCardSection subtitleIsEmphasized](self, "subtitleIsEmphasized"));
  -[SFRichTitleCardSection buttonItems](self, "buttonItems");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = (void *)objc_msgSend(v55, "copy");
  objc_msgSend(v4, "setButtonItems:", v56);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  uint64_t v4;
  SFRichTitleCardSection *v6;
  SFRichTitleCardSection *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  int v14;
  int v15;
  int v16;
  char v17;
  uint64_t v18;
  int v19;
  int v20;
  uint64_t v22;
  uint64_t v23;
  SFRichTitleCardSection *v24;
  void *v25;
  _BOOL4 v26;
  _BOOL4 v27;
  _BOOL4 v28;
  void *v29;
  int v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  _BOOL4 v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  _BOOL4 v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  int v61;
  uint64_t v62;
  void *v63;
  _BOOL4 v64;
  int v65;
  uint64_t v66;
  void *v67;
  _BOOL4 v68;
  _BOOL4 v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  void *v73;
  int v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  void *v80;
  _BOOL4 v81;
  SFRichTitleCardSection *v82;
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
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  int v207;
  int v208;
  int v209;
  int v210;
  int v211;
  int v212;
  int v213;
  int v214;
  uint64_t v215;
  int v216;
  int v217;
  uint64_t v218;
  int v219;
  int v220;
  int v221;
  int v222;
  uint64_t v223;
  int v224;
  int v225;
  int v226;
  int v227;
  int v228;
  int v229;
  int v230;
  int v231;
  int v232;
  int v233;
  int v234;
  int v235;
  int v236;
  int v237;
  int v238;
  int v239;
  uint64_t v240;
  uint64_t v241;
  _QWORD v242[3];
  _BOOL4 v243;
  _BOOL4 v244;
  int v245;
  _BOOL4 v246;
  int v247;
  _BOOL4 v248;
  _BOOL4 v249;
  _BOOL4 v250;
  _BOOL4 v251;
  _BOOL4 v252;
  _BOOL4 v253;
  _BOOL4 v254;
  _BOOL4 v255;
  _BOOL4 v256;
  _BOOL4 v257;
  int v258;
  int v259;
  int v260;
  id v261;
  id v262;
  _BOOL4 v263;
  _BOOL4 v264;
  _BOOL4 v265;
  _BOOL4 v266;
  _BOOL4 v267;
  _BOOL4 v268;
  __int128 v269;
  objc_super v270;

  v6 = (SFRichTitleCardSection *)a3;
  if (self == v6)
  {
    v17 = 1;
    goto LABEL_171;
  }
  if (!-[SFRichTitleCardSection isMemberOfClass:](v6, "isMemberOfClass:", objc_opt_class())
    || (v270.receiver = self,
        v270.super_class = (Class)SFRichTitleCardSection,
        !-[SFTitleCardSection isEqual:](&v270, sel_isEqual_, v6)))
  {
    v17 = 0;
    goto LABEL_171;
  }
  v7 = v6;
  -[SFCardSection punchoutOptions](self, "punchoutOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8 == 0;
  -[SFCardSection punchoutOptions](v7, "punchoutOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v261 = v10;
  v262 = v8;
  v259 = v10 != 0;
  v260 = v9;
  if ((_DWORD)v9 == v259)
  {
    v258 = 0;
    v247 = 0;
    v245 = 0;
    v269 = 0uLL;
    v13 = 0;
    memset(v242, 0, sizeof(v242));
    v241 = 0;
    v268 = 0;
    v237 = 0;
    v238 = 0;
    v267 = 0;
    v232 = 0;
    v234 = 0;
    v266 = 0;
    v228 = 0;
    v227 = 0;
    v265 = 0;
    v224 = 0;
    v226 = 0;
    v264 = 0;
    v223 = 0;
    v263 = 0;
    v219 = 0;
    v221 = 0;
    v257 = 0;
    v218 = 0;
    v256 = 0;
    v211 = 0;
    v214 = 0;
    v255 = 0;
    v212 = 0;
    v217 = 0;
    v254 = 0;
    v209 = 0;
    v216 = 0;
    v253 = 0;
    v208 = 0;
    v213 = 0;
    v252 = 0;
    v207 = 0;
    v210 = 0;
    v251 = 0;
    v215 = 0;
    v250 = 0;
    v220 = 0;
    v222 = 0;
    v249 = 0;
    v225 = 0;
    v230 = 0;
    v248 = 0;
    v229 = 0;
    v231 = 0;
    v246 = 0;
    v233 = 0;
    v235 = 0;
    v244 = 0;
    v236 = 0;
    v239 = 0;
    v243 = 0;
    v240 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
  }
  else
  {
    -[SFCardSection punchoutOptions](self, "punchoutOptions");
    v11 = objc_claimAutoreleasedReturnValue();
    v4 = v11 != 0;
    v206 = (void *)v11;
    if (!v11
      || (-[SFCardSection punchoutOptions](self, "punchoutOptions"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          -[SFCardSection punchoutOptions](v7, "punchoutOptions"),
          v203 = v12,
          v202 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v12, "isEqual:")))
    {
      -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
      v205 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCardSection punchoutPickerTitle](v7, "punchoutPickerTitle");
      v204 = (void *)objc_claimAutoreleasedReturnValue();
      v258 = v4;
      if ((v205 == 0) == (v204 != 0))
      {
        v245 = 0;
        v269 = 0uLL;
        v13 = 0;
        memset(v242, 0, sizeof(v242));
        v241 = 0;
        v268 = 0;
        v237 = 0;
        v238 = 0;
        v267 = 0;
        v232 = 0;
        v234 = 0;
        v266 = 0;
        v228 = 0;
        v227 = 0;
        v265 = 0;
        v224 = 0;
        v226 = 0;
        v264 = 0;
        v223 = 0;
        v263 = 0;
        v219 = 0;
        v221 = 0;
        v257 = 0;
        v218 = 0;
        v256 = 0;
        v211 = 0;
        v214 = 0;
        v255 = 0;
        v212 = 0;
        v217 = 0;
        v254 = 0;
        v209 = 0;
        v216 = 0;
        v253 = 0;
        v208 = 0;
        v213 = 0;
        v252 = 0;
        v207 = 0;
        v210 = 0;
        v251 = 0;
        v215 = 0;
        v250 = 0;
        v220 = 0;
        v222 = 0;
        v249 = 0;
        v225 = 0;
        v230 = 0;
        v248 = 0;
        v229 = 0;
        v231 = 0;
        v246 = 0;
        v233 = 0;
        v235 = 0;
        v244 = 0;
        v236 = 0;
        v239 = 0;
        v243 = 0;
        v240 = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v17 = 0;
        v247 = 1;
      }
      else
      {
        -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
        v18 = objc_claimAutoreleasedReturnValue();
        HIDWORD(v269) = v18 != 0;
        v201 = (void *)v18;
        if (!v18
          || (-[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle"),
              v3 = (void *)objc_claimAutoreleasedReturnValue(),
              -[SFCardSection punchoutPickerTitle](v7, "punchoutPickerTitle"),
              v198 = v3,
              v197 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v3, "isEqual:")))
        {
          -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFCardSection punchoutPickerDismissText](v7, "punchoutPickerDismissText");
          v199 = (void *)objc_claimAutoreleasedReturnValue();
          v200 = v3;
          if ((v3 == 0) != (v199 != 0))
          {
            -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
            v22 = objc_claimAutoreleasedReturnValue();
            DWORD2(v269) = v22 != 0;
            v196 = (void *)v22;
            if (v22)
            {
              -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
              v23 = objc_claimAutoreleasedReturnValue();
              v24 = v7;
              v25 = (void *)v23;
              v82 = v24;
              -[SFCardSection punchoutPickerDismissText](v24, "punchoutPickerDismissText");
              v195 = v25;
              v194 = (void *)objc_claimAutoreleasedReturnValue();
              if (!objc_msgSend(v25, "isEqual:"))
              {
                v242[0] = 0;
                v242[1] = 0;
                *(_QWORD *)&v269 = 0;
                v241 = 0;
                v268 = 0;
                v237 = 0;
                v238 = 0;
                v267 = 0;
                v232 = 0;
                v234 = 0;
                v266 = 0;
                v228 = 0;
                v227 = 0;
                v265 = 0;
                v224 = 0;
                v226 = 0;
                v264 = 0;
                v223 = 0;
                v263 = 0;
                v219 = 0;
                v221 = 0;
                v257 = 0;
                v218 = 0;
                v256 = 0;
                v211 = 0;
                v214 = 0;
                v255 = 0;
                v212 = 0;
                v217 = 0;
                v254 = 0;
                v209 = 0;
                v216 = 0;
                v253 = 0;
                v208 = 0;
                v213 = 0;
                v252 = 0;
                v207 = 0;
                v210 = 0;
                v251 = 0;
                v215 = 0;
                v250 = 0;
                v220 = 0;
                v222 = 0;
                v249 = 0;
                v225 = 0;
                v230 = 0;
                v248 = 0;
                v229 = 0;
                v231 = 0;
                v246 = 0;
                v233 = 0;
                v235 = 0;
                v244 = 0;
                v236 = 0;
                v239 = 0;
                v243 = 0;
                v240 = 0;
                v14 = 0;
                v15 = 0;
                v16 = 0;
                v17 = 0;
                v247 = 1;
                v245 = 1;
                v242[2] = 1;
                v13 = 1;
                DWORD2(v269) = 1;
                v7 = v82;
                goto LABEL_16;
              }
              v7 = v82;
            }
            v26 = -[SFCardSection canBeHidden](self, "canBeHidden");
            if (v26 == -[SFCardSection canBeHidden](v7, "canBeHidden")
              && (v27 = -[SFCardSection hasTopPadding](self, "hasTopPadding"),
                  v27 == -[SFCardSection hasTopPadding](v7, "hasTopPadding"))
              && (v28 = -[SFCardSection hasBottomPadding](self, "hasBottomPadding"),
                  v28 == -[SFCardSection hasBottomPadding](v7, "hasBottomPadding")))
            {
              -[SFTitleCardSection type](self, "type");
              v193 = (void *)objc_claimAutoreleasedReturnValue();
              -[SFTitleCardSection type](v7, "type");
              v192 = (void *)objc_claimAutoreleasedReturnValue();
              if ((v193 == 0) == (v192 != 0))
              {
                *(_QWORD *)((char *)v242 + 4) = 0;
                *(_QWORD *)&v269 = 0;
                LODWORD(v242[0]) = 0;
                v241 = 0;
                v268 = 0;
                v237 = 0;
                v238 = 0;
                v267 = 0;
                v232 = 0;
                v234 = 0;
                v266 = 0;
                v228 = 0;
                v227 = 0;
                v265 = 0;
                v224 = 0;
                v226 = 0;
                v264 = 0;
                v223 = 0;
                v263 = 0;
                v219 = 0;
                v221 = 0;
                v257 = 0;
                v218 = 0;
                v256 = 0;
                v211 = 0;
                v214 = 0;
                v255 = 0;
                v212 = 0;
                v217 = 0;
                v254 = 0;
                v209 = 0;
                v216 = 0;
                v253 = 0;
                v208 = 0;
                v213 = 0;
                v252 = 0;
                v207 = 0;
                v210 = 0;
                v251 = 0;
                v215 = 0;
                v250 = 0;
                v220 = 0;
                v222 = 0;
                v249 = 0;
                v225 = 0;
                v230 = 0;
                v248 = 0;
                v229 = 0;
                v231 = 0;
                v246 = 0;
                v233 = 0;
                v235 = 0;
                v244 = 0;
                v236 = 0;
                v239 = 0;
                v243 = 0;
                v240 = 0;
                v14 = 0;
                v15 = 0;
                v16 = 0;
                v17 = 0;
                v247 = 1;
                v245 = 1;
                v242[2] = 1;
                v13 = 1;
                HIDWORD(v242[1]) = 1;
              }
              else
              {
                -[SFTitleCardSection type](self, "type");
                v191 = (void *)objc_claimAutoreleasedReturnValue();
                DWORD1(v269) = v191 != 0;
                if (!v191
                  || (-[SFTitleCardSection type](self, "type"),
                      v29 = (void *)objc_claimAutoreleasedReturnValue(),
                      -[SFTitleCardSection type](v7, "type"),
                      v190 = v29,
                      v189 = (void *)objc_claimAutoreleasedReturnValue(),
                      objc_msgSend(v29, "isEqual:")))
                {
                  v30 = -[SFCardSection separatorStyle](self, "separatorStyle");
                  if (v30 == -[SFCardSection separatorStyle](v7, "separatorStyle"))
                  {
                    -[SFCardSection backgroundColor](self, "backgroundColor");
                    v188 = (void *)objc_claimAutoreleasedReturnValue();
                    -[SFCardSection backgroundColor](v7, "backgroundColor");
                    v187 = (void *)objc_claimAutoreleasedReturnValue();
                    if ((v188 == 0) == (v187 != 0))
                    {
                      LODWORD(v269) = 0;
                      v241 = 0;
                      v268 = 0;
                      v237 = 0;
                      v238 = 0;
                      v267 = 0;
                      v232 = 0;
                      v234 = 0;
                      v266 = 0;
                      v228 = 0;
                      v227 = 0;
                      v265 = 0;
                      v224 = 0;
                      v226 = 0;
                      v264 = 0;
                      v223 = 0;
                      v263 = 0;
                      v219 = 0;
                      v221 = 0;
                      v257 = 0;
                      v218 = 0;
                      v256 = 0;
                      v211 = 0;
                      v214 = 0;
                      v255 = 0;
                      v212 = 0;
                      v217 = 0;
                      v254 = 0;
                      v209 = 0;
                      v216 = 0;
                      v253 = 0;
                      v208 = 0;
                      v213 = 0;
                      v252 = 0;
                      v207 = 0;
                      v210 = 0;
                      v251 = 0;
                      v215 = 0;
                      v250 = 0;
                      v220 = 0;
                      v222 = 0;
                      v249 = 0;
                      v225 = 0;
                      v230 = 0;
                      v248 = 0;
                      v229 = 0;
                      v231 = 0;
                      v246 = 0;
                      v233 = 0;
                      v235 = 0;
                      v244 = 0;
                      v236 = 0;
                      v239 = 0;
                      v243 = 0;
                      v240 = 0;
                      v14 = 0;
                      v15 = 0;
                      v16 = 0;
                      v17 = 0;
                      v247 = 1;
                      v245 = 1;
                      v242[2] = 1;
                      v13 = 1;
                      v242[1] = 0x100000001;
                      v242[0] = 1;
                    }
                    else
                    {
                      -[SFCardSection backgroundColor](self, "backgroundColor");
                      v31 = objc_claimAutoreleasedReturnValue();
                      LODWORD(v269) = v31 != 0;
                      v186 = (void *)v31;
                      if (!v31
                        || (-[SFCardSection backgroundColor](self, "backgroundColor"),
                            v32 = (void *)objc_claimAutoreleasedReturnValue(),
                            -[SFCardSection backgroundColor](v7, "backgroundColor"),
                            v183 = v32,
                            v182 = (void *)objc_claimAutoreleasedReturnValue(),
                            objc_msgSend(v32, "isEqual:")))
                      {
                        -[SFTitleCardSection title](self, "title");
                        v185 = (void *)objc_claimAutoreleasedReturnValue();
                        -[SFTitleCardSection title](v7, "title");
                        v184 = (void *)objc_claimAutoreleasedReturnValue();
                        if ((v185 == 0) == (v184 != 0))
                        {
                          v268 = 0;
                          v237 = 0;
                          v238 = 0;
                          v267 = 0;
                          v232 = 0;
                          v234 = 0;
                          v266 = 0;
                          v228 = 0;
                          v227 = 0;
                          v265 = 0;
                          v224 = 0;
                          v226 = 0;
                          v264 = 0;
                          v223 = 0;
                          v263 = 0;
                          v219 = 0;
                          v221 = 0;
                          v257 = 0;
                          v218 = 0;
                          v256 = 0;
                          v211 = 0;
                          v214 = 0;
                          v255 = 0;
                          v212 = 0;
                          v217 = 0;
                          v254 = 0;
                          v209 = 0;
                          v216 = 0;
                          v253 = 0;
                          v208 = 0;
                          v213 = 0;
                          v252 = 0;
                          v207 = 0;
                          v210 = 0;
                          v251 = 0;
                          v215 = 0;
                          v250 = 0;
                          v220 = 0;
                          v222 = 0;
                          v249 = 0;
                          v225 = 0;
                          v230 = 0;
                          v248 = 0;
                          v229 = 0;
                          v231 = 0;
                          v246 = 0;
                          v233 = 0;
                          v235 = 0;
                          v244 = 0;
                          v236 = 0;
                          v239 = 0;
                          v243 = 0;
                          v240 = 0;
                          v14 = 0;
                          v15 = 0;
                          v16 = 0;
                          v17 = 0;
                          v247 = 1;
                          v245 = 1;
                          HIDWORD(v242[2]) = 0;
                          v13 = 1;
                          LODWORD(v242[1]) = 1;
                          *(_QWORD *)((char *)&v242[1] + 4) = 0x100000001;
                          v242[0] = 0x100000001;
                          v241 = 1;
                        }
                        else
                        {
                          -[SFTitleCardSection title](self, "title");
                          v33 = objc_claimAutoreleasedReturnValue();
                          v268 = v33 != 0;
                          v181 = (void *)v33;
                          if (!v33
                            || (-[SFTitleCardSection title](self, "title"),
                                v34 = (void *)objc_claimAutoreleasedReturnValue(),
                                -[SFTitleCardSection title](v7, "title"),
                                v178 = v34,
                                v177 = (void *)objc_claimAutoreleasedReturnValue(),
                                objc_msgSend(v34, "isEqual:")))
                          {
                            -[SFTitleCardSection subtitle](self, "subtitle");
                            v180 = (void *)objc_claimAutoreleasedReturnValue();
                            -[SFTitleCardSection subtitle](v7, "subtitle");
                            v179 = (void *)objc_claimAutoreleasedReturnValue();
                            if ((v180 == 0) == (v179 != 0))
                            {
                              v238 = 0;
                              v267 = 0;
                              v232 = 0;
                              v234 = 0;
                              v266 = 0;
                              v228 = 0;
                              v227 = 0;
                              v265 = 0;
                              v224 = 0;
                              v226 = 0;
                              v264 = 0;
                              v223 = 0;
                              v263 = 0;
                              v219 = 0;
                              v221 = 0;
                              v257 = 0;
                              v218 = 0;
                              v256 = 0;
                              v211 = 0;
                              v214 = 0;
                              v255 = 0;
                              v212 = 0;
                              v217 = 0;
                              v254 = 0;
                              v209 = 0;
                              v216 = 0;
                              v253 = 0;
                              v208 = 0;
                              v213 = 0;
                              v252 = 0;
                              v207 = 0;
                              v210 = 0;
                              v251 = 0;
                              v215 = 0;
                              v250 = 0;
                              v220 = 0;
                              v222 = 0;
                              v249 = 0;
                              v225 = 0;
                              v230 = 0;
                              v248 = 0;
                              v229 = 0;
                              v231 = 0;
                              v246 = 0;
                              v233 = 0;
                              v235 = 0;
                              v244 = 0;
                              v236 = 0;
                              v239 = 0;
                              v243 = 0;
                              v240 = 0;
                              v14 = 0;
                              v15 = 0;
                              v16 = 0;
                              v17 = 0;
                              v247 = 1;
                              v245 = 1;
                              v242[2] = 1;
                              v13 = 1;
                              v242[1] = 0x100000001;
                              v242[0] = 0x100000001;
                              v241 = 0x100000001;
                              v237 = 1;
                            }
                            else
                            {
                              -[SFTitleCardSection subtitle](self, "subtitle");
                              v35 = objc_claimAutoreleasedReturnValue();
                              v267 = v35 != 0;
                              v176 = (void *)v35;
                              if (!v35
                                || (-[SFTitleCardSection subtitle](self, "subtitle"),
                                    v36 = (void *)objc_claimAutoreleasedReturnValue(),
                                    -[SFTitleCardSection subtitle](v7, "subtitle"),
                                    v173 = v36,
                                    v172 = (void *)objc_claimAutoreleasedReturnValue(),
                                    objc_msgSend(v36, "isEqual:")))
                              {
                                -[SFRichTitleCardSection contentAdvisory](self, "contentAdvisory");
                                v175 = (void *)objc_claimAutoreleasedReturnValue();
                                -[SFRichTitleCardSection contentAdvisory](v7, "contentAdvisory");
                                v174 = (void *)objc_claimAutoreleasedReturnValue();
                                if ((v175 == 0) == (v174 != 0))
                                {
                                  v234 = 0;
                                  v266 = 0;
                                  v228 = 0;
                                  v227 = 0;
                                  v265 = 0;
                                  v224 = 0;
                                  v226 = 0;
                                  v264 = 0;
                                  v223 = 0;
                                  v263 = 0;
                                  v219 = 0;
                                  v221 = 0;
                                  v257 = 0;
                                  v218 = 0;
                                  v256 = 0;
                                  v211 = 0;
                                  v214 = 0;
                                  v255 = 0;
                                  v212 = 0;
                                  v217 = 0;
                                  v254 = 0;
                                  v209 = 0;
                                  v216 = 0;
                                  v253 = 0;
                                  v208 = 0;
                                  v213 = 0;
                                  v252 = 0;
                                  v207 = 0;
                                  v210 = 0;
                                  v251 = 0;
                                  v215 = 0;
                                  v250 = 0;
                                  v220 = 0;
                                  v222 = 0;
                                  v249 = 0;
                                  v225 = 0;
                                  v230 = 0;
                                  v248 = 0;
                                  v229 = 0;
                                  v231 = 0;
                                  v246 = 0;
                                  v233 = 0;
                                  v235 = 0;
                                  v244 = 0;
                                  v236 = 0;
                                  v239 = 0;
                                  v243 = 0;
                                  v240 = 0;
                                  v14 = 0;
                                  v15 = 0;
                                  v16 = 0;
                                  v17 = 0;
                                  v247 = 1;
                                  v245 = 1;
                                  v242[2] = 1;
                                  v13 = 1;
                                  v242[1] = 0x100000001;
                                  v242[0] = 0x100000001;
                                  v241 = 0x100000001;
                                  v237 = 1;
                                  v238 = 1;
                                  v232 = 1;
                                }
                                else
                                {
                                  -[SFRichTitleCardSection contentAdvisory](self, "contentAdvisory");
                                  v37 = objc_claimAutoreleasedReturnValue();
                                  v266 = v37 != 0;
                                  v171 = (void *)v37;
                                  if (!v37
                                    || (-[SFRichTitleCardSection contentAdvisory](self, "contentAdvisory"),
                                        v38 = (void *)objc_claimAutoreleasedReturnValue(),
                                        -[SFRichTitleCardSection contentAdvisory](v7, "contentAdvisory"),
                                        v168 = v38,
                                        v167 = (void *)objc_claimAutoreleasedReturnValue(),
                                        objc_msgSend(v38, "isEqual:")))
                                  {
                                    -[SFRichTitleCardSection titleImage](self, "titleImage");
                                    v170 = (void *)objc_claimAutoreleasedReturnValue();
                                    -[SFRichTitleCardSection titleImage](v7, "titleImage");
                                    v169 = (void *)objc_claimAutoreleasedReturnValue();
                                    if ((v170 == 0) == (v169 != 0))
                                    {
                                      v227 = 0;
                                      v265 = 0;
                                      v224 = 0;
                                      v226 = 0;
                                      v264 = 0;
                                      v223 = 0;
                                      v263 = 0;
                                      v219 = 0;
                                      v221 = 0;
                                      v257 = 0;
                                      v218 = 0;
                                      v256 = 0;
                                      v211 = 0;
                                      v214 = 0;
                                      v255 = 0;
                                      v212 = 0;
                                      v217 = 0;
                                      v254 = 0;
                                      v209 = 0;
                                      v216 = 0;
                                      v253 = 0;
                                      v208 = 0;
                                      v213 = 0;
                                      v252 = 0;
                                      v207 = 0;
                                      v210 = 0;
                                      v251 = 0;
                                      v215 = 0;
                                      v250 = 0;
                                      v220 = 0;
                                      v222 = 0;
                                      v249 = 0;
                                      v225 = 0;
                                      v230 = 0;
                                      v248 = 0;
                                      v229 = 0;
                                      v231 = 0;
                                      v246 = 0;
                                      v233 = 0;
                                      v235 = 0;
                                      v244 = 0;
                                      v236 = 0;
                                      v239 = 0;
                                      v243 = 0;
                                      v240 = 0;
                                      v14 = 0;
                                      v15 = 0;
                                      v16 = 0;
                                      v17 = 0;
                                      v247 = 1;
                                      v245 = 1;
                                      v242[2] = 1;
                                      v13 = 1;
                                      v242[1] = 0x100000001;
                                      v242[0] = 0x100000001;
                                      v241 = 0x100000001;
                                      v237 = 1;
                                      v238 = 1;
                                      v232 = 1;
                                      v234 = 1;
                                      v228 = 1;
                                    }
                                    else
                                    {
                                      -[SFRichTitleCardSection titleImage](self, "titleImage");
                                      v39 = objc_claimAutoreleasedReturnValue();
                                      v265 = v39 != 0;
                                      v166 = (void *)v39;
                                      if (!v39
                                        || (-[SFRichTitleCardSection titleImage](self, "titleImage"),
                                            v40 = (void *)objc_claimAutoreleasedReturnValue(),
                                            -[SFRichTitleCardSection titleImage](v7, "titleImage"),
                                            v165 = v40,
                                            v164 = (void *)objc_claimAutoreleasedReturnValue(),
                                            objc_msgSend(v40, "isEqual:")))
                                      {
                                        v41 = -[SFTitleCardSection isCentered](self, "isCentered");
                                        if (v41 == -[SFTitleCardSection isCentered](v7, "isCentered"))
                                        {
                                          -[SFRichTitleCardSection descriptionText](self, "descriptionText");
                                          v163 = (void *)objc_claimAutoreleasedReturnValue();
                                          -[SFRichTitleCardSection descriptionText](v7, "descriptionText");
                                          v162 = (void *)objc_claimAutoreleasedReturnValue();
                                          if ((v163 == 0) == (v162 != 0))
                                          {
                                            v226 = 0;
                                            v264 = 0;
                                            v223 = 0;
                                            v263 = 0;
                                            v219 = 0;
                                            v221 = 0;
                                            v257 = 0;
                                            v218 = 0;
                                            v256 = 0;
                                            v211 = 0;
                                            v214 = 0;
                                            v255 = 0;
                                            v212 = 0;
                                            v217 = 0;
                                            v254 = 0;
                                            v209 = 0;
                                            v216 = 0;
                                            v253 = 0;
                                            v208 = 0;
                                            v213 = 0;
                                            v252 = 0;
                                            v207 = 0;
                                            v210 = 0;
                                            v251 = 0;
                                            v215 = 0;
                                            v250 = 0;
                                            v220 = 0;
                                            v222 = 0;
                                            v249 = 0;
                                            v225 = 0;
                                            v230 = 0;
                                            v248 = 0;
                                            v229 = 0;
                                            v231 = 0;
                                            v246 = 0;
                                            v233 = 0;
                                            v235 = 0;
                                            v244 = 0;
                                            v236 = 0;
                                            v239 = 0;
                                            v243 = 0;
                                            v240 = 0;
                                            v14 = 0;
                                            v15 = 0;
                                            v16 = 0;
                                            v17 = 0;
                                            v247 = 1;
                                            v245 = 1;
                                            v242[2] = 1;
                                            v13 = 1;
                                            v242[1] = 0x100000001;
                                            v242[0] = 0x100000001;
                                            v241 = 0x100000001;
                                            v237 = 1;
                                            v238 = 1;
                                            v232 = 1;
                                            v234 = 1;
                                            v228 = 1;
                                            v227 = 1;
                                            v224 = 1;
                                          }
                                          else
                                          {
                                            -[SFRichTitleCardSection descriptionText](self, "descriptionText");
                                            v42 = objc_claimAutoreleasedReturnValue();
                                            v264 = v42 != 0;
                                            v161 = (void *)v42;
                                            if (!v42
                                              || (-[SFRichTitleCardSection descriptionText](self, "descriptionText"),
                                                  v43 = (void *)objc_claimAutoreleasedReturnValue(),
                                                  -[SFRichTitleCardSection descriptionText](v7, "descriptionText"),
                                                  v158 = v43,
                                                  v157 = (void *)objc_claimAutoreleasedReturnValue(),
                                                  objc_msgSend(v43, "isEqual:")))
                                            {
                                              -[SFRichTitleCardSection rating](self, "rating");
                                              v160 = (void *)objc_claimAutoreleasedReturnValue();
                                              -[SFRichTitleCardSection rating](v7, "rating");
                                              v159 = (void *)objc_claimAutoreleasedReturnValue();
                                              if ((v160 == 0) == (v159 != 0))
                                              {
                                                v263 = 0;
                                                v219 = 0;
                                                v221 = 0;
                                                v257 = 0;
                                                v218 = 0;
                                                v256 = 0;
                                                v211 = 0;
                                                v214 = 0;
                                                v255 = 0;
                                                v212 = 0;
                                                v217 = 0;
                                                v254 = 0;
                                                v209 = 0;
                                                v216 = 0;
                                                v253 = 0;
                                                v208 = 0;
                                                v213 = 0;
                                                v252 = 0;
                                                v207 = 0;
                                                v210 = 0;
                                                v251 = 0;
                                                v215 = 0;
                                                v250 = 0;
                                                v220 = 0;
                                                v222 = 0;
                                                v249 = 0;
                                                v225 = 0;
                                                v230 = 0;
                                                v248 = 0;
                                                v229 = 0;
                                                v231 = 0;
                                                v246 = 0;
                                                v233 = 0;
                                                v235 = 0;
                                                v244 = 0;
                                                v236 = 0;
                                                v239 = 0;
                                                v243 = 0;
                                                v240 = 0;
                                                v14 = 0;
                                                v15 = 0;
                                                v16 = 0;
                                                v17 = 0;
                                                v247 = 1;
                                                v245 = 1;
                                                HIDWORD(v242[2]) = 0;
                                                v13 = 1;
                                                LODWORD(v242[1]) = 1;
                                                *(_QWORD *)((char *)&v242[1] + 4) = 0x100000001;
                                                v242[0] = 0x100000001;
                                                v241 = 0x100000001;
                                                v237 = 1;
                                                v238 = 1;
                                                v232 = 1;
                                                v234 = 1;
                                                v228 = 1;
                                                v227 = 1;
                                                v224 = 1;
                                                v226 = 1;
                                                v223 = 1;
                                              }
                                              else
                                              {
                                                -[SFRichTitleCardSection rating](self, "rating");
                                                v44 = objc_claimAutoreleasedReturnValue();
                                                v263 = v44 != 0;
                                                v156 = (void *)v44;
                                                if (!v44
                                                  || (-[SFRichTitleCardSection rating](self, "rating"),
                                                      v45 = (void *)objc_claimAutoreleasedReturnValue(),
                                                      -[SFRichTitleCardSection rating](v7, "rating"),
                                                      v155 = v45,
                                                      v154 = (void *)objc_claimAutoreleasedReturnValue(),
                                                      objc_msgSend(v45, "isEqual:")))
                                                {
                                                  -[SFRichTitleCardSection ratingText](self, "ratingText");
                                                  v153 = (void *)objc_claimAutoreleasedReturnValue();
                                                  -[SFRichTitleCardSection ratingText](v7, "ratingText");
                                                  v152 = (void *)objc_claimAutoreleasedReturnValue();
                                                  if ((v153 == 0) == (v152 != 0))
                                                  {
                                                    v221 = 0;
                                                    v257 = 0;
                                                    v218 = 0;
                                                    v256 = 0;
                                                    v211 = 0;
                                                    v214 = 0;
                                                    v255 = 0;
                                                    v212 = 0;
                                                    v217 = 0;
                                                    v254 = 0;
                                                    v209 = 0;
                                                    v216 = 0;
                                                    v253 = 0;
                                                    v208 = 0;
                                                    v213 = 0;
                                                    v252 = 0;
                                                    v207 = 0;
                                                    v210 = 0;
                                                    v251 = 0;
                                                    v215 = 0;
                                                    v250 = 0;
                                                    v220 = 0;
                                                    v222 = 0;
                                                    v249 = 0;
                                                    v225 = 0;
                                                    v230 = 0;
                                                    v248 = 0;
                                                    v229 = 0;
                                                    v231 = 0;
                                                    v246 = 0;
                                                    v233 = 0;
                                                    v235 = 0;
                                                    v244 = 0;
                                                    v236 = 0;
                                                    v239 = 0;
                                                    v243 = 0;
                                                    v240 = 0;
                                                    v14 = 0;
                                                    v15 = 0;
                                                    v16 = 0;
                                                    v17 = 0;
                                                    v247 = 1;
                                                    v245 = 1;
                                                    v242[2] = 1;
                                                    v13 = 1;
                                                    v242[1] = 0x100000001;
                                                    v242[0] = 0x100000001;
                                                    v241 = 0x100000001;
                                                    v237 = 1;
                                                    v238 = 1;
                                                    v232 = 1;
                                                    v234 = 1;
                                                    v228 = 1;
                                                    v227 = 1;
                                                    v224 = 1;
                                                    v226 = 1;
                                                    v223 = 0x100000001;
                                                    v219 = 1;
                                                  }
                                                  else
                                                  {
                                                    -[SFRichTitleCardSection ratingText](self, "ratingText");
                                                    v46 = objc_claimAutoreleasedReturnValue();
                                                    v257 = v46 != 0;
                                                    v151 = (void *)v46;
                                                    if (!v46
                                                      || (-[SFRichTitleCardSection ratingText](self, "ratingText"),
                                                          v47 = (void *)objc_claimAutoreleasedReturnValue(),
                                                          -[SFRichTitleCardSection ratingText](v7, "ratingText"),
                                                          v150 = v47,
                                                          v149 = (void *)objc_claimAutoreleasedReturnValue(),
                                                          objc_msgSend(v47, "isEqual:")))
                                                    {
                                                      -[SFRichTitleCardSection reviewGlyph](self, "reviewGlyph");
                                                      v148 = (void *)objc_claimAutoreleasedReturnValue();
                                                      -[SFRichTitleCardSection reviewGlyph](v7, "reviewGlyph");
                                                      v147 = (void *)objc_claimAutoreleasedReturnValue();
                                                      if ((v148 == 0) == (v147 != 0))
                                                      {
                                                        v256 = 0;
                                                        v211 = 0;
                                                        v214 = 0;
                                                        v255 = 0;
                                                        v212 = 0;
                                                        v217 = 0;
                                                        v254 = 0;
                                                        v209 = 0;
                                                        v216 = 0;
                                                        v253 = 0;
                                                        v208 = 0;
                                                        v213 = 0;
                                                        v252 = 0;
                                                        v207 = 0;
                                                        v210 = 0;
                                                        v251 = 0;
                                                        v215 = 0;
                                                        v250 = 0;
                                                        v220 = 0;
                                                        v222 = 0;
                                                        v249 = 0;
                                                        v225 = 0;
                                                        v230 = 0;
                                                        v248 = 0;
                                                        v229 = 0;
                                                        v231 = 0;
                                                        v246 = 0;
                                                        v233 = 0;
                                                        v235 = 0;
                                                        v244 = 0;
                                                        v236 = 0;
                                                        v239 = 0;
                                                        v243 = 0;
                                                        v240 = 0;
                                                        v14 = 0;
                                                        v15 = 0;
                                                        v16 = 0;
                                                        v17 = 0;
                                                        v247 = 1;
                                                        v245 = 1;
                                                        HIDWORD(v242[2]) = 0;
                                                        v13 = 1;
                                                        LODWORD(v242[1]) = 1;
                                                        *(_QWORD *)((char *)&v242[1] + 4) = 0x100000001;
                                                        v242[0] = 0x100000001;
                                                        v241 = 0x100000001;
                                                        v237 = 1;
                                                        v238 = 1;
                                                        v232 = 1;
                                                        v234 = 1;
                                                        v228 = 1;
                                                        v227 = 1;
                                                        v224 = 1;
                                                        v226 = 1;
                                                        v223 = 0x100000001;
                                                        v219 = 1;
                                                        v221 = 1;
                                                        v218 = 1;
                                                      }
                                                      else
                                                      {
                                                        -[SFRichTitleCardSection reviewGlyph](self, "reviewGlyph");
                                                        v48 = objc_claimAutoreleasedReturnValue();
                                                        v256 = v48 != 0;
                                                        v144 = (void *)v48;
                                                        if (!v48
                                                          || (-[SFRichTitleCardSection reviewGlyph](self, "reviewGlyph"),
                                                              v49 = (void *)objc_claimAutoreleasedReturnValue(),
                                                              -[SFRichTitleCardSection reviewGlyph](v7, "reviewGlyph"),
                                                              v146 = v49,
                                                              v145 = (void *)objc_claimAutoreleasedReturnValue(),
                                                              objc_msgSend(v49, "isEqual:")))
                                                        {
                                                          -[SFRichTitleCardSection reviewText](self, "reviewText");
                                                          v143 = (void *)objc_claimAutoreleasedReturnValue();
                                                          -[SFRichTitleCardSection reviewText](v7, "reviewText");
                                                          v142 = (void *)objc_claimAutoreleasedReturnValue();
                                                          if ((v143 == 0) == (v142 != 0))
                                                          {
                                                            v214 = 0;
                                                            v255 = 0;
                                                            v212 = 0;
                                                            v217 = 0;
                                                            v254 = 0;
                                                            v209 = 0;
                                                            v216 = 0;
                                                            v253 = 0;
                                                            v208 = 0;
                                                            v213 = 0;
                                                            v252 = 0;
                                                            v207 = 0;
                                                            v210 = 0;
                                                            v251 = 0;
                                                            v215 = 0;
                                                            v250 = 0;
                                                            v220 = 0;
                                                            v222 = 0;
                                                            v249 = 0;
                                                            v225 = 0;
                                                            v230 = 0;
                                                            v248 = 0;
                                                            v229 = 0;
                                                            v231 = 0;
                                                            v246 = 0;
                                                            v233 = 0;
                                                            v235 = 0;
                                                            v244 = 0;
                                                            v236 = 0;
                                                            v239 = 0;
                                                            v243 = 0;
                                                            v240 = 0;
                                                            v14 = 0;
                                                            v15 = 0;
                                                            v16 = 0;
                                                            v17 = 0;
                                                            v247 = 1;
                                                            v245 = 1;
                                                            v242[2] = 1;
                                                            v13 = 1;
                                                            v242[1] = 0x100000001;
                                                            v242[0] = 0x100000001;
                                                            v241 = 0x100000001;
                                                            v237 = 1;
                                                            v238 = 1;
                                                            v232 = 1;
                                                            v234 = 1;
                                                            v228 = 1;
                                                            v227 = 1;
                                                            v224 = 1;
                                                            v226 = 1;
                                                            v223 = 0x100000001;
                                                            v219 = 1;
                                                            v221 = 1;
                                                            v218 = 0x100000001;
                                                            v211 = 1;
                                                          }
                                                          else
                                                          {
                                                            -[SFRichTitleCardSection reviewText](self, "reviewText");
                                                            v50 = objc_claimAutoreleasedReturnValue();
                                                            v255 = v50 != 0;
                                                            v136 = (void *)v50;
                                                            if (!v50
                                                              || (-[SFRichTitleCardSection reviewText](self, "reviewText"), v51 = (void *)objc_claimAutoreleasedReturnValue(), -[SFRichTitleCardSection reviewText](v7, "reviewText"), v140 = (void *)objc_claimAutoreleasedReturnValue(), v141 = v51, objc_msgSend(v51, "isEqual:")))
                                                            {
                                                              v52 = -[SFRichTitleCardSection reviewNewLine](self, "reviewNewLine");
                                                              if (v52 == -[SFRichTitleCardSection reviewNewLine](v7, "reviewNewLine"))
                                                              {
                                                                -[SFRichTitleCardSection moreGlyphs](self, "moreGlyphs");
                                                                v134 = (void *)objc_claimAutoreleasedReturnValue();
                                                                -[SFRichTitleCardSection moreGlyphs](v7, "moreGlyphs");
                                                                v133 = (void *)objc_claimAutoreleasedReturnValue();
                                                                if ((v134 == 0) == (v133 != 0))
                                                                {
                                                                  v217 = 0;
                                                                  v254 = 0;
                                                                  v209 = 0;
                                                                  v216 = 0;
                                                                  v253 = 0;
                                                                  v208 = 0;
                                                                  v213 = 0;
                                                                  v252 = 0;
                                                                  v207 = 0;
                                                                  v210 = 0;
                                                                  v251 = 0;
                                                                  v215 = 0;
                                                                  v250 = 0;
                                                                  v220 = 0;
                                                                  v222 = 0;
                                                                  v249 = 0;
                                                                  v225 = 0;
                                                                  v230 = 0;
                                                                  v248 = 0;
                                                                  v229 = 0;
                                                                  v231 = 0;
                                                                  v246 = 0;
                                                                  v233 = 0;
                                                                  v235 = 0;
                                                                  v244 = 0;
                                                                  v236 = 0;
                                                                  v239 = 0;
                                                                  v243 = 0;
                                                                  v240 = 0;
                                                                  v14 = 0;
                                                                  v15 = 0;
                                                                  v16 = 0;
                                                                  v17 = 0;
                                                                  v247 = 1;
                                                                  v245 = 1;
                                                                  v242[2] = 1;
                                                                  v13 = 1;
                                                                  v242[1] = 0x100000001;
                                                                  v242[0] = 0x100000001;
                                                                  v241 = 0x100000001;
                                                                  v237 = 1;
                                                                  v238 = 1;
                                                                  v232 = 1;
                                                                  v234 = 1;
                                                                  v228 = 1;
                                                                  v227 = 1;
                                                                  v224 = 1;
                                                                  v226 = 1;
                                                                  v223 = 0x100000001;
                                                                  v219 = 1;
                                                                  v221 = 1;
                                                                  v218 = 0x100000001;
                                                                  v211 = 1;
                                                                  v214 = 1;
                                                                  v212 = 1;
                                                                }
                                                                else
                                                                {
                                                                  -[SFRichTitleCardSection moreGlyphs](self, "moreGlyphs");
                                                                  v53 = objc_claimAutoreleasedReturnValue();
                                                                  v254 = v53 != 0;
                                                                  v130 = (void *)v53;
                                                                  if (!v53
                                                                    || (-[SFRichTitleCardSection moreGlyphs](self, "moreGlyphs"), v54 = (void *)objc_claimAutoreleasedReturnValue(), -[SFRichTitleCardSection moreGlyphs](v7, "moreGlyphs"), v138 = (void *)objc_claimAutoreleasedReturnValue(), v139 = v54, objc_msgSend(v54, "isEqual:")))
                                                                  {
                                                                    -[SFRichTitleCardSection auxiliaryTopText](self, "auxiliaryTopText");
                                                                    v129 = (void *)objc_claimAutoreleasedReturnValue();
                                                                    -[SFRichTitleCardSection auxiliaryTopText](v7, "auxiliaryTopText");
                                                                    v128 = (void *)objc_claimAutoreleasedReturnValue();
                                                                    if ((v129 == 0) == (v128 != 0))
                                                                    {
                                                                      v216 = 0;
                                                                      v253 = 0;
                                                                      v208 = 0;
                                                                      v213 = 0;
                                                                      v252 = 0;
                                                                      v207 = 0;
                                                                      v210 = 0;
                                                                      v251 = 0;
                                                                      v215 = 0;
                                                                      v250 = 0;
                                                                      v220 = 0;
                                                                      v222 = 0;
                                                                      v249 = 0;
                                                                      v225 = 0;
                                                                      v230 = 0;
                                                                      v248 = 0;
                                                                      v229 = 0;
                                                                      v231 = 0;
                                                                      v246 = 0;
                                                                      v233 = 0;
                                                                      v235 = 0;
                                                                      v244 = 0;
                                                                      v236 = 0;
                                                                      v239 = 0;
                                                                      v243 = 0;
                                                                      v240 = 0;
                                                                      v14 = 0;
                                                                      v15 = 0;
                                                                      v16 = 0;
                                                                      v17 = 0;
                                                                      v247 = 1;
                                                                      v245 = 1;
                                                                      v242[2] = 1;
                                                                      v13 = 1;
                                                                      v242[1] = 0x100000001;
                                                                      v242[0] = 0x100000001;
                                                                      v241 = 0x100000001;
                                                                      v237 = 1;
                                                                      v238 = 1;
                                                                      v232 = 1;
                                                                      v234 = 1;
                                                                      v228 = 1;
                                                                      v227 = 1;
                                                                      v224 = 1;
                                                                      v226 = 1;
                                                                      v223 = 0x100000001;
                                                                      v219 = 1;
                                                                      v221 = 1;
                                                                      v218 = 0x100000001;
                                                                      v211 = 1;
                                                                      v214 = 1;
                                                                      v212 = 1;
                                                                      v217 = 1;
                                                                      v209 = 1;
                                                                    }
                                                                    else
                                                                    {
                                                                      -[SFRichTitleCardSection auxiliaryTopText](self, "auxiliaryTopText");
                                                                      v55 = objc_claimAutoreleasedReturnValue();
                                                                      v253 = v55 != 0;
                                                                      v125 = (void *)v55;
                                                                      if (!v55
                                                                        || (-[SFRichTitleCardSection auxiliaryTopText](self, "auxiliaryTopText"), v56 = (void *)objc_claimAutoreleasedReturnValue(), -[SFRichTitleCardSection auxiliaryTopText](v7, "auxiliaryTopText"), v137 = v56, v135 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v56, "isEqual:")))
                                                                      {
                                                                        -[SFRichTitleCardSection auxiliaryMiddleText](self, "auxiliaryMiddleText");
                                                                        v124 = (void *)objc_claimAutoreleasedReturnValue();
                                                                        -[SFRichTitleCardSection auxiliaryMiddleText](v7, "auxiliaryMiddleText");
                                                                        v123 = (void *)objc_claimAutoreleasedReturnValue();
                                                                        if ((v124 == 0) == (v123 != 0))
                                                                        {
                                                                          v213 = 0;
                                                                          v252 = 0;
                                                                          v207 = 0;
                                                                          v210 = 0;
                                                                          v251 = 0;
                                                                          v215 = 0;
                                                                          v250 = 0;
                                                                          v220 = 0;
                                                                          v222 = 0;
                                                                          v249 = 0;
                                                                          v225 = 0;
                                                                          v230 = 0;
                                                                          v248 = 0;
                                                                          v229 = 0;
                                                                          v231 = 0;
                                                                          v246 = 0;
                                                                          v233 = 0;
                                                                          v235 = 0;
                                                                          v244 = 0;
                                                                          v236 = 0;
                                                                          v239 = 0;
                                                                          v243 = 0;
                                                                          v240 = 0;
                                                                          v14 = 0;
                                                                          v15 = 0;
                                                                          v16 = 0;
                                                                          v17 = 0;
                                                                          v247 = 1;
                                                                          v245 = 1;
                                                                          v242[2] = 1;
                                                                          v13 = 1;
                                                                          v242[1] = 0x100000001;
                                                                          v242[0] = 0x100000001;
                                                                          v241 = 0x100000001;
                                                                          v237 = 1;
                                                                          v238 = 1;
                                                                          v232 = 1;
                                                                          v234 = 1;
                                                                          v228 = 1;
                                                                          v227 = 1;
                                                                          v224 = 1;
                                                                          v226 = 1;
                                                                          v223 = 0x100000001;
                                                                          v219 = 1;
                                                                          v221 = 1;
                                                                          v218 = 0x100000001;
                                                                          v211 = 1;
                                                                          v214 = 1;
                                                                          v212 = 1;
                                                                          v217 = 1;
                                                                          v209 = 1;
                                                                          v216 = 1;
                                                                          v208 = 1;
                                                                        }
                                                                        else
                                                                        {
                                                                          -[SFRichTitleCardSection auxiliaryMiddleText](self, "auxiliaryMiddleText");
                                                                          v57 = objc_claimAutoreleasedReturnValue();
                                                                          v252 = v57 != 0;
                                                                          v122 = (void *)v57;
                                                                          if (!v57
                                                                            || (-[SFRichTitleCardSection auxiliaryMiddleText](self, "auxiliaryMiddleText"), v58 = (void *)objc_claimAutoreleasedReturnValue(), -[SFRichTitleCardSection auxiliaryMiddleText](v7, "auxiliaryMiddleText"), v131 = (void *)objc_claimAutoreleasedReturnValue(), v132 = v58, objc_msgSend(v58, "isEqual:")))
                                                                          {
                                                                            -[SFRichTitleCardSection auxiliaryBottomText](self, "auxiliaryBottomText");
                                                                            v119 = (void *)objc_claimAutoreleasedReturnValue();
                                                                            -[SFRichTitleCardSection auxiliaryBottomText](v7, "auxiliaryBottomText");
                                                                            v118 = (void *)objc_claimAutoreleasedReturnValue();
                                                                            if ((v119 == 0) == (v118 != 0))
                                                                            {
                                                                              v210 = 0;
                                                                              v251 = 0;
                                                                              v215 = 0;
                                                                              v250 = 0;
                                                                              v220 = 0;
                                                                              v222 = 0;
                                                                              v249 = 0;
                                                                              v225 = 0;
                                                                              v230 = 0;
                                                                              v248 = 0;
                                                                              v229 = 0;
                                                                              v231 = 0;
                                                                              v246 = 0;
                                                                              v233 = 0;
                                                                              v235 = 0;
                                                                              v244 = 0;
                                                                              v236 = 0;
                                                                              v239 = 0;
                                                                              v243 = 0;
                                                                              v240 = 0;
                                                                              v14 = 0;
                                                                              v15 = 0;
                                                                              v16 = 0;
                                                                              v17 = 0;
                                                                              v247 = 1;
                                                                              v245 = 1;
                                                                              v242[2] = 1;
                                                                              v13 = 1;
                                                                              v242[1] = 0x100000001;
                                                                              v242[0] = 0x100000001;
                                                                              v241 = 0x100000001;
                                                                              v237 = 1;
                                                                              v238 = 1;
                                                                              v232 = 1;
                                                                              v234 = 1;
                                                                              v228 = 1;
                                                                              v227 = 1;
                                                                              v224 = 1;
                                                                              v226 = 1;
                                                                              v223 = 0x100000001;
                                                                              v219 = 1;
                                                                              v221 = 1;
                                                                              v218 = 0x100000001;
                                                                              v211 = 1;
                                                                              v214 = 1;
                                                                              v212 = 1;
                                                                              v217 = 1;
                                                                              v209 = 1;
                                                                              v216 = 1;
                                                                              v208 = 1;
                                                                              v213 = 1;
                                                                              v207 = 1;
                                                                            }
                                                                            else
                                                                            {
                                                                              -[SFRichTitleCardSection auxiliaryBottomText](self, "auxiliaryBottomText");
                                                                              v59 = objc_claimAutoreleasedReturnValue();
                                                                              v251 = v59 != 0;
                                                                              v117 = (void *)v59;
                                                                              if (!v59
                                                                                || (-[SFRichTitleCardSection auxiliaryBottomText](self, "auxiliaryBottomText"), v60 = (void *)objc_claimAutoreleasedReturnValue(), -[SFRichTitleCardSection auxiliaryBottomText](v7, "auxiliaryBottomText"), v126 = (void *)objc_claimAutoreleasedReturnValue(), v127 = v60, objc_msgSend(v60, "isEqual:")))
                                                                              {
                                                                                v61 = -[SFRichTitleCardSection auxiliaryBottomTextColor](self, "auxiliaryBottomTextColor");
                                                                                if (v61 == -[SFRichTitleCardSection auxiliaryBottomTextColor](v7, "auxiliaryBottomTextColor"))
                                                                                {
                                                                                  -[SFRichTitleCardSection auxiliaryAlignment](self, "auxiliaryAlignment");
                                                                                  v114 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                  -[SFRichTitleCardSection auxiliaryAlignment](v7, "auxiliaryAlignment");
                                                                                  v113 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                  if ((v114 == 0) == (v113 != 0))
                                                                                  {
                                                                                    v250 = 0;
                                                                                    v220 = 0;
                                                                                    v222 = 0;
                                                                                    v249 = 0;
                                                                                    v225 = 0;
                                                                                    v230 = 0;
                                                                                    v248 = 0;
                                                                                    v229 = 0;
                                                                                    v231 = 0;
                                                                                    v246 = 0;
                                                                                    v233 = 0;
                                                                                    v235 = 0;
                                                                                    v244 = 0;
                                                                                    v236 = 0;
                                                                                    v239 = 0;
                                                                                    v243 = 0;
                                                                                    v240 = 0;
                                                                                    v14 = 0;
                                                                                    v15 = 0;
                                                                                    v16 = 0;
                                                                                    v17 = 0;
                                                                                    v247 = 1;
                                                                                    v245 = 1;
                                                                                    HIDWORD(v242[2]) = 0;
                                                                                    v13 = 1;
                                                                                    LODWORD(v242[1]) = 1;
                                                                                    *(_QWORD *)((char *)&v242[1] + 4) = 0x100000001;
                                                                                    v242[0] = 0x100000001;
                                                                                    v241 = 0x100000001;
                                                                                    v237 = 1;
                                                                                    v238 = 1;
                                                                                    v232 = 1;
                                                                                    v234 = 1;
                                                                                    v228 = 1;
                                                                                    v227 = 1;
                                                                                    v224 = 1;
                                                                                    v226 = 1;
                                                                                    v223 = 0x100000001;
                                                                                    v219 = 1;
                                                                                    v221 = 1;
                                                                                    v218 = 0x100000001;
                                                                                    v211 = 1;
                                                                                    v214 = 1;
                                                                                    v212 = 1;
                                                                                    v217 = 1;
                                                                                    v209 = 1;
                                                                                    v216 = 1;
                                                                                    v208 = 1;
                                                                                    v213 = 1;
                                                                                    v207 = 1;
                                                                                    v210 = 1;
                                                                                    v215 = 1;
                                                                                  }
                                                                                  else
                                                                                  {
                                                                                    -[SFRichTitleCardSection auxiliaryAlignment](self, "auxiliaryAlignment");
                                                                                    v62 = objc_claimAutoreleasedReturnValue();
                                                                                    v250 = v62 != 0;
                                                                                    v112 = (void *)v62;
                                                                                    if (!v62
                                                                                      || (-[SFRichTitleCardSection auxiliaryAlignment](self, "auxiliaryAlignment"), v63 = (void *)objc_claimAutoreleasedReturnValue(), -[SFRichTitleCardSection auxiliaryAlignment](v7, "auxiliaryAlignment"), v120 = (void *)objc_claimAutoreleasedReturnValue(), v121 = v63, objc_msgSend(v63, "isEqual:")))
                                                                                    {
                                                                                      v64 = -[SFRichTitleCardSection hideVerticalDivider](self, "hideVerticalDivider");
                                                                                      if (v64 == -[SFRichTitleCardSection hideVerticalDivider](v7, "hideVerticalDivider")&& (v65 = -[SFRichTitleCardSection titleAlign](self, "titleAlign"), v65 == -[SFRichTitleCardSection titleAlign](v7, "titleAlign")))
                                                                                      {
                                                                                        -[SFRichTitleCardSection titleWeight](self, "titleWeight");
                                                                                        v111 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                        -[SFRichTitleCardSection titleWeight](v7, "titleWeight");
                                                                                        v109 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                        if ((v111 == 0) == (v109 != 0))
                                                                                        {
                                                                                          v222 = 0;
                                                                                          v249 = 0;
                                                                                          v225 = 0;
                                                                                          v230 = 0;
                                                                                          v248 = 0;
                                                                                          v229 = 0;
                                                                                          v231 = 0;
                                                                                          v246 = 0;
                                                                                          v233 = 0;
                                                                                          v235 = 0;
                                                                                          v244 = 0;
                                                                                          v236 = 0;
                                                                                          v239 = 0;
                                                                                          v243 = 0;
                                                                                          v240 = 0;
                                                                                          v14 = 0;
                                                                                          v15 = 0;
                                                                                          v16 = 0;
                                                                                          v17 = 0;
                                                                                          v247 = 1;
                                                                                          v245 = 1;
                                                                                          v242[2] = 1;
                                                                                          v13 = 1;
                                                                                          v242[1] = 0x100000001;
                                                                                          v242[0] = 0x100000001;
                                                                                          v241 = 0x100000001;
                                                                                          v237 = 1;
                                                                                          v238 = 1;
                                                                                          v232 = 1;
                                                                                          v234 = 1;
                                                                                          v228 = 1;
                                                                                          v227 = 1;
                                                                                          v224 = 1;
                                                                                          v226 = 1;
                                                                                          v223 = 0x100000001;
                                                                                          v219 = 1;
                                                                                          v221 = 1;
                                                                                          v218 = 0x100000001;
                                                                                          v211 = 1;
                                                                                          v214 = 1;
                                                                                          v212 = 1;
                                                                                          v217 = 1;
                                                                                          v209 = 1;
                                                                                          v216 = 1;
                                                                                          v208 = 1;
                                                                                          v213 = 1;
                                                                                          v207 = 1;
                                                                                          v210 = 1;
                                                                                          v215 = 0x100000001;
                                                                                          v220 = 1;
                                                                                        }
                                                                                        else
                                                                                        {
                                                                                          -[SFRichTitleCardSection titleWeight](self, "titleWeight");
                                                                                          v66 = objc_claimAutoreleasedReturnValue();
                                                                                          v249 = v66 != 0;
                                                                                          v107 = (void *)v66;
                                                                                          if (!v66
                                                                                            || (-[SFRichTitleCardSection titleWeight](self, "titleWeight"), v67 = (void *)objc_claimAutoreleasedReturnValue(), -[SFRichTitleCardSection titleWeight](v7, "titleWeight"), v115 = (void *)objc_claimAutoreleasedReturnValue(), v116 = v67, objc_msgSend(v67, "isEqual:")))
                                                                                          {
                                                                                            v68 = -[SFRichTitleCardSection titleNoWrap](self, "titleNoWrap");
                                                                                            if (v68 == -[SFRichTitleCardSection titleNoWrap](v7, "titleNoWrap")
                                                                                              && (v69 = -[SFRichTitleCardSection thumbnailCropCircle](self, "thumbnailCropCircle"),
                                                                                                  v69 == -[SFRichTitleCardSection thumbnailCropCircle](v7, "thumbnailCropCircle")))
                                                                                            {
                                                                                              -[SFRichTitleCardSection imageOverlay](self, "imageOverlay");
                                                                                              v104 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                              -[SFRichTitleCardSection imageOverlay](v7, "imageOverlay");
                                                                                              v103 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                              if ((v104 == 0) == (v103 != 0))
                                                                                              {
                                                                                                v230 = 0;
                                                                                                v248 = 0;
                                                                                                v229 = 0;
                                                                                                v231 = 0;
                                                                                                v246 = 0;
                                                                                                v233 = 0;
                                                                                                v235 = 0;
                                                                                                v244 = 0;
                                                                                                v236 = 0;
                                                                                                v239 = 0;
                                                                                                v243 = 0;
                                                                                                v240 = 0;
                                                                                                v14 = 0;
                                                                                                v15 = 0;
                                                                                                v16 = 0;
                                                                                                v17 = 0;
                                                                                                v247 = 1;
                                                                                                v245 = 1;
                                                                                                v242[2] = 1;
                                                                                                v13 = 1;
                                                                                                v242[1] = 0x100000001;
                                                                                                v242[0] = 0x100000001;
                                                                                                v241 = 0x100000001;
                                                                                                v237 = 1;
                                                                                                v238 = 1;
                                                                                                v232 = 1;
                                                                                                v234 = 1;
                                                                                                v228 = 1;
                                                                                                v227 = 1;
                                                                                                v224 = 1;
                                                                                                v226 = 1;
                                                                                                v223 = 0x100000001;
                                                                                                v219 = 1;
                                                                                                v221 = 1;
                                                                                                v218 = 0x100000001;
                                                                                                v211 = 1;
                                                                                                v214 = 1;
                                                                                                v212 = 1;
                                                                                                v217 = 1;
                                                                                                v209 = 1;
                                                                                                v216 = 1;
                                                                                                v208 = 1;
                                                                                                v213 = 1;
                                                                                                v207 = 1;
                                                                                                v210 = 1;
                                                                                                v215 = 0x100000001;
                                                                                                v220 = 1;
                                                                                                v222 = 1;
                                                                                                v225 = 1;
                                                                                              }
                                                                                              else
                                                                                              {
                                                                                                -[SFRichTitleCardSection imageOverlay](self, "imageOverlay");
                                                                                                v70 = objc_claimAutoreleasedReturnValue();
                                                                                                v248 = v70 != 0;
                                                                                                v102 = (void *)v70;
                                                                                                if (!v70 || (-[SFRichTitleCardSection imageOverlay](self, "imageOverlay"), v71 = (void *)objc_claimAutoreleasedReturnValue(), -[SFRichTitleCardSection imageOverlay](v7, "imageOverlay"), v110 = v71, v108 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v71, "isEqual:")))
                                                                                                {
                                                                                                  -[SFRichTitleCardSection playAction](self, "playAction");
                                                                                                  v101 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                  -[SFRichTitleCardSection playAction](v7, "playAction");
                                                                                                  v100 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                  if ((v101 == 0) == (v100 != 0))
                                                                                                  {
                                                                                                    v231 = 0;
                                                                                                    v246 = 0;
                                                                                                    v233 = 0;
                                                                                                    v235 = 0;
                                                                                                    v244 = 0;
                                                                                                    v236 = 0;
                                                                                                    v239 = 0;
                                                                                                    v243 = 0;
                                                                                                    v240 = 0;
                                                                                                    v14 = 0;
                                                                                                    v15 = 0;
                                                                                                    v16 = 0;
                                                                                                    v17 = 0;
                                                                                                    v247 = 1;
                                                                                                    v245 = 1;
                                                                                                    v242[2] = 1;
                                                                                                    v13 = 1;
                                                                                                    v242[1] = 0x100000001;
                                                                                                    v242[0] = 0x100000001;
                                                                                                    v241 = 0x100000001;
                                                                                                    v237 = 1;
                                                                                                    v238 = 1;
                                                                                                    v232 = 1;
                                                                                                    v234 = 1;
                                                                                                    v228 = 1;
                                                                                                    v227 = 1;
                                                                                                    v224 = 1;
                                                                                                    v226 = 1;
                                                                                                    v223 = 0x100000001;
                                                                                                    v219 = 1;
                                                                                                    v221 = 1;
                                                                                                    v218 = 0x100000001;
                                                                                                    v211 = 1;
                                                                                                    v214 = 1;
                                                                                                    v212 = 1;
                                                                                                    v217 = 1;
                                                                                                    v209 = 1;
                                                                                                    v216 = 1;
                                                                                                    v208 = 1;
                                                                                                    v213 = 1;
                                                                                                    v207 = 1;
                                                                                                    v210 = 1;
                                                                                                    v215 = 0x100000001;
                                                                                                    v220 = 1;
                                                                                                    v222 = 1;
                                                                                                    v225 = 1;
                                                                                                    v230 = 1;
                                                                                                    v229 = 1;
                                                                                                  }
                                                                                                  else
                                                                                                  {
                                                                                                    -[SFRichTitleCardSection playAction](self, "playAction");
                                                                                                    v72 = objc_claimAutoreleasedReturnValue();
                                                                                                    v246 = v72 != 0;
                                                                                                    v97 = (void *)v72;
                                                                                                    if (!v72 || (-[SFRichTitleCardSection playAction](self, "playAction"), v73 = (void *)objc_claimAutoreleasedReturnValue(), -[SFRichTitleCardSection playAction](v7, "playAction"), v105 = (void *)objc_claimAutoreleasedReturnValue(), v106 = v73, objc_msgSend(v73, "isEqual:")))
                                                                                                    {
                                                                                                      v74 = -[SFRichTitleCardSection playActionAlign](self, "playActionAlign");
                                                                                                      if (v74 == -[SFRichTitleCardSection playActionAlign](v7, "playActionAlign"))
                                                                                                      {
                                                                                                        -[SFRichTitleCardSection offers](self, "offers");
                                                                                                        v96 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                        -[SFRichTitleCardSection offers](v7, "offers");
                                                                                                        v95 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                        if ((v96 == 0) == (v95 != 0))
                                                                                                        {
                                                                                                          v235 = 0;
                                                                                                          v244 = 0;
                                                                                                          v236 = 0;
                                                                                                          v239 = 0;
                                                                                                          v243 = 0;
                                                                                                          v240 = 0;
                                                                                                          v14 = 0;
                                                                                                          v15 = 0;
                                                                                                          v16 = 0;
                                                                                                          v17 = 0;
                                                                                                          v247 = 1;
                                                                                                          v245 = 1;
                                                                                                          v242[2] = 1;
                                                                                                          v13 = 1;
                                                                                                          v242[1] = 0x100000001;
                                                                                                          v242[0] = 0x100000001;
                                                                                                          v241 = 0x100000001;
                                                                                                          v237 = 1;
                                                                                                          v238 = 1;
                                                                                                          v232 = 1;
                                                                                                          v234 = 1;
                                                                                                          v228 = 1;
                                                                                                          v227 = 1;
                                                                                                          v224 = 1;
                                                                                                          v226 = 1;
                                                                                                          v223 = 0x100000001;
                                                                                                          v219 = 1;
                                                                                                          v221 = 1;
                                                                                                          v218 = 0x100000001;
                                                                                                          v211 = 1;
                                                                                                          v214 = 1;
                                                                                                          v212 = 1;
                                                                                                          v217 = 1;
                                                                                                          v209 = 1;
                                                                                                          v216 = 1;
                                                                                                          v208 = 1;
                                                                                                          v213 = 1;
                                                                                                          v207 = 1;
                                                                                                          v210 = 1;
                                                                                                          v215 = 0x100000001;
                                                                                                          v220 = 1;
                                                                                                          v222 = 1;
                                                                                                          v225 = 1;
                                                                                                          v230 = 1;
                                                                                                          v229 = 1;
                                                                                                          v231 = 1;
                                                                                                          v233 = 1;
                                                                                                        }
                                                                                                        else
                                                                                                        {
                                                                                                          -[SFRichTitleCardSection offers](self, "offers");
                                                                                                          v75 = objc_claimAutoreleasedReturnValue();
                                                                                                          v244 = v75 != 0;
                                                                                                          v92 = (void *)v75;
                                                                                                          if (!v75 || (-[SFRichTitleCardSection offers](self, "offers"), v76 = (void *)objc_claimAutoreleasedReturnValue(), -[SFRichTitleCardSection offers](v7, "offers"), v98 = (void *)objc_claimAutoreleasedReturnValue(), v99 = v76, objc_msgSend(v76, "isEqual:")))
                                                                                                          {
                                                                                                            -[SFRichTitleCardSection footnote](self, "footnote");
                                                                                                            v91 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                            -[SFRichTitleCardSection footnote](v7, "footnote");
                                                                                                            v90 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                            if ((v91 == 0) == (v90 != 0))
                                                                                                            {
                                                                                                              v239 = 0;
                                                                                                              v243 = 0;
                                                                                                              v240 = 0;
                                                                                                              v14 = 0;
                                                                                                              v15 = 0;
                                                                                                              v16 = 0;
                                                                                                              v17 = 0;
                                                                                                              v247 = 1;
                                                                                                              v245 = 1;
                                                                                                              v242[2] = 1;
                                                                                                              v13 = 1;
                                                                                                              v242[1] = 0x100000001;
                                                                                                              v242[0] = 0x100000001;
                                                                                                              v241 = 0x100000001;
                                                                                                              v237 = 1;
                                                                                                              v238 = 1;
                                                                                                              v232 = 1;
                                                                                                              v234 = 1;
                                                                                                              v228 = 1;
                                                                                                              v227 = 1;
                                                                                                              v224 = 1;
                                                                                                              v226 = 1;
                                                                                                              v223 = 0x100000001;
                                                                                                              v219 = 1;
                                                                                                              v221 = 1;
                                                                                                              v218 = 0x100000001;
                                                                                                              v211 = 1;
                                                                                                              v214 = 1;
                                                                                                              v212 = 1;
                                                                                                              v217 = 1;
                                                                                                              v209 = 1;
                                                                                                              v216 = 1;
                                                                                                              v208 = 1;
                                                                                                              v213 = 1;
                                                                                                              v207 = 1;
                                                                                                              v210 = 1;
                                                                                                              v215 = 0x100000001;
                                                                                                              v220 = 1;
                                                                                                              v222 = 1;
                                                                                                              v225 = 1;
                                                                                                              v230 = 1;
                                                                                                              v229 = 1;
                                                                                                              v231 = 1;
                                                                                                              v233 = 1;
                                                                                                              v235 = 1;
                                                                                                              v236 = 1;
                                                                                                            }
                                                                                                            else
                                                                                                            {
                                                                                                              -[SFRichTitleCardSection footnote](self, "footnote");
                                                                                                              v77 = objc_claimAutoreleasedReturnValue();
                                                                                                              v243 = v77 != 0;
                                                                                                              v88 = (void *)v77;
                                                                                                              if (!v77 || (-[SFRichTitleCardSection footnote](self, "footnote"), v78 = (void *)objc_claimAutoreleasedReturnValue(), -[SFRichTitleCardSection footnote](v7, "footnote"), v93 = (void *)objc_claimAutoreleasedReturnValue(), v94 = v78, objc_msgSend(v78, "isEqual:")))
                                                                                                              {
                                                                                                                -[SFRichTitleCardSection richSubtitle](self, "richSubtitle");
                                                                                                                v86 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                -[SFRichTitleCardSection richSubtitle](v7, "richSubtitle");
                                                                                                                v85 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                if ((v86 == 0) == (v85 != 0))
                                                                                                                {
                                                                                                                  v14 = 0;
                                                                                                                  v15 = 0;
                                                                                                                  v16 = 0;
                                                                                                                  v17 = 0;
                                                                                                                  v247 = 1;
                                                                                                                  v245 = 1;
                                                                                                                  HIDWORD(v242[2]) = 0;
                                                                                                                  v13 = 1;
                                                                                                                  LODWORD(v242[1]) = 1;
                                                                                                                  *(_QWORD *)((char *)&v242[1] + 4) = 0x100000001;
                                                                                                                  v242[0] = 0x100000001;
                                                                                                                  v241 = 0x100000001;
                                                                                                                  v237 = 1;
                                                                                                                  v238 = 1;
                                                                                                                  v232 = 1;
                                                                                                                  v234 = 1;
                                                                                                                  v228 = 1;
                                                                                                                  v227 = 1;
                                                                                                                  v224 = 1;
                                                                                                                  v226 = 1;
                                                                                                                  v223 = 0x100000001;
                                                                                                                  v219 = 1;
                                                                                                                  v221 = 1;
                                                                                                                  v218 = 0x100000001;
                                                                                                                  v211 = 1;
                                                                                                                  v214 = 1;
                                                                                                                  v212 = 1;
                                                                                                                  v217 = 1;
                                                                                                                  v209 = 1;
                                                                                                                  v216 = 1;
                                                                                                                  v208 = 1;
                                                                                                                  v213 = 1;
                                                                                                                  v207 = 1;
                                                                                                                  v210 = 1;
                                                                                                                  v215 = 0x100000001;
                                                                                                                  v220 = 1;
                                                                                                                  v222 = 1;
                                                                                                                  v225 = 1;
                                                                                                                  v230 = 1;
                                                                                                                  v229 = 1;
                                                                                                                  v231 = 1;
                                                                                                                  v233 = 1;
                                                                                                                  v235 = 1;
                                                                                                                  v236 = 1;
                                                                                                                  v239 = 1;
                                                                                                                  v240 = 1;
                                                                                                                }
                                                                                                                else
                                                                                                                {
                                                                                                                  -[SFRichTitleCardSection richSubtitle](self, "richSubtitle");
                                                                                                                  v79 = objc_claimAutoreleasedReturnValue();
                                                                                                                  HIDWORD(v242[2]) = v79 != 0;
                                                                                                                  v84 = (void *)v79;
                                                                                                                  if (!v79 || (-[SFRichTitleCardSection richSubtitle](self, "richSubtitle"), v80 = (void *)objc_claimAutoreleasedReturnValue(), -[SFRichTitleCardSection richSubtitle](v7, "richSubtitle"), v89 = v80, v87 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v80, "isEqual:")))
                                                                                                                  {
                                                                                                                    v81 = -[SFRichTitleCardSection subtitleIsEmphasized](self, "subtitleIsEmphasized");
                                                                                                                    if (v81 == -[SFRichTitleCardSection subtitleIsEmphasized](v7, "subtitleIsEmphasized"))
                                                                                                                    {
                                                                                                                      -[SFRichTitleCardSection buttonItems](self, "buttonItems");
                                                                                                                      v9 = objc_claimAutoreleasedReturnValue();
                                                                                                                      -[SFRichTitleCardSection buttonItems](v7, "buttonItems");
                                                                                                                      v10 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                      if ((v9 == 0) == (v10 != 0))
                                                                                                                      {
                                                                                                                        v15 = 0;
                                                                                                                        v16 = 0;
                                                                                                                        v17 = 0;
                                                                                                                        v247 = 1;
                                                                                                                        v245 = 1;
                                                                                                                        LODWORD(v242[2]) = 1;
                                                                                                                        v13 = 1;
                                                                                                                        v242[1] = 0x100000001;
                                                                                                                        v242[0] = 0x100000001;
                                                                                                                        v241 = 0x100000001;
                                                                                                                        v237 = 1;
                                                                                                                        v238 = 1;
                                                                                                                        v232 = 1;
                                                                                                                        v234 = 1;
                                                                                                                        v228 = 1;
                                                                                                                        v227 = 1;
                                                                                                                        v224 = 1;
                                                                                                                        v226 = 1;
                                                                                                                        v223 = 0x100000001;
                                                                                                                        v219 = 1;
                                                                                                                        v221 = 1;
                                                                                                                        v218 = 0x100000001;
                                                                                                                        v211 = 1;
                                                                                                                        v214 = 1;
                                                                                                                        v212 = 1;
                                                                                                                        v217 = 1;
                                                                                                                        v209 = 1;
                                                                                                                        v216 = 1;
                                                                                                                        v208 = 1;
                                                                                                                        v213 = 1;
                                                                                                                        v207 = 1;
                                                                                                                        v210 = 1;
                                                                                                                        v215 = 0x100000001;
                                                                                                                        v220 = 1;
                                                                                                                        v222 = 1;
                                                                                                                        v225 = 1;
                                                                                                                        v230 = 1;
                                                                                                                        v229 = 1;
                                                                                                                        v231 = 1;
                                                                                                                        v233 = 1;
                                                                                                                        v235 = 1;
                                                                                                                        v236 = 1;
                                                                                                                        v239 = 1;
                                                                                                                        v240 = 0x100000001;
                                                                                                                        v14 = 1;
                                                                                                                      }
                                                                                                                      else
                                                                                                                      {
                                                                                                                        -[SFRichTitleCardSection buttonItems](self, "buttonItems");
                                                                                                                        v83 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                        if (v83)
                                                                                                                        {
                                                                                                                          -[SFRichTitleCardSection buttonItems](self, "buttonItems");
                                                                                                                          v3 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                          -[SFRichTitleCardSection buttonItems](v7, "buttonItems");
                                                                                                                          v4 = objc_claimAutoreleasedReturnValue();
                                                                                                                          v17 = objc_msgSend(v3, "isEqual:", v4);
                                                                                                                          v16 = 1;
                                                                                                                          v247 = 1;
                                                                                                                          v245 = 1;
                                                                                                                          LODWORD(v242[2]) = 1;
                                                                                                                          v13 = 1;
                                                                                                                          v242[1] = 0x100000001;
                                                                                                                          v242[0] = 0x100000001;
                                                                                                                          v241 = 0x100000001;
                                                                                                                          v237 = 1;
                                                                                                                          v238 = 1;
                                                                                                                          v232 = 1;
                                                                                                                          v234 = 1;
                                                                                                                          v228 = 1;
                                                                                                                          v227 = 1;
                                                                                                                          v224 = 1;
                                                                                                                          v226 = 1;
                                                                                                                          v223 = 0x100000001;
                                                                                                                          v219 = 1;
                                                                                                                          v221 = 1;
                                                                                                                          v218 = 0x100000001;
                                                                                                                          v211 = 1;
                                                                                                                          v214 = 1;
                                                                                                                          v212 = 1;
                                                                                                                          v217 = 1;
                                                                                                                          v209 = 1;
                                                                                                                          v216 = 1;
                                                                                                                          v208 = 1;
                                                                                                                          v213 = 1;
                                                                                                                          v207 = 1;
                                                                                                                          v210 = 1;
                                                                                                                          v215 = 0x100000001;
                                                                                                                          v220 = 1;
                                                                                                                          v222 = 1;
                                                                                                                          v225 = 1;
                                                                                                                          v230 = 1;
                                                                                                                          v229 = 1;
                                                                                                                          v231 = 1;
                                                                                                                          v233 = 1;
                                                                                                                          v235 = 1;
                                                                                                                          v236 = 1;
                                                                                                                          v239 = 1;
                                                                                                                          v240 = 0x100000001;
                                                                                                                          v14 = 1;
                                                                                                                          v15 = 1;
                                                                                                                        }
                                                                                                                        else
                                                                                                                        {
                                                                                                                          v83 = 0;
                                                                                                                          v16 = 0;
                                                                                                                          v247 = 1;
                                                                                                                          v245 = 1;
                                                                                                                          LODWORD(v242[2]) = 1;
                                                                                                                          v13 = 1;
                                                                                                                          v242[1] = 0x100000001;
                                                                                                                          v242[0] = 0x100000001;
                                                                                                                          v241 = 0x100000001;
                                                                                                                          v237 = 1;
                                                                                                                          v238 = 1;
                                                                                                                          v232 = 1;
                                                                                                                          v234 = 1;
                                                                                                                          v228 = 1;
                                                                                                                          v227 = 1;
                                                                                                                          v224 = 1;
                                                                                                                          v226 = 1;
                                                                                                                          v223 = 0x100000001;
                                                                                                                          v219 = 1;
                                                                                                                          v221 = 1;
                                                                                                                          v218 = 0x100000001;
                                                                                                                          v211 = 1;
                                                                                                                          v214 = 1;
                                                                                                                          v212 = 1;
                                                                                                                          v217 = 1;
                                                                                                                          v209 = 1;
                                                                                                                          v216 = 1;
                                                                                                                          v208 = 1;
                                                                                                                          v213 = 1;
                                                                                                                          v207 = 1;
                                                                                                                          v210 = 1;
                                                                                                                          v215 = 0x100000001;
                                                                                                                          v220 = 1;
                                                                                                                          v222 = 1;
                                                                                                                          v225 = 1;
                                                                                                                          v230 = 1;
                                                                                                                          v229 = 1;
                                                                                                                          v231 = 1;
                                                                                                                          v233 = 1;
                                                                                                                          v235 = 1;
                                                                                                                          v236 = 1;
                                                                                                                          v239 = 1;
                                                                                                                          v240 = 0x100000001;
                                                                                                                          v14 = 1;
                                                                                                                          v15 = 1;
                                                                                                                          v17 = 1;
                                                                                                                        }
                                                                                                                      }
                                                                                                                    }
                                                                                                                    else
                                                                                                                    {
                                                                                                                      v14 = 0;
                                                                                                                      v15 = 0;
                                                                                                                      v16 = 0;
                                                                                                                      v17 = 0;
                                                                                                                      v247 = 1;
                                                                                                                      v245 = 1;
                                                                                                                      LODWORD(v242[2]) = 1;
                                                                                                                      v13 = 1;
                                                                                                                      v242[1] = 0x100000001;
                                                                                                                      v242[0] = 0x100000001;
                                                                                                                      v241 = 0x100000001;
                                                                                                                      v237 = 1;
                                                                                                                      v238 = 1;
                                                                                                                      v232 = 1;
                                                                                                                      v234 = 1;
                                                                                                                      v228 = 1;
                                                                                                                      v227 = 1;
                                                                                                                      v224 = 1;
                                                                                                                      v226 = 1;
                                                                                                                      v223 = 0x100000001;
                                                                                                                      v219 = 1;
                                                                                                                      v221 = 1;
                                                                                                                      v218 = 0x100000001;
                                                                                                                      v211 = 1;
                                                                                                                      v214 = 1;
                                                                                                                      v212 = 1;
                                                                                                                      v217 = 1;
                                                                                                                      v209 = 1;
                                                                                                                      v216 = 1;
                                                                                                                      v208 = 1;
                                                                                                                      v213 = 1;
                                                                                                                      v207 = 1;
                                                                                                                      v210 = 1;
                                                                                                                      v215 = 0x100000001;
                                                                                                                      v220 = 1;
                                                                                                                      v222 = 1;
                                                                                                                      v225 = 1;
                                                                                                                      v230 = 1;
                                                                                                                      v229 = 1;
                                                                                                                      v231 = 1;
                                                                                                                      v233 = 1;
                                                                                                                      v235 = 1;
                                                                                                                      v236 = 1;
                                                                                                                      v239 = 1;
                                                                                                                      v240 = 0x100000001;
                                                                                                                    }
                                                                                                                  }
                                                                                                                  else
                                                                                                                  {
                                                                                                                    v14 = 0;
                                                                                                                    v15 = 0;
                                                                                                                    v16 = 0;
                                                                                                                    v17 = 0;
                                                                                                                    v247 = 1;
                                                                                                                    v245 = 1;
                                                                                                                    v242[2] = 0x100000001;
                                                                                                                    v13 = 1;
                                                                                                                    v242[1] = 0x100000001;
                                                                                                                    v242[0] = 0x100000001;
                                                                                                                    v241 = 0x100000001;
                                                                                                                    v237 = 1;
                                                                                                                    v238 = 1;
                                                                                                                    v232 = 1;
                                                                                                                    v234 = 1;
                                                                                                                    v228 = 1;
                                                                                                                    v227 = 1;
                                                                                                                    v224 = 1;
                                                                                                                    v226 = 1;
                                                                                                                    v223 = 0x100000001;
                                                                                                                    v219 = 1;
                                                                                                                    v221 = 1;
                                                                                                                    v218 = 0x100000001;
                                                                                                                    v211 = 1;
                                                                                                                    v214 = 1;
                                                                                                                    v212 = 1;
                                                                                                                    v217 = 1;
                                                                                                                    v209 = 1;
                                                                                                                    v216 = 1;
                                                                                                                    v208 = 1;
                                                                                                                    v213 = 1;
                                                                                                                    v207 = 1;
                                                                                                                    v210 = 1;
                                                                                                                    v215 = 0x100000001;
                                                                                                                    v220 = 1;
                                                                                                                    v222 = 1;
                                                                                                                    v225 = 1;
                                                                                                                    v230 = 1;
                                                                                                                    v229 = 1;
                                                                                                                    v231 = 1;
                                                                                                                    v233 = 1;
                                                                                                                    v235 = 1;
                                                                                                                    v236 = 1;
                                                                                                                    v239 = 1;
                                                                                                                    v240 = 0x100000001;
                                                                                                                  }
                                                                                                                }
                                                                                                              }
                                                                                                              else
                                                                                                              {
                                                                                                                v240 = 0;
                                                                                                                v14 = 0;
                                                                                                                v15 = 0;
                                                                                                                v16 = 0;
                                                                                                                v17 = 0;
                                                                                                                v247 = 1;
                                                                                                                v245 = 1;
                                                                                                                v242[2] = 1;
                                                                                                                v13 = 1;
                                                                                                                v242[1] = 0x100000001;
                                                                                                                v242[0] = 0x100000001;
                                                                                                                v241 = 0x100000001;
                                                                                                                v237 = 1;
                                                                                                                v238 = 1;
                                                                                                                v232 = 1;
                                                                                                                v234 = 1;
                                                                                                                v228 = 1;
                                                                                                                v227 = 1;
                                                                                                                v224 = 1;
                                                                                                                v226 = 1;
                                                                                                                v223 = 0x100000001;
                                                                                                                v219 = 1;
                                                                                                                v221 = 1;
                                                                                                                v218 = 0x100000001;
                                                                                                                v211 = 1;
                                                                                                                v214 = 1;
                                                                                                                v212 = 1;
                                                                                                                v217 = 1;
                                                                                                                v209 = 1;
                                                                                                                v216 = 1;
                                                                                                                v208 = 1;
                                                                                                                v213 = 1;
                                                                                                                v207 = 1;
                                                                                                                v210 = 1;
                                                                                                                v215 = 0x100000001;
                                                                                                                v220 = 1;
                                                                                                                v222 = 1;
                                                                                                                v225 = 1;
                                                                                                                v230 = 1;
                                                                                                                v229 = 1;
                                                                                                                v231 = 1;
                                                                                                                v233 = 1;
                                                                                                                v235 = 1;
                                                                                                                v236 = 1;
                                                                                                                v239 = 1;
                                                                                                                v243 = 1;
                                                                                                              }
                                                                                                            }
                                                                                                          }
                                                                                                          else
                                                                                                          {
                                                                                                            v236 = 0;
                                                                                                            v239 = 0;
                                                                                                            v243 = 0;
                                                                                                            v240 = 0;
                                                                                                            v14 = 0;
                                                                                                            v15 = 0;
                                                                                                            v16 = 0;
                                                                                                            v17 = 0;
                                                                                                            v247 = 1;
                                                                                                            v245 = 1;
                                                                                                            v242[2] = 1;
                                                                                                            v13 = 1;
                                                                                                            v242[1] = 0x100000001;
                                                                                                            v242[0] = 0x100000001;
                                                                                                            v241 = 0x100000001;
                                                                                                            v237 = 1;
                                                                                                            v238 = 1;
                                                                                                            v232 = 1;
                                                                                                            v234 = 1;
                                                                                                            v228 = 1;
                                                                                                            v227 = 1;
                                                                                                            v224 = 1;
                                                                                                            v226 = 1;
                                                                                                            v223 = 0x100000001;
                                                                                                            v219 = 1;
                                                                                                            v221 = 1;
                                                                                                            v218 = 0x100000001;
                                                                                                            v211 = 1;
                                                                                                            v214 = 1;
                                                                                                            v212 = 1;
                                                                                                            v217 = 1;
                                                                                                            v209 = 1;
                                                                                                            v216 = 1;
                                                                                                            v208 = 1;
                                                                                                            v213 = 1;
                                                                                                            v207 = 1;
                                                                                                            v210 = 1;
                                                                                                            v215 = 0x100000001;
                                                                                                            v220 = 1;
                                                                                                            v222 = 1;
                                                                                                            v225 = 1;
                                                                                                            v230 = 1;
                                                                                                            v229 = 1;
                                                                                                            v231 = 1;
                                                                                                            v233 = 1;
                                                                                                            v235 = 1;
                                                                                                            v244 = 1;
                                                                                                          }
                                                                                                        }
                                                                                                      }
                                                                                                      else
                                                                                                      {
                                                                                                        v233 = 0;
                                                                                                        v235 = 0;
                                                                                                        v244 = 0;
                                                                                                        v236 = 0;
                                                                                                        v239 = 0;
                                                                                                        v243 = 0;
                                                                                                        v240 = 0;
                                                                                                        v14 = 0;
                                                                                                        v15 = 0;
                                                                                                        v16 = 0;
                                                                                                        v17 = 0;
                                                                                                        v247 = 1;
                                                                                                        v245 = 1;
                                                                                                        v242[2] = 1;
                                                                                                        v13 = 1;
                                                                                                        v242[1] = 0x100000001;
                                                                                                        v242[0] = 0x100000001;
                                                                                                        v241 = 0x100000001;
                                                                                                        v237 = 1;
                                                                                                        v238 = 1;
                                                                                                        v232 = 1;
                                                                                                        v234 = 1;
                                                                                                        v228 = 1;
                                                                                                        v227 = 1;
                                                                                                        v224 = 1;
                                                                                                        v226 = 1;
                                                                                                        v223 = 0x100000001;
                                                                                                        v219 = 1;
                                                                                                        v221 = 1;
                                                                                                        v218 = 0x100000001;
                                                                                                        v211 = 1;
                                                                                                        v214 = 1;
                                                                                                        v212 = 1;
                                                                                                        v217 = 1;
                                                                                                        v209 = 1;
                                                                                                        v216 = 1;
                                                                                                        v208 = 1;
                                                                                                        v213 = 1;
                                                                                                        v207 = 1;
                                                                                                        v210 = 1;
                                                                                                        v215 = 0x100000001;
                                                                                                        v220 = 1;
                                                                                                        v222 = 1;
                                                                                                        v225 = 1;
                                                                                                        v230 = 1;
                                                                                                        v229 = 1;
                                                                                                        v231 = 1;
                                                                                                      }
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                      v233 = 0;
                                                                                                      v235 = 0;
                                                                                                      v244 = 0;
                                                                                                      v236 = 0;
                                                                                                      v239 = 0;
                                                                                                      v243 = 0;
                                                                                                      v240 = 0;
                                                                                                      v14 = 0;
                                                                                                      v15 = 0;
                                                                                                      v16 = 0;
                                                                                                      v17 = 0;
                                                                                                      v247 = 1;
                                                                                                      v245 = 1;
                                                                                                      v242[2] = 1;
                                                                                                      v13 = 1;
                                                                                                      v242[1] = 0x100000001;
                                                                                                      v242[0] = 0x100000001;
                                                                                                      v241 = 0x100000001;
                                                                                                      v237 = 1;
                                                                                                      v238 = 1;
                                                                                                      v232 = 1;
                                                                                                      v234 = 1;
                                                                                                      v228 = 1;
                                                                                                      v227 = 1;
                                                                                                      v224 = 1;
                                                                                                      v226 = 1;
                                                                                                      v223 = 0x100000001;
                                                                                                      v219 = 1;
                                                                                                      v221 = 1;
                                                                                                      v218 = 0x100000001;
                                                                                                      v211 = 1;
                                                                                                      v214 = 1;
                                                                                                      v212 = 1;
                                                                                                      v217 = 1;
                                                                                                      v209 = 1;
                                                                                                      v216 = 1;
                                                                                                      v208 = 1;
                                                                                                      v213 = 1;
                                                                                                      v207 = 1;
                                                                                                      v210 = 1;
                                                                                                      v215 = 0x100000001;
                                                                                                      v220 = 1;
                                                                                                      v222 = 1;
                                                                                                      v225 = 1;
                                                                                                      v230 = 1;
                                                                                                      v229 = 1;
                                                                                                      v231 = 1;
                                                                                                      v246 = 1;
                                                                                                    }
                                                                                                  }
                                                                                                }
                                                                                                else
                                                                                                {
                                                                                                  v229 = 0;
                                                                                                  v231 = 0;
                                                                                                  v246 = 0;
                                                                                                  v233 = 0;
                                                                                                  v235 = 0;
                                                                                                  v244 = 0;
                                                                                                  v236 = 0;
                                                                                                  v239 = 0;
                                                                                                  v243 = 0;
                                                                                                  v240 = 0;
                                                                                                  v14 = 0;
                                                                                                  v15 = 0;
                                                                                                  v16 = 0;
                                                                                                  v17 = 0;
                                                                                                  v247 = 1;
                                                                                                  v245 = 1;
                                                                                                  v242[2] = 1;
                                                                                                  v13 = 1;
                                                                                                  v242[1] = 0x100000001;
                                                                                                  v242[0] = 0x100000001;
                                                                                                  v241 = 0x100000001;
                                                                                                  v237 = 1;
                                                                                                  v238 = 1;
                                                                                                  v232 = 1;
                                                                                                  v234 = 1;
                                                                                                  v228 = 1;
                                                                                                  v227 = 1;
                                                                                                  v224 = 1;
                                                                                                  v226 = 1;
                                                                                                  v223 = 0x100000001;
                                                                                                  v219 = 1;
                                                                                                  v221 = 1;
                                                                                                  v218 = 0x100000001;
                                                                                                  v211 = 1;
                                                                                                  v214 = 1;
                                                                                                  v212 = 1;
                                                                                                  v217 = 1;
                                                                                                  v209 = 1;
                                                                                                  v216 = 1;
                                                                                                  v208 = 1;
                                                                                                  v213 = 1;
                                                                                                  v207 = 1;
                                                                                                  v210 = 1;
                                                                                                  v215 = 0x100000001;
                                                                                                  v220 = 1;
                                                                                                  v222 = 1;
                                                                                                  v225 = 1;
                                                                                                  v230 = 1;
                                                                                                  v248 = 1;
                                                                                                }
                                                                                              }
                                                                                            }
                                                                                            else
                                                                                            {
                                                                                              v225 = 0;
                                                                                              v230 = 0;
                                                                                              v248 = 0;
                                                                                              v229 = 0;
                                                                                              v231 = 0;
                                                                                              v246 = 0;
                                                                                              v233 = 0;
                                                                                              v235 = 0;
                                                                                              v244 = 0;
                                                                                              v236 = 0;
                                                                                              v239 = 0;
                                                                                              v243 = 0;
                                                                                              v240 = 0;
                                                                                              v14 = 0;
                                                                                              v15 = 0;
                                                                                              v16 = 0;
                                                                                              v17 = 0;
                                                                                              v247 = 1;
                                                                                              v245 = 1;
                                                                                              v242[2] = 1;
                                                                                              v13 = 1;
                                                                                              v242[1] = 0x100000001;
                                                                                              v242[0] = 0x100000001;
                                                                                              v241 = 0x100000001;
                                                                                              v237 = 1;
                                                                                              v238 = 1;
                                                                                              v232 = 1;
                                                                                              v234 = 1;
                                                                                              v228 = 1;
                                                                                              v227 = 1;
                                                                                              v224 = 1;
                                                                                              v226 = 1;
                                                                                              v223 = 0x100000001;
                                                                                              v219 = 1;
                                                                                              v221 = 1;
                                                                                              v218 = 0x100000001;
                                                                                              v211 = 1;
                                                                                              v214 = 1;
                                                                                              v212 = 1;
                                                                                              v217 = 1;
                                                                                              v209 = 1;
                                                                                              v216 = 1;
                                                                                              v208 = 1;
                                                                                              v213 = 1;
                                                                                              v207 = 1;
                                                                                              v210 = 1;
                                                                                              v215 = 0x100000001;
                                                                                              v220 = 1;
                                                                                              v222 = 1;
                                                                                            }
                                                                                          }
                                                                                          else
                                                                                          {
                                                                                            v225 = 0;
                                                                                            v230 = 0;
                                                                                            v248 = 0;
                                                                                            v229 = 0;
                                                                                            v231 = 0;
                                                                                            v246 = 0;
                                                                                            v233 = 0;
                                                                                            v235 = 0;
                                                                                            v244 = 0;
                                                                                            v236 = 0;
                                                                                            v239 = 0;
                                                                                            v243 = 0;
                                                                                            v240 = 0;
                                                                                            v14 = 0;
                                                                                            v15 = 0;
                                                                                            v16 = 0;
                                                                                            v17 = 0;
                                                                                            v247 = 1;
                                                                                            v245 = 1;
                                                                                            v242[2] = 1;
                                                                                            v13 = 1;
                                                                                            v242[1] = 0x100000001;
                                                                                            v242[0] = 0x100000001;
                                                                                            v241 = 0x100000001;
                                                                                            v237 = 1;
                                                                                            v238 = 1;
                                                                                            v232 = 1;
                                                                                            v234 = 1;
                                                                                            v228 = 1;
                                                                                            v227 = 1;
                                                                                            v224 = 1;
                                                                                            v226 = 1;
                                                                                            v223 = 0x100000001;
                                                                                            v219 = 1;
                                                                                            v221 = 1;
                                                                                            v218 = 0x100000001;
                                                                                            v211 = 1;
                                                                                            v214 = 1;
                                                                                            v212 = 1;
                                                                                            v217 = 1;
                                                                                            v209 = 1;
                                                                                            v216 = 1;
                                                                                            v208 = 1;
                                                                                            v213 = 1;
                                                                                            v207 = 1;
                                                                                            v210 = 1;
                                                                                            v215 = 0x100000001;
                                                                                            v220 = 1;
                                                                                            v222 = 1;
                                                                                            v249 = 1;
                                                                                          }
                                                                                        }
                                                                                      }
                                                                                      else
                                                                                      {
                                                                                        v220 = 0;
                                                                                        v222 = 0;
                                                                                        v249 = 0;
                                                                                        v225 = 0;
                                                                                        v230 = 0;
                                                                                        v248 = 0;
                                                                                        v229 = 0;
                                                                                        v231 = 0;
                                                                                        v246 = 0;
                                                                                        v233 = 0;
                                                                                        v235 = 0;
                                                                                        v244 = 0;
                                                                                        v236 = 0;
                                                                                        v239 = 0;
                                                                                        v243 = 0;
                                                                                        v240 = 0;
                                                                                        v14 = 0;
                                                                                        v15 = 0;
                                                                                        v16 = 0;
                                                                                        v17 = 0;
                                                                                        v247 = 1;
                                                                                        v245 = 1;
                                                                                        v242[2] = 1;
                                                                                        v13 = 1;
                                                                                        v242[1] = 0x100000001;
                                                                                        v242[0] = 0x100000001;
                                                                                        v241 = 0x100000001;
                                                                                        v237 = 1;
                                                                                        v238 = 1;
                                                                                        v232 = 1;
                                                                                        v234 = 1;
                                                                                        v228 = 1;
                                                                                        v227 = 1;
                                                                                        v224 = 1;
                                                                                        v226 = 1;
                                                                                        v223 = 0x100000001;
                                                                                        v219 = 1;
                                                                                        v221 = 1;
                                                                                        v218 = 0x100000001;
                                                                                        v211 = 1;
                                                                                        v214 = 1;
                                                                                        v212 = 1;
                                                                                        v217 = 1;
                                                                                        v209 = 1;
                                                                                        v216 = 1;
                                                                                        v208 = 1;
                                                                                        v213 = 1;
                                                                                        v207 = 1;
                                                                                        v210 = 1;
                                                                                        v215 = 0x100000001;
                                                                                      }
                                                                                    }
                                                                                    else
                                                                                    {
                                                                                      v220 = 0;
                                                                                      v222 = 0;
                                                                                      v249 = 0;
                                                                                      v225 = 0;
                                                                                      v230 = 0;
                                                                                      v248 = 0;
                                                                                      v229 = 0;
                                                                                      v231 = 0;
                                                                                      v246 = 0;
                                                                                      v233 = 0;
                                                                                      v235 = 0;
                                                                                      v244 = 0;
                                                                                      v236 = 0;
                                                                                      v239 = 0;
                                                                                      v243 = 0;
                                                                                      v240 = 0;
                                                                                      v14 = 0;
                                                                                      v15 = 0;
                                                                                      v16 = 0;
                                                                                      v17 = 0;
                                                                                      v247 = 1;
                                                                                      v245 = 1;
                                                                                      v242[2] = 1;
                                                                                      v13 = 1;
                                                                                      v242[1] = 0x100000001;
                                                                                      v242[0] = 0x100000001;
                                                                                      v241 = 0x100000001;
                                                                                      v237 = 1;
                                                                                      v238 = 1;
                                                                                      v232 = 1;
                                                                                      v234 = 1;
                                                                                      v228 = 1;
                                                                                      v227 = 1;
                                                                                      v224 = 1;
                                                                                      v226 = 1;
                                                                                      v223 = 0x100000001;
                                                                                      v219 = 1;
                                                                                      v221 = 1;
                                                                                      v218 = 0x100000001;
                                                                                      v211 = 1;
                                                                                      v214 = 1;
                                                                                      v212 = 1;
                                                                                      v217 = 1;
                                                                                      v209 = 1;
                                                                                      v216 = 1;
                                                                                      v208 = 1;
                                                                                      v213 = 1;
                                                                                      v207 = 1;
                                                                                      v210 = 1;
                                                                                      v215 = 0x100000001;
                                                                                      v250 = 1;
                                                                                    }
                                                                                  }
                                                                                }
                                                                                else
                                                                                {
                                                                                  v215 = 0;
                                                                                  v250 = 0;
                                                                                  v220 = 0;
                                                                                  v222 = 0;
                                                                                  v249 = 0;
                                                                                  v225 = 0;
                                                                                  v230 = 0;
                                                                                  v248 = 0;
                                                                                  v229 = 0;
                                                                                  v231 = 0;
                                                                                  v246 = 0;
                                                                                  v233 = 0;
                                                                                  v235 = 0;
                                                                                  v244 = 0;
                                                                                  v236 = 0;
                                                                                  v239 = 0;
                                                                                  v243 = 0;
                                                                                  v240 = 0;
                                                                                  v14 = 0;
                                                                                  v15 = 0;
                                                                                  v16 = 0;
                                                                                  v17 = 0;
                                                                                  v247 = 1;
                                                                                  v245 = 1;
                                                                                  v242[2] = 1;
                                                                                  v13 = 1;
                                                                                  v242[1] = 0x100000001;
                                                                                  v242[0] = 0x100000001;
                                                                                  v241 = 0x100000001;
                                                                                  v237 = 1;
                                                                                  v238 = 1;
                                                                                  v232 = 1;
                                                                                  v234 = 1;
                                                                                  v228 = 1;
                                                                                  v227 = 1;
                                                                                  v224 = 1;
                                                                                  v226 = 1;
                                                                                  v223 = 0x100000001;
                                                                                  v219 = 1;
                                                                                  v221 = 1;
                                                                                  v218 = 0x100000001;
                                                                                  v211 = 1;
                                                                                  v214 = 1;
                                                                                  v212 = 1;
                                                                                  v217 = 1;
                                                                                  v209 = 1;
                                                                                  v216 = 1;
                                                                                  v208 = 1;
                                                                                  v213 = 1;
                                                                                  v207 = 1;
                                                                                  v210 = 1;
                                                                                }
                                                                              }
                                                                              else
                                                                              {
                                                                                v215 = 0;
                                                                                v250 = 0;
                                                                                v220 = 0;
                                                                                v222 = 0;
                                                                                v249 = 0;
                                                                                v225 = 0;
                                                                                v230 = 0;
                                                                                v248 = 0;
                                                                                v229 = 0;
                                                                                v231 = 0;
                                                                                v246 = 0;
                                                                                v233 = 0;
                                                                                v235 = 0;
                                                                                v244 = 0;
                                                                                v236 = 0;
                                                                                v239 = 0;
                                                                                v243 = 0;
                                                                                v240 = 0;
                                                                                v14 = 0;
                                                                                v15 = 0;
                                                                                v16 = 0;
                                                                                v17 = 0;
                                                                                v247 = 1;
                                                                                v245 = 1;
                                                                                v242[2] = 1;
                                                                                v13 = 1;
                                                                                v242[1] = 0x100000001;
                                                                                v242[0] = 0x100000001;
                                                                                v241 = 0x100000001;
                                                                                v237 = 1;
                                                                                v238 = 1;
                                                                                v232 = 1;
                                                                                v234 = 1;
                                                                                v228 = 1;
                                                                                v227 = 1;
                                                                                v224 = 1;
                                                                                v226 = 1;
                                                                                v223 = 0x100000001;
                                                                                v219 = 1;
                                                                                v221 = 1;
                                                                                v218 = 0x100000001;
                                                                                v211 = 1;
                                                                                v214 = 1;
                                                                                v212 = 1;
                                                                                v217 = 1;
                                                                                v209 = 1;
                                                                                v216 = 1;
                                                                                v208 = 1;
                                                                                v213 = 1;
                                                                                v207 = 1;
                                                                                v210 = 1;
                                                                                v251 = 1;
                                                                              }
                                                                            }
                                                                          }
                                                                          else
                                                                          {
                                                                            v207 = 0;
                                                                            v210 = 0;
                                                                            v251 = 0;
                                                                            v215 = 0;
                                                                            v250 = 0;
                                                                            v220 = 0;
                                                                            v222 = 0;
                                                                            v249 = 0;
                                                                            v225 = 0;
                                                                            v230 = 0;
                                                                            v248 = 0;
                                                                            v229 = 0;
                                                                            v231 = 0;
                                                                            v246 = 0;
                                                                            v233 = 0;
                                                                            v235 = 0;
                                                                            v244 = 0;
                                                                            v236 = 0;
                                                                            v239 = 0;
                                                                            v243 = 0;
                                                                            v240 = 0;
                                                                            v14 = 0;
                                                                            v15 = 0;
                                                                            v16 = 0;
                                                                            v17 = 0;
                                                                            v247 = 1;
                                                                            v245 = 1;
                                                                            v242[2] = 1;
                                                                            v13 = 1;
                                                                            v242[1] = 0x100000001;
                                                                            v242[0] = 0x100000001;
                                                                            v241 = 0x100000001;
                                                                            v237 = 1;
                                                                            v238 = 1;
                                                                            v232 = 1;
                                                                            v234 = 1;
                                                                            v228 = 1;
                                                                            v227 = 1;
                                                                            v224 = 1;
                                                                            v226 = 1;
                                                                            v223 = 0x100000001;
                                                                            v219 = 1;
                                                                            v221 = 1;
                                                                            v218 = 0x100000001;
                                                                            v211 = 1;
                                                                            v214 = 1;
                                                                            v212 = 1;
                                                                            v217 = 1;
                                                                            v209 = 1;
                                                                            v216 = 1;
                                                                            v208 = 1;
                                                                            v213 = 1;
                                                                            v252 = 1;
                                                                          }
                                                                        }
                                                                      }
                                                                      else
                                                                      {
                                                                        v208 = 0;
                                                                        v213 = 0;
                                                                        v252 = 0;
                                                                        v207 = 0;
                                                                        v210 = 0;
                                                                        v251 = 0;
                                                                        v215 = 0;
                                                                        v250 = 0;
                                                                        v220 = 0;
                                                                        v222 = 0;
                                                                        v249 = 0;
                                                                        v225 = 0;
                                                                        v230 = 0;
                                                                        v248 = 0;
                                                                        v229 = 0;
                                                                        v231 = 0;
                                                                        v246 = 0;
                                                                        v233 = 0;
                                                                        v235 = 0;
                                                                        v244 = 0;
                                                                        v236 = 0;
                                                                        v239 = 0;
                                                                        v243 = 0;
                                                                        v240 = 0;
                                                                        v14 = 0;
                                                                        v15 = 0;
                                                                        v16 = 0;
                                                                        v17 = 0;
                                                                        v247 = 1;
                                                                        v245 = 1;
                                                                        v242[2] = 1;
                                                                        v13 = 1;
                                                                        v242[1] = 0x100000001;
                                                                        v242[0] = 0x100000001;
                                                                        v241 = 0x100000001;
                                                                        v237 = 1;
                                                                        v238 = 1;
                                                                        v232 = 1;
                                                                        v234 = 1;
                                                                        v228 = 1;
                                                                        v227 = 1;
                                                                        v224 = 1;
                                                                        v226 = 1;
                                                                        v223 = 0x100000001;
                                                                        v219 = 1;
                                                                        v221 = 1;
                                                                        v218 = 0x100000001;
                                                                        v211 = 1;
                                                                        v214 = 1;
                                                                        v212 = 1;
                                                                        v217 = 1;
                                                                        v209 = 1;
                                                                        v216 = 1;
                                                                        v253 = 1;
                                                                      }
                                                                    }
                                                                  }
                                                                  else
                                                                  {
                                                                    v209 = 0;
                                                                    v216 = 0;
                                                                    v253 = 0;
                                                                    v208 = 0;
                                                                    v213 = 0;
                                                                    v252 = 0;
                                                                    v207 = 0;
                                                                    v210 = 0;
                                                                    v251 = 0;
                                                                    v215 = 0;
                                                                    v250 = 0;
                                                                    v220 = 0;
                                                                    v222 = 0;
                                                                    v249 = 0;
                                                                    v225 = 0;
                                                                    v230 = 0;
                                                                    v248 = 0;
                                                                    v229 = 0;
                                                                    v231 = 0;
                                                                    v246 = 0;
                                                                    v233 = 0;
                                                                    v235 = 0;
                                                                    v244 = 0;
                                                                    v236 = 0;
                                                                    v239 = 0;
                                                                    v243 = 0;
                                                                    v240 = 0;
                                                                    v14 = 0;
                                                                    v15 = 0;
                                                                    v16 = 0;
                                                                    v17 = 0;
                                                                    v247 = 1;
                                                                    v245 = 1;
                                                                    v242[2] = 1;
                                                                    v13 = 1;
                                                                    v242[1] = 0x100000001;
                                                                    v242[0] = 0x100000001;
                                                                    v241 = 0x100000001;
                                                                    v237 = 1;
                                                                    v238 = 1;
                                                                    v232 = 1;
                                                                    v234 = 1;
                                                                    v228 = 1;
                                                                    v227 = 1;
                                                                    v224 = 1;
                                                                    v226 = 1;
                                                                    v223 = 0x100000001;
                                                                    v219 = 1;
                                                                    v221 = 1;
                                                                    v218 = 0x100000001;
                                                                    v211 = 1;
                                                                    v214 = 1;
                                                                    v212 = 1;
                                                                    v217 = 1;
                                                                    v254 = 1;
                                                                  }
                                                                }
                                                              }
                                                              else
                                                              {
                                                                v212 = 0;
                                                                v217 = 0;
                                                                v254 = 0;
                                                                v209 = 0;
                                                                v216 = 0;
                                                                v253 = 0;
                                                                v208 = 0;
                                                                v213 = 0;
                                                                v252 = 0;
                                                                v207 = 0;
                                                                v210 = 0;
                                                                v251 = 0;
                                                                v215 = 0;
                                                                v250 = 0;
                                                                v220 = 0;
                                                                v222 = 0;
                                                                v249 = 0;
                                                                v225 = 0;
                                                                v230 = 0;
                                                                v248 = 0;
                                                                v229 = 0;
                                                                v231 = 0;
                                                                v246 = 0;
                                                                v233 = 0;
                                                                v235 = 0;
                                                                v244 = 0;
                                                                v236 = 0;
                                                                v239 = 0;
                                                                v243 = 0;
                                                                v240 = 0;
                                                                v14 = 0;
                                                                v15 = 0;
                                                                v16 = 0;
                                                                v17 = 0;
                                                                v247 = 1;
                                                                v245 = 1;
                                                                v242[2] = 1;
                                                                v13 = 1;
                                                                v242[1] = 0x100000001;
                                                                v242[0] = 0x100000001;
                                                                v241 = 0x100000001;
                                                                v237 = 1;
                                                                v238 = 1;
                                                                v232 = 1;
                                                                v234 = 1;
                                                                v228 = 1;
                                                                v227 = 1;
                                                                v224 = 1;
                                                                v226 = 1;
                                                                v223 = 0x100000001;
                                                                v219 = 1;
                                                                v221 = 1;
                                                                v218 = 0x100000001;
                                                                v211 = 1;
                                                                v214 = 1;
                                                              }
                                                            }
                                                            else
                                                            {
                                                              v212 = 0;
                                                              v217 = 0;
                                                              v254 = 0;
                                                              v209 = 0;
                                                              v216 = 0;
                                                              v253 = 0;
                                                              v208 = 0;
                                                              v213 = 0;
                                                              v252 = 0;
                                                              v207 = 0;
                                                              v210 = 0;
                                                              v251 = 0;
                                                              v215 = 0;
                                                              v250 = 0;
                                                              v220 = 0;
                                                              v222 = 0;
                                                              v249 = 0;
                                                              v225 = 0;
                                                              v230 = 0;
                                                              v248 = 0;
                                                              v229 = 0;
                                                              v231 = 0;
                                                              v246 = 0;
                                                              v233 = 0;
                                                              v235 = 0;
                                                              v244 = 0;
                                                              v236 = 0;
                                                              v239 = 0;
                                                              v243 = 0;
                                                              v240 = 0;
                                                              v14 = 0;
                                                              v15 = 0;
                                                              v16 = 0;
                                                              v17 = 0;
                                                              v247 = 1;
                                                              v245 = 1;
                                                              v242[2] = 1;
                                                              v13 = 1;
                                                              v242[1] = 0x100000001;
                                                              v242[0] = 0x100000001;
                                                              v241 = 0x100000001;
                                                              v237 = 1;
                                                              v238 = 1;
                                                              v232 = 1;
                                                              v234 = 1;
                                                              v228 = 1;
                                                              v227 = 1;
                                                              v224 = 1;
                                                              v226 = 1;
                                                              v223 = 0x100000001;
                                                              v219 = 1;
                                                              v221 = 1;
                                                              v218 = 0x100000001;
                                                              v211 = 1;
                                                              v214 = 1;
                                                              v255 = 1;
                                                            }
                                                          }
                                                        }
                                                        else
                                                        {
                                                          v211 = 0;
                                                          v214 = 0;
                                                          v255 = 0;
                                                          v212 = 0;
                                                          v217 = 0;
                                                          v254 = 0;
                                                          v209 = 0;
                                                          v216 = 0;
                                                          v253 = 0;
                                                          v208 = 0;
                                                          v213 = 0;
                                                          v252 = 0;
                                                          v207 = 0;
                                                          v210 = 0;
                                                          v251 = 0;
                                                          v215 = 0;
                                                          v250 = 0;
                                                          v220 = 0;
                                                          v222 = 0;
                                                          v249 = 0;
                                                          v225 = 0;
                                                          v230 = 0;
                                                          v248 = 0;
                                                          v229 = 0;
                                                          v231 = 0;
                                                          v246 = 0;
                                                          v233 = 0;
                                                          v235 = 0;
                                                          v244 = 0;
                                                          v236 = 0;
                                                          v239 = 0;
                                                          v243 = 0;
                                                          v240 = 0;
                                                          v14 = 0;
                                                          v15 = 0;
                                                          v16 = 0;
                                                          v17 = 0;
                                                          v247 = 1;
                                                          v245 = 1;
                                                          v242[2] = 1;
                                                          v13 = 1;
                                                          v242[1] = 0x100000001;
                                                          v242[0] = 0x100000001;
                                                          v241 = 0x100000001;
                                                          v237 = 1;
                                                          v238 = 1;
                                                          v232 = 1;
                                                          v234 = 1;
                                                          v228 = 1;
                                                          v227 = 1;
                                                          v224 = 1;
                                                          v226 = 1;
                                                          v223 = 0x100000001;
                                                          v219 = 1;
                                                          v221 = 1;
                                                          v218 = 0x100000001;
                                                          v256 = 1;
                                                        }
                                                      }
                                                    }
                                                    else
                                                    {
                                                      v218 = 0;
                                                      v256 = 0;
                                                      v211 = 0;
                                                      v214 = 0;
                                                      v255 = 0;
                                                      v212 = 0;
                                                      v217 = 0;
                                                      v254 = 0;
                                                      v209 = 0;
                                                      v216 = 0;
                                                      v253 = 0;
                                                      v208 = 0;
                                                      v213 = 0;
                                                      v252 = 0;
                                                      v207 = 0;
                                                      v210 = 0;
                                                      v251 = 0;
                                                      v215 = 0;
                                                      v250 = 0;
                                                      v220 = 0;
                                                      v222 = 0;
                                                      v249 = 0;
                                                      v225 = 0;
                                                      v230 = 0;
                                                      v248 = 0;
                                                      v229 = 0;
                                                      v231 = 0;
                                                      v246 = 0;
                                                      v233 = 0;
                                                      v235 = 0;
                                                      v244 = 0;
                                                      v236 = 0;
                                                      v239 = 0;
                                                      v243 = 0;
                                                      v240 = 0;
                                                      v14 = 0;
                                                      v15 = 0;
                                                      v16 = 0;
                                                      v17 = 0;
                                                      v247 = 1;
                                                      v245 = 1;
                                                      v242[2] = 1;
                                                      v13 = 1;
                                                      v242[1] = 0x100000001;
                                                      v242[0] = 0x100000001;
                                                      v241 = 0x100000001;
                                                      v237 = 1;
                                                      v238 = 1;
                                                      v232 = 1;
                                                      v234 = 1;
                                                      v228 = 1;
                                                      v227 = 1;
                                                      v224 = 1;
                                                      v226 = 1;
                                                      v223 = 0x100000001;
                                                      v219 = 1;
                                                      v221 = 1;
                                                      v257 = 1;
                                                    }
                                                  }
                                                }
                                                else
                                                {
                                                  v219 = 0;
                                                  v221 = 0;
                                                  v257 = 0;
                                                  v218 = 0;
                                                  v256 = 0;
                                                  v211 = 0;
                                                  v214 = 0;
                                                  v255 = 0;
                                                  v212 = 0;
                                                  v217 = 0;
                                                  v254 = 0;
                                                  v209 = 0;
                                                  v216 = 0;
                                                  v253 = 0;
                                                  v208 = 0;
                                                  v213 = 0;
                                                  v252 = 0;
                                                  v207 = 0;
                                                  v210 = 0;
                                                  v251 = 0;
                                                  v215 = 0;
                                                  v250 = 0;
                                                  v220 = 0;
                                                  v222 = 0;
                                                  v249 = 0;
                                                  v225 = 0;
                                                  v230 = 0;
                                                  v248 = 0;
                                                  v229 = 0;
                                                  v231 = 0;
                                                  v246 = 0;
                                                  v233 = 0;
                                                  v235 = 0;
                                                  v244 = 0;
                                                  v236 = 0;
                                                  v239 = 0;
                                                  v243 = 0;
                                                  v240 = 0;
                                                  v14 = 0;
                                                  v15 = 0;
                                                  v16 = 0;
                                                  v17 = 0;
                                                  v247 = 1;
                                                  v245 = 1;
                                                  v242[2] = 1;
                                                  v13 = 1;
                                                  v242[1] = 0x100000001;
                                                  v242[0] = 0x100000001;
                                                  v241 = 0x100000001;
                                                  v237 = 1;
                                                  v238 = 1;
                                                  v232 = 1;
                                                  v234 = 1;
                                                  v228 = 1;
                                                  v227 = 1;
                                                  v224 = 1;
                                                  v226 = 1;
                                                  v223 = 0x100000001;
                                                  v263 = 1;
                                                }
                                              }
                                            }
                                            else
                                            {
                                              v223 = 0;
                                              v263 = 0;
                                              v219 = 0;
                                              v221 = 0;
                                              v257 = 0;
                                              v218 = 0;
                                              v256 = 0;
                                              v211 = 0;
                                              v214 = 0;
                                              v255 = 0;
                                              v212 = 0;
                                              v217 = 0;
                                              v254 = 0;
                                              v209 = 0;
                                              v216 = 0;
                                              v253 = 0;
                                              v208 = 0;
                                              v213 = 0;
                                              v252 = 0;
                                              v207 = 0;
                                              v210 = 0;
                                              v251 = 0;
                                              v215 = 0;
                                              v250 = 0;
                                              v220 = 0;
                                              v222 = 0;
                                              v249 = 0;
                                              v225 = 0;
                                              v230 = 0;
                                              v248 = 0;
                                              v229 = 0;
                                              v231 = 0;
                                              v246 = 0;
                                              v233 = 0;
                                              v235 = 0;
                                              v244 = 0;
                                              v236 = 0;
                                              v239 = 0;
                                              v243 = 0;
                                              v240 = 0;
                                              v14 = 0;
                                              v15 = 0;
                                              v16 = 0;
                                              v17 = 0;
                                              v247 = 1;
                                              v245 = 1;
                                              v242[2] = 1;
                                              v13 = 1;
                                              v242[1] = 0x100000001;
                                              v242[0] = 0x100000001;
                                              v241 = 0x100000001;
                                              v237 = 1;
                                              v238 = 1;
                                              v232 = 1;
                                              v234 = 1;
                                              v228 = 1;
                                              v227 = 1;
                                              v224 = 1;
                                              v226 = 1;
                                              v264 = 1;
                                            }
                                          }
                                        }
                                        else
                                        {
                                          v224 = 0;
                                          v226 = 0;
                                          v264 = 0;
                                          v223 = 0;
                                          v263 = 0;
                                          v219 = 0;
                                          v221 = 0;
                                          v257 = 0;
                                          v218 = 0;
                                          v256 = 0;
                                          v211 = 0;
                                          v214 = 0;
                                          v255 = 0;
                                          v212 = 0;
                                          v217 = 0;
                                          v254 = 0;
                                          v209 = 0;
                                          v216 = 0;
                                          v253 = 0;
                                          v208 = 0;
                                          v213 = 0;
                                          v252 = 0;
                                          v207 = 0;
                                          v210 = 0;
                                          v251 = 0;
                                          v215 = 0;
                                          v250 = 0;
                                          v220 = 0;
                                          v222 = 0;
                                          v249 = 0;
                                          v225 = 0;
                                          v230 = 0;
                                          v248 = 0;
                                          v229 = 0;
                                          v231 = 0;
                                          v246 = 0;
                                          v233 = 0;
                                          v235 = 0;
                                          v244 = 0;
                                          v236 = 0;
                                          v239 = 0;
                                          v243 = 0;
                                          v240 = 0;
                                          v14 = 0;
                                          v15 = 0;
                                          v16 = 0;
                                          v17 = 0;
                                          v247 = 1;
                                          v245 = 1;
                                          v242[2] = 1;
                                          v13 = 1;
                                          v242[1] = 0x100000001;
                                          v242[0] = 0x100000001;
                                          v241 = 0x100000001;
                                          v237 = 1;
                                          v238 = 1;
                                          v232 = 1;
                                          v234 = 1;
                                          v228 = 1;
                                          v227 = 1;
                                        }
                                      }
                                      else
                                      {
                                        v224 = 0;
                                        v226 = 0;
                                        v264 = 0;
                                        v223 = 0;
                                        v263 = 0;
                                        v219 = 0;
                                        v221 = 0;
                                        v257 = 0;
                                        v218 = 0;
                                        v256 = 0;
                                        v211 = 0;
                                        v214 = 0;
                                        v255 = 0;
                                        v212 = 0;
                                        v217 = 0;
                                        v254 = 0;
                                        v209 = 0;
                                        v216 = 0;
                                        v253 = 0;
                                        v208 = 0;
                                        v213 = 0;
                                        v252 = 0;
                                        v207 = 0;
                                        v210 = 0;
                                        v251 = 0;
                                        v215 = 0;
                                        v250 = 0;
                                        v220 = 0;
                                        v222 = 0;
                                        v249 = 0;
                                        v225 = 0;
                                        v230 = 0;
                                        v248 = 0;
                                        v229 = 0;
                                        v231 = 0;
                                        v246 = 0;
                                        v233 = 0;
                                        v235 = 0;
                                        v244 = 0;
                                        v236 = 0;
                                        v239 = 0;
                                        v243 = 0;
                                        v240 = 0;
                                        v14 = 0;
                                        v15 = 0;
                                        v16 = 0;
                                        v17 = 0;
                                        v247 = 1;
                                        v245 = 1;
                                        v242[2] = 1;
                                        v13 = 1;
                                        v242[1] = 0x100000001;
                                        v242[0] = 0x100000001;
                                        v241 = 0x100000001;
                                        v237 = 1;
                                        v238 = 1;
                                        v232 = 1;
                                        v234 = 1;
                                        v228 = 1;
                                        v227 = 1;
                                        v265 = 1;
                                      }
                                    }
                                  }
                                  else
                                  {
                                    v228 = 0;
                                    v227 = 0;
                                    v265 = 0;
                                    v224 = 0;
                                    v226 = 0;
                                    v264 = 0;
                                    v223 = 0;
                                    v263 = 0;
                                    v219 = 0;
                                    v221 = 0;
                                    v257 = 0;
                                    v218 = 0;
                                    v256 = 0;
                                    v211 = 0;
                                    v214 = 0;
                                    v255 = 0;
                                    v212 = 0;
                                    v217 = 0;
                                    v254 = 0;
                                    v209 = 0;
                                    v216 = 0;
                                    v253 = 0;
                                    v208 = 0;
                                    v213 = 0;
                                    v252 = 0;
                                    v207 = 0;
                                    v210 = 0;
                                    v251 = 0;
                                    v215 = 0;
                                    v250 = 0;
                                    v220 = 0;
                                    v222 = 0;
                                    v249 = 0;
                                    v225 = 0;
                                    v230 = 0;
                                    v248 = 0;
                                    v229 = 0;
                                    v231 = 0;
                                    v246 = 0;
                                    v233 = 0;
                                    v235 = 0;
                                    v244 = 0;
                                    v236 = 0;
                                    v239 = 0;
                                    v243 = 0;
                                    v240 = 0;
                                    v14 = 0;
                                    v15 = 0;
                                    v16 = 0;
                                    v17 = 0;
                                    v247 = 1;
                                    v245 = 1;
                                    v242[2] = 1;
                                    v13 = 1;
                                    v242[1] = 0x100000001;
                                    v242[0] = 0x100000001;
                                    v241 = 0x100000001;
                                    v237 = 1;
                                    v238 = 1;
                                    v232 = 1;
                                    v234 = 1;
                                    v266 = 1;
                                  }
                                }
                              }
                              else
                              {
                                v232 = 0;
                                v234 = 0;
                                v266 = 0;
                                v228 = 0;
                                v227 = 0;
                                v265 = 0;
                                v224 = 0;
                                v226 = 0;
                                v264 = 0;
                                v223 = 0;
                                v263 = 0;
                                v219 = 0;
                                v221 = 0;
                                v257 = 0;
                                v218 = 0;
                                v256 = 0;
                                v211 = 0;
                                v214 = 0;
                                v255 = 0;
                                v212 = 0;
                                v217 = 0;
                                v254 = 0;
                                v209 = 0;
                                v216 = 0;
                                v253 = 0;
                                v208 = 0;
                                v213 = 0;
                                v252 = 0;
                                v207 = 0;
                                v210 = 0;
                                v251 = 0;
                                v215 = 0;
                                v250 = 0;
                                v220 = 0;
                                v222 = 0;
                                v249 = 0;
                                v225 = 0;
                                v230 = 0;
                                v248 = 0;
                                v229 = 0;
                                v231 = 0;
                                v246 = 0;
                                v233 = 0;
                                v235 = 0;
                                v244 = 0;
                                v236 = 0;
                                v239 = 0;
                                v243 = 0;
                                v240 = 0;
                                v14 = 0;
                                v15 = 0;
                                v16 = 0;
                                v17 = 0;
                                v247 = 1;
                                v245 = 1;
                                v242[2] = 1;
                                v13 = 1;
                                v242[1] = 0x100000001;
                                v242[0] = 0x100000001;
                                v241 = 0x100000001;
                                v237 = 1;
                                v238 = 1;
                                v267 = 1;
                              }
                            }
                          }
                          else
                          {
                            v237 = 0;
                            v238 = 0;
                            v267 = 0;
                            v232 = 0;
                            v234 = 0;
                            v266 = 0;
                            v228 = 0;
                            v227 = 0;
                            v265 = 0;
                            v224 = 0;
                            v226 = 0;
                            v264 = 0;
                            v223 = 0;
                            v263 = 0;
                            v219 = 0;
                            v221 = 0;
                            v257 = 0;
                            v218 = 0;
                            v256 = 0;
                            v211 = 0;
                            v214 = 0;
                            v255 = 0;
                            v212 = 0;
                            v217 = 0;
                            v254 = 0;
                            v209 = 0;
                            v216 = 0;
                            v253 = 0;
                            v208 = 0;
                            v213 = 0;
                            v252 = 0;
                            v207 = 0;
                            v210 = 0;
                            v251 = 0;
                            v215 = 0;
                            v250 = 0;
                            v220 = 0;
                            v222 = 0;
                            v249 = 0;
                            v225 = 0;
                            v230 = 0;
                            v248 = 0;
                            v229 = 0;
                            v231 = 0;
                            v246 = 0;
                            v233 = 0;
                            v235 = 0;
                            v244 = 0;
                            v236 = 0;
                            v239 = 0;
                            v243 = 0;
                            v240 = 0;
                            v14 = 0;
                            v15 = 0;
                            v16 = 0;
                            v17 = 0;
                            v247 = 1;
                            v245 = 1;
                            v242[2] = 1;
                            v13 = 1;
                            v242[1] = 0x100000001;
                            v242[0] = 0x100000001;
                            v241 = 0x100000001;
                            v268 = 1;
                          }
                        }
                      }
                      else
                      {
                        v241 = 0;
                        v268 = 0;
                        v237 = 0;
                        v238 = 0;
                        v267 = 0;
                        v232 = 0;
                        v234 = 0;
                        v266 = 0;
                        v228 = 0;
                        v227 = 0;
                        v265 = 0;
                        v224 = 0;
                        v226 = 0;
                        v264 = 0;
                        v223 = 0;
                        v263 = 0;
                        v219 = 0;
                        v221 = 0;
                        v257 = 0;
                        v218 = 0;
                        v256 = 0;
                        v211 = 0;
                        v214 = 0;
                        v255 = 0;
                        v212 = 0;
                        v217 = 0;
                        v254 = 0;
                        v209 = 0;
                        v216 = 0;
                        v253 = 0;
                        v208 = 0;
                        v213 = 0;
                        v252 = 0;
                        v207 = 0;
                        v210 = 0;
                        v251 = 0;
                        v215 = 0;
                        v250 = 0;
                        v220 = 0;
                        v222 = 0;
                        v249 = 0;
                        v225 = 0;
                        v230 = 0;
                        v248 = 0;
                        v229 = 0;
                        v231 = 0;
                        v246 = 0;
                        v233 = 0;
                        v235 = 0;
                        v244 = 0;
                        v236 = 0;
                        v239 = 0;
                        v243 = 0;
                        v240 = 0;
                        v14 = 0;
                        v15 = 0;
                        v16 = 0;
                        v17 = 0;
                        v247 = 1;
                        v245 = 1;
                        v242[2] = 1;
                        v13 = 1;
                        v242[1] = 0x100000001;
                        v242[0] = 0x100000001;
                        LODWORD(v269) = 1;
                      }
                    }
                  }
                  else
                  {
                    v242[0] = 0;
                    LODWORD(v269) = 0;
                    v241 = 0;
                    v268 = 0;
                    v237 = 0;
                    v238 = 0;
                    v267 = 0;
                    v232 = 0;
                    v234 = 0;
                    v266 = 0;
                    v228 = 0;
                    v227 = 0;
                    v265 = 0;
                    v224 = 0;
                    v226 = 0;
                    v264 = 0;
                    v223 = 0;
                    v263 = 0;
                    v219 = 0;
                    v221 = 0;
                    v257 = 0;
                    v218 = 0;
                    v256 = 0;
                    v211 = 0;
                    v214 = 0;
                    v255 = 0;
                    v212 = 0;
                    v217 = 0;
                    v254 = 0;
                    v209 = 0;
                    v216 = 0;
                    v253 = 0;
                    v208 = 0;
                    v213 = 0;
                    v252 = 0;
                    v207 = 0;
                    v210 = 0;
                    v251 = 0;
                    v215 = 0;
                    v250 = 0;
                    v220 = 0;
                    v222 = 0;
                    v249 = 0;
                    v225 = 0;
                    v230 = 0;
                    v248 = 0;
                    v229 = 0;
                    v231 = 0;
                    v246 = 0;
                    v233 = 0;
                    v235 = 0;
                    v244 = 0;
                    v236 = 0;
                    v239 = 0;
                    v243 = 0;
                    v240 = 0;
                    v14 = 0;
                    v15 = 0;
                    v16 = 0;
                    v17 = 0;
                    v247 = 1;
                    v245 = 1;
                    v242[2] = 1;
                    v13 = 1;
                    v242[1] = 0x100000001;
                  }
                }
                else
                {
                  v242[0] = 0;
                  *(_QWORD *)&v269 = 0x100000000;
                  v241 = 0;
                  v268 = 0;
                  v237 = 0;
                  v238 = 0;
                  v267 = 0;
                  v232 = 0;
                  v234 = 0;
                  v266 = 0;
                  v228 = 0;
                  v227 = 0;
                  v265 = 0;
                  v224 = 0;
                  v226 = 0;
                  v264 = 0;
                  v223 = 0;
                  v263 = 0;
                  v219 = 0;
                  v221 = 0;
                  v257 = 0;
                  v218 = 0;
                  v256 = 0;
                  v211 = 0;
                  v214 = 0;
                  v255 = 0;
                  v212 = 0;
                  v217 = 0;
                  v254 = 0;
                  v209 = 0;
                  v216 = 0;
                  v253 = 0;
                  v208 = 0;
                  v213 = 0;
                  v252 = 0;
                  v207 = 0;
                  v210 = 0;
                  v251 = 0;
                  v215 = 0;
                  v250 = 0;
                  v220 = 0;
                  v222 = 0;
                  v249 = 0;
                  v225 = 0;
                  v230 = 0;
                  v248 = 0;
                  v229 = 0;
                  v231 = 0;
                  v246 = 0;
                  v233 = 0;
                  v235 = 0;
                  v244 = 0;
                  v236 = 0;
                  v239 = 0;
                  v243 = 0;
                  v240 = 0;
                  v14 = 0;
                  v15 = 0;
                  v16 = 0;
                  v17 = 0;
                  v247 = 1;
                  v245 = 1;
                  HIDWORD(v242[2]) = 0;
                  v13 = 1;
                  LODWORD(v242[1]) = 1;
                  *(_QWORD *)((char *)&v242[1] + 4) = 0x100000001;
                }
              }
            }
            else
            {
              v242[0] = 0;
              v242[1] = 0;
              *(_QWORD *)&v269 = 0;
              v241 = 0;
              v268 = 0;
              v237 = 0;
              v238 = 0;
              v267 = 0;
              v232 = 0;
              v234 = 0;
              v266 = 0;
              v228 = 0;
              v227 = 0;
              v265 = 0;
              v224 = 0;
              v226 = 0;
              v264 = 0;
              v223 = 0;
              v263 = 0;
              v219 = 0;
              v221 = 0;
              v257 = 0;
              v218 = 0;
              v256 = 0;
              v211 = 0;
              v214 = 0;
              v255 = 0;
              v212 = 0;
              v217 = 0;
              v254 = 0;
              v209 = 0;
              v216 = 0;
              v253 = 0;
              v208 = 0;
              v213 = 0;
              v252 = 0;
              v207 = 0;
              v210 = 0;
              v251 = 0;
              v215 = 0;
              v250 = 0;
              v220 = 0;
              v222 = 0;
              v249 = 0;
              v225 = 0;
              v230 = 0;
              v248 = 0;
              v229 = 0;
              v231 = 0;
              v246 = 0;
              v233 = 0;
              v235 = 0;
              v244 = 0;
              v236 = 0;
              v239 = 0;
              v243 = 0;
              v240 = 0;
              v14 = 0;
              v15 = 0;
              v16 = 0;
              v17 = 0;
              v247 = 1;
              v245 = 1;
              v242[2] = 1;
              v13 = 1;
            }
            goto LABEL_16;
          }
          v13 = 0;
          *(_QWORD *)((char *)&v269 + 4) = 0;
          v242[0] = 0;
          v242[1] = 0;
          LODWORD(v269) = 0;
          v241 = 0;
          v268 = 0;
          v237 = 0;
          v238 = 0;
          v267 = 0;
          v232 = 0;
          v234 = 0;
          v266 = 0;
          v228 = 0;
          v227 = 0;
          v265 = 0;
          v224 = 0;
          v226 = 0;
          v264 = 0;
          v223 = 0;
          v263 = 0;
          v219 = 0;
          v221 = 0;
          v257 = 0;
          v218 = 0;
          v256 = 0;
          v211 = 0;
          v214 = 0;
          v255 = 0;
          v212 = 0;
          v217 = 0;
          v254 = 0;
          v209 = 0;
          v216 = 0;
          v253 = 0;
          v208 = 0;
          v213 = 0;
          v252 = 0;
          v207 = 0;
          v210 = 0;
          v251 = 0;
          v215 = 0;
          v250 = 0;
          v220 = 0;
          v222 = 0;
          v249 = 0;
          v225 = 0;
          v230 = 0;
          v248 = 0;
          v229 = 0;
          v231 = 0;
          v246 = 0;
          v233 = 0;
          v235 = 0;
          v244 = 0;
          v236 = 0;
          v239 = 0;
          v243 = 0;
          v240 = 0;
          v14 = 0;
          v15 = 0;
          v16 = 0;
          v17 = 0;
          v247 = 1;
          v245 = 1;
          v242[2] = 1;
        }
        else
        {
          v13 = 0;
          *(_QWORD *)((char *)&v269 + 4) = 0;
          memset(v242, 0, sizeof(v242));
          LODWORD(v269) = 0;
          v241 = 0;
          v268 = 0;
          v237 = 0;
          v238 = 0;
          v267 = 0;
          v232 = 0;
          v234 = 0;
          v266 = 0;
          v228 = 0;
          v227 = 0;
          v265 = 0;
          v224 = 0;
          v226 = 0;
          v264 = 0;
          v223 = 0;
          v263 = 0;
          v219 = 0;
          v221 = 0;
          v257 = 0;
          v218 = 0;
          v256 = 0;
          v211 = 0;
          v214 = 0;
          v255 = 0;
          v212 = 0;
          v217 = 0;
          v254 = 0;
          v209 = 0;
          v216 = 0;
          v253 = 0;
          v208 = 0;
          v213 = 0;
          v252 = 0;
          v207 = 0;
          v210 = 0;
          v251 = 0;
          v215 = 0;
          v250 = 0;
          v220 = 0;
          v222 = 0;
          v249 = 0;
          v225 = 0;
          v230 = 0;
          v248 = 0;
          v229 = 0;
          v231 = 0;
          v246 = 0;
          v233 = 0;
          v235 = 0;
          v244 = 0;
          v236 = 0;
          v239 = 0;
          v243 = 0;
          v240 = 0;
          v14 = 0;
          v15 = 0;
          v16 = 0;
          v17 = 0;
          v247 = 1;
          v245 = 1;
          HIDWORD(v269) = 1;
        }
      }
    }
    else
    {
      v247 = 0;
      v245 = 0;
      v269 = 0uLL;
      v13 = 0;
      memset(v242, 0, sizeof(v242));
      v241 = 0;
      v268 = 0;
      v237 = 0;
      v238 = 0;
      v267 = 0;
      v232 = 0;
      v234 = 0;
      v266 = 0;
      v228 = 0;
      v227 = 0;
      v265 = 0;
      v224 = 0;
      v226 = 0;
      v264 = 0;
      v223 = 0;
      v263 = 0;
      v219 = 0;
      v221 = 0;
      v257 = 0;
      v218 = 0;
      v256 = 0;
      v211 = 0;
      v214 = 0;
      v255 = 0;
      v212 = 0;
      v217 = 0;
      v254 = 0;
      v209 = 0;
      v216 = 0;
      v253 = 0;
      v208 = 0;
      v213 = 0;
      v252 = 0;
      v207 = 0;
      v210 = 0;
      v251 = 0;
      v215 = 0;
      v250 = 0;
      v220 = 0;
      v222 = 0;
      v249 = 0;
      v225 = 0;
      v230 = 0;
      v248 = 0;
      v229 = 0;
      v231 = 0;
      v246 = 0;
      v233 = 0;
      v235 = 0;
      v244 = 0;
      v236 = 0;
      v239 = 0;
      v243 = 0;
      v240 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v258 = 1;
    }
  }
LABEL_16:
  if (v16)
  {
    v19 = v13;
    v20 = v15;

    v15 = v20;
    v13 = v19;
  }
  if (v15)

  if (v14)
  {

  }
  if (HIDWORD(v242[2]))
  {

  }
  if (HIDWORD(v240))

  if ((_DWORD)v240)
  {

  }
  if (v243)
  {

  }
  if (v239)

  if (v236)
  {

  }
  if (v244)
  {

  }
  if (v235)

  if (v233)
  {

  }
  if (v246)
  {

  }
  if (v231)

  if (v229)
  {

  }
  if (v248)
  {

  }
  if (v230)

  if (v225)
  {

  }
  if (v249)
  {

  }
  if (v222)

  if (v220)
  {

  }
  if (v250)
  {

  }
  if (HIDWORD(v215))

  if ((_DWORD)v215)
  {

  }
  if (v251)
  {

  }
  if (v210)

  if (v207)
  {

  }
  if (v252)
  {

  }
  if (v213)

  if (v208)
  {

  }
  if (v253)
  {

  }
  if (v216)

  if (v209)
  {

  }
  if (v254)
  {

  }
  if (v217)

  if (v212)
  {

  }
  if (v255)
  {

  }
  if (v214)

  if (v211)
  {

  }
  if (v256)
  {

  }
  if (HIDWORD(v218))

  if ((_DWORD)v218)
  {

  }
  if (v257)
  {

  }
  if (v221)

  if (v219)
  {

  }
  if (v263)
  {

  }
  if (HIDWORD(v223))

  if ((_DWORD)v223)
  {

  }
  if (v264)
  {

  }
  if (v226)

  if (v224)
  {

  }
  if (v265)
  {

  }
  if (v227)

  if (v228)
  {

  }
  if (v266)
  {

  }
  if (v234)

  if (v232)
  {

  }
  if (v267)
  {

  }
  if (v238)

  if (v237)
  {

  }
  if (v268)
  {

  }
  if (HIDWORD(v241))

  if ((_DWORD)v241)
  {

  }
  if ((_DWORD)v269)
  {

  }
  if (HIDWORD(v242[0]))

  if (LODWORD(v242[0]))
  {

  }
  if (DWORD1(v269))
  {

  }
  if (LODWORD(v242[1]))

  if (HIDWORD(v242[1]))
  {

  }
  if (DWORD2(v269))
  {

  }
  if (v13)

  if (LODWORD(v242[2]))
  {

  }
  if (HIDWORD(v269))
  {

  }
  if (v245)

  if (v247)
  {

  }
  if (v258)
  {

  }
  if (v260 != v259)

LABEL_171:
  return v17;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  unint64_t v49;
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
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  objc_super v70;

  v70.receiver = self;
  v70.super_class = (Class)SFRichTitleCardSection;
  v3 = -[SFTitleCardSection hash](&v70, sel_hash);
  -[SFCardSection punchoutOptions](self, "punchoutOptions");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v69, "hash");
  -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 ^ objc_msgSend(v68, "hash");
  -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 ^ objc_msgSend(v67, "hash");
  v7 = v6 ^ -[SFCardSection canBeHidden](self, "canBeHidden");
  v8 = v7 ^ -[SFCardSection hasTopPadding](self, "hasTopPadding") ^ v3;
  v9 = -[SFCardSection hasBottomPadding](self, "hasBottomPadding");
  -[SFTitleCardSection type](self, "type");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9 ^ objc_msgSend(v66, "hash");
  v11 = v10 ^ -[SFCardSection separatorStyle](self, "separatorStyle");
  -[SFCardSection backgroundColor](self, "backgroundColor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11 ^ objc_msgSend(v65, "hash");
  -[SFTitleCardSection title](self, "title");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v8 ^ v12 ^ objc_msgSend(v64, "hash");
  -[SFTitleCardSection subtitle](self, "subtitle");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v63, "hash");
  -[SFRichTitleCardSection contentAdvisory](self, "contentAdvisory");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14 ^ objc_msgSend(v62, "hash");
  -[SFRichTitleCardSection titleImage](self, "titleImage");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15 ^ objc_msgSend(v61, "hash");
  v17 = v16 ^ -[SFTitleCardSection isCentered](self, "isCentered");
  -[SFRichTitleCardSection descriptionText](self, "descriptionText");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17 ^ objc_msgSend(v60, "hash");
  -[SFRichTitleCardSection rating](self, "rating");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18 ^ objc_msgSend(v59, "hash");
  -[SFRichTitleCardSection ratingText](self, "ratingText");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v13 ^ v19 ^ objc_msgSend(v58, "hash");
  -[SFRichTitleCardSection reviewGlyph](self, "reviewGlyph");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v57, "hash");
  -[SFRichTitleCardSection reviewText](self, "reviewText");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21 ^ objc_msgSend(v56, "hash");
  v23 = v22 ^ -[SFRichTitleCardSection reviewNewLine](self, "reviewNewLine");
  -[SFRichTitleCardSection moreGlyphs](self, "moreGlyphs");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23 ^ objc_msgSend(v55, "hash");
  -[SFRichTitleCardSection auxiliaryTopText](self, "auxiliaryTopText");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24 ^ objc_msgSend(v54, "hash");
  -[SFRichTitleCardSection auxiliaryMiddleText](self, "auxiliaryMiddleText");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25 ^ objc_msgSend(v53, "hash");
  -[SFRichTitleCardSection auxiliaryBottomText](self, "auxiliaryBottomText");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26 ^ objc_msgSend(v52, "hash");
  v28 = v20 ^ v27 ^ -[SFRichTitleCardSection auxiliaryBottomTextColor](self, "auxiliaryBottomTextColor");
  -[SFRichTitleCardSection auxiliaryAlignment](self, "auxiliaryAlignment");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v51, "hash");
  v30 = v29 ^ -[SFRichTitleCardSection hideVerticalDivider](self, "hideVerticalDivider");
  v31 = v30 ^ -[SFRichTitleCardSection titleAlign](self, "titleAlign");
  -[SFRichTitleCardSection titleWeight](self, "titleWeight");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v31 ^ objc_msgSend(v32, "hash");
  v34 = v33 ^ -[SFRichTitleCardSection titleNoWrap](self, "titleNoWrap");
  v35 = v34 ^ -[SFRichTitleCardSection thumbnailCropCircle](self, "thumbnailCropCircle");
  -[SFRichTitleCardSection imageOverlay](self, "imageOverlay");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v35 ^ objc_msgSend(v36, "hash");
  -[SFRichTitleCardSection playAction](self, "playAction");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v28 ^ v37 ^ objc_msgSend(v38, "hash");
  v40 = -[SFRichTitleCardSection playActionAlign](self, "playActionAlign");
  -[SFRichTitleCardSection offers](self, "offers");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v40 ^ objc_msgSend(v41, "hash");
  -[SFRichTitleCardSection footnote](self, "footnote");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v42 ^ objc_msgSend(v43, "hash");
  -[SFRichTitleCardSection richSubtitle](self, "richSubtitle");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v44 ^ objc_msgSend(v45, "hash");
  v47 = v46 ^ -[SFRichTitleCardSection subtitleIsEmphasized](self, "subtitleIsEmphasized");
  -[SFRichTitleCardSection buttonItems](self, "buttonItems");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v39 ^ v47 ^ objc_msgSend(v48, "hash");

  return v49;
}

- (NSString)contentAdvisory
{
  return self->_contentAdvisory;
}

- (void)setContentAdvisory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (SFImage)titleImage
{
  return self->_titleImage;
}

- (void)setTitleImage:(id)a3
{
  objc_storeStrong((id *)&self->_titleImage, a3);
}

- (NSString)descriptionText
{
  return self->_descriptionText;
}

- (void)setDescriptionText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (NSNumber)rating
{
  return self->_rating;
}

- (void)setRating:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (NSString)ratingText
{
  return self->_ratingText;
}

- (void)setRatingText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (SFImage)reviewGlyph
{
  return self->_reviewGlyph;
}

- (void)setReviewGlyph:(id)a3
{
  objc_storeStrong((id *)&self->_reviewGlyph, a3);
}

- (NSString)reviewText
{
  return self->_reviewText;
}

- (void)setReviewText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (BOOL)reviewNewLine
{
  return self->_reviewNewLine;
}

- (NSArray)moreGlyphs
{
  return self->_moreGlyphs;
}

- (void)setMoreGlyphs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (NSString)auxiliaryTopText
{
  return self->_auxiliaryTopText;
}

- (void)setAuxiliaryTopText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 320);
}

- (NSString)auxiliaryMiddleText
{
  return self->_auxiliaryMiddleText;
}

- (void)setAuxiliaryMiddleText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 328);
}

- (NSString)auxiliaryBottomText
{
  return self->_auxiliaryBottomText;
}

- (void)setAuxiliaryBottomText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 336);
}

- (int)auxiliaryBottomTextColor
{
  return self->_auxiliaryBottomTextColor;
}

- (NSNumber)auxiliaryAlignment
{
  return self->_auxiliaryAlignment;
}

- (void)setAuxiliaryAlignment:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 344);
}

- (BOOL)hideVerticalDivider
{
  return self->_hideVerticalDivider;
}

- (int)titleAlign
{
  return self->_titleAlign;
}

- (NSNumber)titleWeight
{
  return self->_titleWeight;
}

- (void)setTitleWeight:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 352);
}

- (BOOL)titleNoWrap
{
  return self->_titleNoWrap;
}

- (BOOL)thumbnailCropCircle
{
  return self->_thumbnailCropCircle;
}

- (SFImage)imageOverlay
{
  return self->_imageOverlay;
}

- (void)setImageOverlay:(id)a3
{
  objc_storeStrong((id *)&self->_imageOverlay, a3);
}

- (SFActionItem)playAction
{
  return self->_playAction;
}

- (void)setPlayAction:(id)a3
{
  objc_storeStrong((id *)&self->_playAction, a3);
}

- (int)playActionAlign
{
  return self->_playActionAlign;
}

- (NSArray)offers
{
  return self->_offers;
}

- (void)setOffers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 376);
}

- (NSString)footnote
{
  return self->_footnote;
}

- (void)setFootnote:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (SFRichText)richSubtitle
{
  return self->_richSubtitle;
}

- (void)setRichSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_richSubtitle, a3);
}

- (BOOL)subtitleIsEmphasized
{
  return self->_subtitleIsEmphasized;
}

- (NSArray)buttonItems
{
  return self->_buttonItems;
}

- (void)setButtonItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 400);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonItems, 0);
  objc_storeStrong((id *)&self->_richSubtitle, 0);
  objc_storeStrong((id *)&self->_footnote, 0);
  objc_storeStrong((id *)&self->_offers, 0);
  objc_storeStrong((id *)&self->_playAction, 0);
  objc_storeStrong((id *)&self->_imageOverlay, 0);
  objc_storeStrong((id *)&self->_titleWeight, 0);
  objc_storeStrong((id *)&self->_auxiliaryAlignment, 0);
  objc_storeStrong((id *)&self->_auxiliaryBottomText, 0);
  objc_storeStrong((id *)&self->_auxiliaryMiddleText, 0);
  objc_storeStrong((id *)&self->_auxiliaryTopText, 0);
  objc_storeStrong((id *)&self->_moreGlyphs, 0);
  objc_storeStrong((id *)&self->_reviewText, 0);
  objc_storeStrong((id *)&self->_reviewGlyph, 0);
  objc_storeStrong((id *)&self->_ratingText, 0);
  objc_storeStrong((id *)&self->_rating, 0);
  objc_storeStrong((id *)&self->_descriptionText, 0);
  objc_storeStrong((id *)&self->_titleImage, 0);
  objc_storeStrong((id *)&self->_contentAdvisory, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
