@implementation SFRowCardSection

- (void)setImageIsRightAligned:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_imageIsRightAligned = a3;
}

- (BOOL)hasImageIsRightAligned
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setKeyNoWrap:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_keyNoWrap = a3;
}

- (BOOL)hasKeyNoWrap
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setValueNoWrap:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_valueNoWrap = a3;
}

- (BOOL)hasValueNoWrap
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setCardPaddingBottom:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_cardPaddingBottom = a3;
}

- (BOOL)hasCardPaddingBottom
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (SFRowCardSection)initWithCoder:(id)a3
{
  id v4;
  SFRowCardSection *v5;
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
    -[SFRowCardSection setType:](v5, "setType:", v12);

    -[SFCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", -[SFCardSection separatorStyle](v8, "separatorStyle"));
    -[SFCardSection backgroundColor](v8, "backgroundColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setBackgroundColor:](v5, "setBackgroundColor:", v13);

    -[SFCardSection image](v8, "image");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFRowCardSection setImage:](v5, "setImage:", v14);

    -[SFRowCardSection setImageIsRightAligned:](v5, "setImageIsRightAligned:", -[SFCardSection imageIsRightAligned](v8, "imageIsRightAligned"));
    -[SFCardSection leadingText](v8, "leadingText");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFRowCardSection setLeadingText:](v5, "setLeadingText:", v15);

    -[SFCardSection trailingText](v8, "trailingText");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFRowCardSection setTrailingText:](v5, "setTrailingText:", v16);

    -[SFCardSection attributionImage](v8, "attributionImage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFRowCardSection setAttributionImage:](v5, "setAttributionImage:", v17);

    -[SFCardSection key](v8, "key");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFRowCardSection setKey:](v5, "setKey:", v18);

    -[SFRowCardSection setKeyNoWrap:](v5, "setKeyNoWrap:", -[SFCardSection keyNoWrap](v8, "keyNoWrap"));
    -[SFCardSection keyWeight](v8, "keyWeight");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFRowCardSection setKeyWeight:](v5, "setKeyWeight:", v19);

    -[SFCardSection value](v8, "value");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFRowCardSection setValue:](v5, "setValue:", v20);

    -[SFRowCardSection setValueNoWrap:](v5, "setValueNoWrap:", -[SFCardSection valueNoWrap](v8, "valueNoWrap"));
    -[SFCardSection valueWeight](v8, "valueWeight");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFRowCardSection setValueWeight:](v5, "setValueWeight:", v21);

    -[SFRowCardSection setCardPaddingBottom:](v5, "setCardPaddingBottom:", -[SFCardSection cardPaddingBottom](v8, "cardPaddingBottom"));
    -[SFCardSection leadingSubtitle](v8, "leadingSubtitle");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFRowCardSection setLeadingSubtitle:](v5, "setLeadingSubtitle:", v22);

    -[SFCardSection trailingSubtitle](v8, "trailingSubtitle");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFRowCardSection setTrailingSubtitle:](v5, "setTrailingSubtitle:", v23);

    -[SFCardSection nextCard](v8, "nextCard");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setNextCard:](v5, "setNextCard:", v24);

    -[SFCardSection commands](v8, "commands");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCommands:](v5, "setCommands:", v25);

    -[SFCardSection parameterKeyPaths](v8, "parameterKeyPaths");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setParameterKeyPaths:](v5, "setParameterKeyPaths:", v26);

    -[SFCardSection cardSectionId](v8, "cardSectionId");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCardSectionId:](v5, "setCardSectionId:", v27);

    -[SFCardSection resultIdentifier](v8, "resultIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setResultIdentifier:](v5, "setResultIdentifier:", v28);

    -[SFCardSection userReportRequest](v8, "userReportRequest");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setUserReportRequest:](v5, "setUserReportRequest:", v29);

    -[SFCardSection command](v8, "command");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCommand:](v5, "setCommand:", v30);

    -[SFCardSection previewCommand](v8, "previewCommand");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewCommand:](v5, "setPreviewCommand:", v31);

    -[SFCardSection previewButtonItems](v8, "previewButtonItems");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewButtonItems:](v5, "setPreviewButtonItems:", v32);

    -[SFCardSection cardSectionDetail](v8, "cardSectionDetail");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCardSectionDetail:](v5, "setCardSectionDetail:", v33);

    -[SFCardSection previewButtonItemsTitle](v8, "previewButtonItemsTitle");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewButtonItemsTitle:](v5, "setPreviewButtonItemsTitle:", v34);

    -[SFCardSection backgroundColor](v8, "backgroundColor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setBackgroundColor:](v5, "setBackgroundColor:", v35);

    -[SFCardSection setShouldHideInAmbientMode:](v5, "setShouldHideInAmbientMode:", -[SFCardSection shouldHideInAmbientMode](v8, "shouldHideInAmbientMode"));
    -[SFCardSection leadingSwipeButtonItems](v8, "leadingSwipeButtonItems");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setLeadingSwipeButtonItems:](v5, "setLeadingSwipeButtonItems:", v36);

    -[SFCardSection trailingSwipeButtonItems](v8, "trailingSwipeButtonItems");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setTrailingSwipeButtonItems:](v5, "setTrailingSwipeButtonItems:", v37);

    -[SFCardSection punchoutOptions](v8, "punchoutOptions");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutOptions:](v5, "setPunchoutOptions:", v38);

    -[SFCardSection punchoutPickerTitle](v8, "punchoutPickerTitle");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerTitle:](v5, "setPunchoutPickerTitle:", v39);

    -[SFCardSection punchoutPickerDismissText](v8, "punchoutPickerDismissText");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerDismissText:](v5, "setPunchoutPickerDismissText:", v40);

    -[SFCardSection setCanBeHidden:](v5, "setCanBeHidden:", -[SFCardSection canBeHidden](v8, "canBeHidden"));
    -[SFCardSection setHasTopPadding:](v5, "setHasTopPadding:", -[SFCardSection hasTopPadding](v8, "hasTopPadding"));
    -[SFCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", -[SFCardSection hasBottomPadding](v8, "hasBottomPadding"));
    -[SFCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", -[SFCardSection separatorStyle](v8, "separatorStyle"));
    -[SFCardSection referencedCommands](v8, "referencedCommands");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setReferencedCommands:](v5, "setReferencedCommands:", v41);

    -[SFCardSection setForceEnable3DTouch:](v5, "setForceEnable3DTouch:", -[SFCardSection forceEnable3DTouch](v8, "forceEnable3DTouch"));
    -[SFCardSection setShouldShowInSmartDialog:](v5, "setShouldShowInSmartDialog:", -[SFCardSection shouldShowInSmartDialog](v8, "shouldShowInSmartDialog"));
    -[SFCardSection appEntityAnnotation](v8, "appEntityAnnotation");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setAppEntityAnnotation:](v5, "setAppEntityAnnotation:", v42);

    -[SFCardSection emphasisSubjectId](v8, "emphasisSubjectId");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setEmphasisSubjectId:](v5, "setEmphasisSubjectId:", v43);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFRowCardSection;
  -[SFCardSection encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBRowCardSection *v2;
  void *v3;

  v2 = -[_SFPBRowCardSection initWithFacade:]([_SFPBRowCardSection alloc], "initWithFacade:", self);
  -[_SFPBRowCardSection dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBRowCardSection *v2;
  void *v3;

  v2 = -[_SFPBRowCardSection initWithFacade:]([_SFPBRowCardSection alloc], "initWithFacade:", self);
  -[_SFPBRowCardSection jsonData](v2, "jsonData");
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
  objc_super v36;

  v36.receiver = self;
  v36.super_class = (Class)SFRowCardSection;
  v4 = -[SFCardSection copyWithZone:](&v36, sel_copyWithZone_, a3);
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
  -[SFRowCardSection type](self, "type");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setType:", v12);

  objc_msgSend(v4, "setSeparatorStyle:", -[SFCardSection separatorStyle](self, "separatorStyle"));
  -[SFCardSection backgroundColor](self, "backgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setBackgroundColor:", v14);

  -[SFRowCardSection image](self, "image");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v4, "setImage:", v16);

  objc_msgSend(v4, "setImageIsRightAligned:", -[SFRowCardSection imageIsRightAligned](self, "imageIsRightAligned"));
  -[SFRowCardSection leadingText](self, "leadingText");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");
  objc_msgSend(v4, "setLeadingText:", v18);

  -[SFRowCardSection trailingText](self, "trailingText");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");
  objc_msgSend(v4, "setTrailingText:", v20);

  -[SFRowCardSection attributionImage](self, "attributionImage");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "copy");
  objc_msgSend(v4, "setAttributionImage:", v22);

  -[SFRowCardSection key](self, "key");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v23, "copy");
  objc_msgSend(v4, "setKey:", v24);

  objc_msgSend(v4, "setKeyNoWrap:", -[SFRowCardSection keyNoWrap](self, "keyNoWrap"));
  -[SFRowCardSection keyWeight](self, "keyWeight");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v25, "copy");
  objc_msgSend(v4, "setKeyWeight:", v26);

  -[SFRowCardSection value](self, "value");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v27, "copy");
  objc_msgSend(v4, "setValue:", v28);

  objc_msgSend(v4, "setValueNoWrap:", -[SFRowCardSection valueNoWrap](self, "valueNoWrap"));
  -[SFRowCardSection valueWeight](self, "valueWeight");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v29, "copy");
  objc_msgSend(v4, "setValueWeight:", v30);

  objc_msgSend(v4, "setCardPaddingBottom:", -[SFRowCardSection cardPaddingBottom](self, "cardPaddingBottom"));
  -[SFRowCardSection leadingSubtitle](self, "leadingSubtitle");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v31, "copy");
  objc_msgSend(v4, "setLeadingSubtitle:", v32);

  -[SFRowCardSection trailingSubtitle](self, "trailingSubtitle");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend(v33, "copy");
  objc_msgSend(v4, "setTrailingSubtitle:", v34);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  SFRowCardSection *v6;
  SFRowCardSection *v7;
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
  void *v19;
  int v20;
  int v21;
  int v22;
  uint64_t v24;
  _BOOL4 v25;
  uint64_t v26;
  SFRowCardSection *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  SFRowCardSection *v50;
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
  int v120;
  int v121;
  int v122;
  int v123;
  int v124;
  int v125;
  int v126;
  int v127;
  int v128;
  int v129;
  uint64_t v130;
  _BYTE v131[12];
  uint64_t v132;
  uint64_t v133;
  __int128 v134;
  uint64_t v135;
  _BYTE v136[12];
  _BOOL4 v137;
  uint64_t v138;
  int v139;
  int v140;
  id v141;
  id v142;
  _BOOL4 v143;
  _BOOL4 v144;
  _BOOL4 v145;
  _BYTE v146[20];
  objc_super v147;

  v6 = (SFRowCardSection *)a3;
  if (self == v6)
  {
    v17 = 1;
    goto LABEL_105;
  }
  if (!-[SFRowCardSection isMemberOfClass:](v6, "isMemberOfClass:", objc_opt_class())
    || (v147.receiver = self,
        v147.super_class = (Class)SFRowCardSection,
        !-[SFCardSection isEqual:](&v147, sel_isEqual_, v6)))
  {
    v17 = 0;
    goto LABEL_105;
  }
  v7 = v6;
  -[SFCardSection punchoutOptions](self, "punchoutOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8 == 0;
  -[SFCardSection punchoutOptions](v7, "punchoutOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10 != 0;
  v141 = v10;
  v142 = v8;
  v139 = v11;
  v140 = v9;
  if ((_DWORD)v9 == (_DWORD)v11)
  {
    v138 = 0;
    memset(v136, 0, sizeof(v136));
    v134 = 0uLL;
    v133 = 0;
    v130 = 0;
    memset(v131, 0, sizeof(v131));
    memset(v146, 0, sizeof(v146));
    v126 = 0;
    v129 = 0;
    v145 = 0;
    v122 = 0;
    v125 = 0;
    v144 = 0;
    v120 = 0;
    v121 = 0;
    v143 = 0;
    v123 = 0;
    v128 = 0;
    v137 = 0;
    v124 = 0;
    v127 = 0;
    v132 = 0;
    v135 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
  }
  else
  {
    -[SFCardSection punchoutOptions](self, "punchoutOptions");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = v3 != 0;
    v119 = (void *)v3;
    if (!v3
      || (-[SFCardSection punchoutOptions](self, "punchoutOptions"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          -[SFCardSection punchoutOptions](v7, "punchoutOptions"),
          v116 = v12,
          v115 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v12, "isEqual:")))
    {
      -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCardSection punchoutPickerTitle](v7, "punchoutPickerTitle");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      HIDWORD(v138) = v3 != 0;
      if ((v118 == 0) == (v117 != 0))
      {
        *(_DWORD *)v136 = 0;
        v134 = 0uLL;
        LODWORD(v138) = 0;
        v133 = 0;
        v130 = 0;
        memset(v131, 0, sizeof(v131));
        memset(v146, 0, sizeof(v146));
        v126 = 0;
        v129 = 0;
        v145 = 0;
        v122 = 0;
        v125 = 0;
        v144 = 0;
        v120 = 0;
        v121 = 0;
        v143 = 0;
        v123 = 0;
        v128 = 0;
        v137 = 0;
        v124 = 0;
        v127 = 0;
        v132 = 0;
        v135 = 0;
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v17 = 0;
        *(_QWORD *)&v136[4] = 1;
      }
      else
      {
        -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
        v18 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)&v146[16] = v18 != 0;
        v114 = (void *)v18;
        if (!v18
          || (-[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle"),
              v19 = (void *)objc_claimAutoreleasedReturnValue(),
              -[SFCardSection punchoutPickerTitle](v7, "punchoutPickerTitle"),
              v110 = (void *)objc_claimAutoreleasedReturnValue(),
              v111 = v19,
              objc_msgSend(v19, "isEqual:")))
        {
          -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFCardSection punchoutPickerDismissText](v7, "punchoutPickerDismissText");
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          if ((v113 == 0) != (v112 != 0))
          {
            -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
            v24 = objc_claimAutoreleasedReturnValue();
            v25 = v24 != 0;
            v109 = (void *)v24;
            if (v24)
            {
              -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
              v26 = objc_claimAutoreleasedReturnValue();
              v27 = v7;
              v28 = (void *)v26;
              v50 = v27;
              -[SFCardSection punchoutPickerDismissText](v27, "punchoutPickerDismissText");
              v107 = (void *)objc_claimAutoreleasedReturnValue();
              v108 = v28;
              if (!objc_msgSend(v28, "isEqual:"))
              {
                *(_QWORD *)((char *)&v134 + 4) = 0;
                *(_QWORD *)&v146[8] = 0;
                v133 = 0;
                *(_QWORD *)v146 = 0;
                v130 = 0;
                memset(v131, 0, sizeof(v131));
                v126 = 0;
                v129 = 0;
                v145 = 0;
                v122 = 0;
                v125 = 0;
                v144 = 0;
                v120 = 0;
                v121 = 0;
                v143 = 0;
                v123 = 0;
                v128 = 0;
                v137 = 0;
                v124 = 0;
                v127 = 0;
                v132 = 0;
                v135 = 0;
                v13 = 0;
                v14 = 0;
                v15 = 0;
                v16 = 0;
                v17 = 0;
                *(_DWORD *)&v136[8] = 0;
                *(_QWORD *)v136 = 0x100000001;
                HIDWORD(v134) = 1;
                LODWORD(v134) = 1;
                LODWORD(v138) = 1;
                v7 = v50;
                goto LABEL_16;
              }
              v7 = v50;
            }
            v3 = -[SFCardSection canBeHidden](self, "canBeHidden");
            LODWORD(v138) = v25;
            if ((_DWORD)v3 == -[SFCardSection canBeHidden](v7, "canBeHidden")
              && (v3 = -[SFCardSection hasTopPadding](self, "hasTopPadding"),
                  (_DWORD)v3 == -[SFCardSection hasTopPadding](v7, "hasTopPadding"))
              && (v3 = -[SFCardSection hasBottomPadding](self, "hasBottomPadding"),
                  (_DWORD)v3 == -[SFCardSection hasBottomPadding](v7, "hasBottomPadding")))
            {
              -[SFRowCardSection type](self, "type");
              v3 = objc_claimAutoreleasedReturnValue();
              -[SFRowCardSection type](v7, "type");
              v105 = (void *)objc_claimAutoreleasedReturnValue();
              v106 = (void *)v3;
              if ((v3 == 0) == (v105 != 0))
              {
                *(_QWORD *)((char *)&v134 + 4) = 0x100000000;
                *(_QWORD *)&v146[8] = 0;
                v133 = 0;
                *(_QWORD *)v146 = 0;
                v130 = 0;
                memset(v131, 0, sizeof(v131));
                v126 = 0;
                v129 = 0;
                v145 = 0;
                v122 = 0;
                v125 = 0;
                v144 = 0;
                v120 = 0;
                v121 = 0;
                v143 = 0;
                v123 = 0;
                v128 = 0;
                v137 = 0;
                v124 = 0;
                v127 = 0;
                v132 = 0;
                v135 = 0;
                v13 = 0;
                v14 = 0;
                v15 = 0;
                v16 = 0;
                v17 = 0;
                *(_DWORD *)&v136[8] = 0;
                *(_QWORD *)v136 = 0x100000001;
                HIDWORD(v134) = 1;
                LODWORD(v134) = 1;
              }
              else
              {
                -[SFRowCardSection type](self, "type");
                v104 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)&v146[12] = v104 != 0;
                if (!v104
                  || (-[SFRowCardSection type](self, "type"),
                      v29 = (void *)objc_claimAutoreleasedReturnValue(),
                      -[SFRowCardSection type](v7, "type"),
                      v102 = (void *)objc_claimAutoreleasedReturnValue(),
                      v103 = v29,
                      objc_msgSend(v29, "isEqual:")))
                {
                  v3 = -[SFCardSection separatorStyle](self, "separatorStyle");
                  if ((_DWORD)v3 == -[SFCardSection separatorStyle](v7, "separatorStyle"))
                  {
                    -[SFCardSection backgroundColor](self, "backgroundColor");
                    v101 = (void *)objc_claimAutoreleasedReturnValue();
                    -[SFCardSection backgroundColor](v7, "backgroundColor");
                    v100 = (void *)objc_claimAutoreleasedReturnValue();
                    if ((v101 == 0) == (v100 != 0))
                    {
                      *(_QWORD *)&v146[4] = 0;
                      v130 = 0;
                      memset(v131, 0, sizeof(v131));
                      *(_DWORD *)v146 = 0;
                      v126 = 0;
                      v129 = 0;
                      v145 = 0;
                      v122 = 0;
                      v125 = 0;
                      v144 = 0;
                      v120 = 0;
                      v121 = 0;
                      v143 = 0;
                      v123 = 0;
                      v128 = 0;
                      v137 = 0;
                      v124 = 0;
                      v127 = 0;
                      v132 = 0;
                      v135 = 0;
                      v13 = 0;
                      v14 = 0;
                      v15 = 0;
                      v16 = 0;
                      v17 = 0;
                      *(_DWORD *)&v136[8] = 0;
                      *(_QWORD *)v136 = 0x100000001;
                      *((_QWORD *)&v134 + 1) = 0x100000001;
                      *(_QWORD *)&v134 = 0x100000001;
                      v133 = 1;
                    }
                    else
                    {
                      -[SFCardSection backgroundColor](self, "backgroundColor");
                      v30 = objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)&v146[8] = v30 != 0;
                      v99 = (void *)v30;
                      if (!v30
                        || (-[SFCardSection backgroundColor](self, "backgroundColor"),
                            v31 = (void *)objc_claimAutoreleasedReturnValue(),
                            -[SFCardSection backgroundColor](v7, "backgroundColor"),
                            v95 = (void *)objc_claimAutoreleasedReturnValue(),
                            v96 = v31,
                            objc_msgSend(v31, "isEqual:")))
                      {
                        -[SFRowCardSection image](self, "image");
                        v98 = (void *)objc_claimAutoreleasedReturnValue();
                        -[SFRowCardSection image](v7, "image");
                        v97 = (void *)objc_claimAutoreleasedReturnValue();
                        if ((v98 == 0) == (v97 != 0))
                        {
                          *(_QWORD *)v131 = 0;
                          *(_QWORD *)v146 = 0;
                          v130 = 0;
                          v126 = 0;
                          v129 = 0;
                          v145 = 0;
                          v122 = 0;
                          v125 = 0;
                          v144 = 0;
                          v120 = 0;
                          v121 = 0;
                          v143 = 0;
                          v123 = 0;
                          v128 = 0;
                          v137 = 0;
                          v124 = 0;
                          v127 = 0;
                          v132 = 0;
                          v135 = 0;
                          v13 = 0;
                          v14 = 0;
                          v15 = 0;
                          v16 = 0;
                          v17 = 0;
                          *(_DWORD *)&v136[8] = 0;
                          *(_QWORD *)v136 = 0x100000001;
                          *((_QWORD *)&v134 + 1) = 0x100000001;
                          *(_QWORD *)&v134 = 0x100000001;
                          v133 = 0x100000001;
                          *(_DWORD *)&v131[8] = 1;
                        }
                        else
                        {
                          -[SFRowCardSection image](self, "image");
                          v32 = objc_claimAutoreleasedReturnValue();
                          *(_DWORD *)&v146[4] = v32 != 0;
                          v94 = (void *)v32;
                          if (!v32
                            || (-[SFRowCardSection image](self, "image"),
                                v33 = (void *)objc_claimAutoreleasedReturnValue(),
                                -[SFRowCardSection image](v7, "image"),
                                v92 = (void *)objc_claimAutoreleasedReturnValue(),
                                v93 = v33,
                                objc_msgSend(v33, "isEqual:")))
                          {
                            v3 = -[SFRowCardSection imageIsRightAligned](self, "imageIsRightAligned");
                            if ((_DWORD)v3 == -[SFRowCardSection imageIsRightAligned](v7, "imageIsRightAligned"))
                            {
                              -[SFRowCardSection leadingText](self, "leadingText");
                              v91 = (void *)objc_claimAutoreleasedReturnValue();
                              -[SFRowCardSection leadingText](v7, "leadingText");
                              v90 = (void *)objc_claimAutoreleasedReturnValue();
                              if ((v91 == 0) == (v90 != 0))
                              {
                                *(_QWORD *)v131 = 0x100000000;
                                *(_DWORD *)v146 = 0;
                                v126 = 0;
                                v129 = 0;
                                v145 = 0;
                                v122 = 0;
                                v125 = 0;
                                v144 = 0;
                                v120 = 0;
                                v121 = 0;
                                v143 = 0;
                                v123 = 0;
                                v128 = 0;
                                v137 = 0;
                                v124 = 0;
                                v127 = 0;
                                v132 = 0;
                                v135 = 0;
                                v13 = 0;
                                v14 = 0;
                                v15 = 0;
                                v16 = 0;
                                v17 = 0;
                                *(_DWORD *)&v136[8] = 0;
                                *(_QWORD *)v136 = 0x100000001;
                                *((_QWORD *)&v134 + 1) = 0x100000001;
                                *(_QWORD *)&v134 = 0x100000001;
                                v133 = 0x100000001;
                                *(_DWORD *)&v131[8] = 1;
                                v130 = 1;
                              }
                              else
                              {
                                -[SFRowCardSection leadingText](self, "leadingText");
                                v34 = objc_claimAutoreleasedReturnValue();
                                *(_DWORD *)v146 = v34 != 0;
                                v89 = (void *)v34;
                                if (!v34
                                  || (-[SFRowCardSection leadingText](self, "leadingText"),
                                      v35 = (void *)objc_claimAutoreleasedReturnValue(),
                                      -[SFRowCardSection leadingText](v7, "leadingText"),
                                      v85 = (void *)objc_claimAutoreleasedReturnValue(),
                                      v86 = v35,
                                      objc_msgSend(v35, "isEqual:")))
                                {
                                  -[SFRowCardSection trailingText](self, "trailingText");
                                  v88 = (void *)objc_claimAutoreleasedReturnValue();
                                  -[SFRowCardSection trailingText](v7, "trailingText");
                                  v87 = (void *)objc_claimAutoreleasedReturnValue();
                                  if ((v88 == 0) == (v87 != 0))
                                  {
                                    v129 = 0;
                                    v145 = 0;
                                    v122 = 0;
                                    v125 = 0;
                                    v144 = 0;
                                    v120 = 0;
                                    v121 = 0;
                                    v143 = 0;
                                    v123 = 0;
                                    v128 = 0;
                                    v137 = 0;
                                    v124 = 0;
                                    v127 = 0;
                                    v132 = 0;
                                    v135 = 0;
                                    v13 = 0;
                                    v14 = 0;
                                    v15 = 0;
                                    v16 = 0;
                                    v17 = 0;
                                    *(_DWORD *)&v136[8] = 0;
                                    *(_QWORD *)v136 = 0x100000001;
                                    *((_QWORD *)&v134 + 1) = 0x100000001;
                                    *(_QWORD *)&v134 = 0x100000001;
                                    v133 = 0x100000001;
                                    *(_DWORD *)&v131[8] = 1;
                                    v130 = 1;
                                    *(_QWORD *)v131 = 0x100000001;
                                    v126 = 1;
                                  }
                                  else
                                  {
                                    -[SFRowCardSection trailingText](self, "trailingText");
                                    v36 = objc_claimAutoreleasedReturnValue();
                                    v145 = v36 != 0;
                                    v84 = (void *)v36;
                                    if (!v36
                                      || (-[SFRowCardSection trailingText](self, "trailingText"),
                                          v37 = (void *)objc_claimAutoreleasedReturnValue(),
                                          -[SFRowCardSection trailingText](v7, "trailingText"),
                                          v80 = (void *)objc_claimAutoreleasedReturnValue(),
                                          v81 = v37,
                                          objc_msgSend(v37, "isEqual:")))
                                    {
                                      -[SFRowCardSection attributionImage](self, "attributionImage");
                                      v83 = (void *)objc_claimAutoreleasedReturnValue();
                                      -[SFRowCardSection attributionImage](v7, "attributionImage");
                                      v82 = (void *)objc_claimAutoreleasedReturnValue();
                                      if ((v83 == 0) == (v82 != 0))
                                      {
                                        v125 = 0;
                                        v144 = 0;
                                        v120 = 0;
                                        v121 = 0;
                                        v143 = 0;
                                        v123 = 0;
                                        v128 = 0;
                                        v137 = 0;
                                        v124 = 0;
                                        v127 = 0;
                                        v132 = 0;
                                        v135 = 0;
                                        v13 = 0;
                                        v14 = 0;
                                        v15 = 0;
                                        v16 = 0;
                                        v17 = 0;
                                        *(_DWORD *)&v136[8] = 0;
                                        *(_QWORD *)v136 = 0x100000001;
                                        *((_QWORD *)&v134 + 1) = 0x100000001;
                                        *(_QWORD *)&v134 = 0x100000001;
                                        v133 = 0x100000001;
                                        *(_DWORD *)&v131[8] = 1;
                                        v130 = 1;
                                        *(_QWORD *)v131 = 0x100000001;
                                        v126 = 1;
                                        v129 = 1;
                                        v122 = 1;
                                      }
                                      else
                                      {
                                        -[SFRowCardSection attributionImage](self, "attributionImage");
                                        v38 = objc_claimAutoreleasedReturnValue();
                                        v144 = v38 != 0;
                                        v79 = (void *)v38;
                                        if (!v38
                                          || (-[SFRowCardSection attributionImage](self, "attributionImage"),
                                              v39 = (void *)objc_claimAutoreleasedReturnValue(),
                                              -[SFRowCardSection attributionImage](v7, "attributionImage"),
                                              v75 = (void *)objc_claimAutoreleasedReturnValue(),
                                              v76 = v39,
                                              objc_msgSend(v39, "isEqual:")))
                                        {
                                          -[SFRowCardSection key](self, "key");
                                          v78 = (void *)objc_claimAutoreleasedReturnValue();
                                          -[SFRowCardSection key](v7, "key");
                                          v77 = (void *)objc_claimAutoreleasedReturnValue();
                                          if ((v78 == 0) == (v77 != 0))
                                          {
                                            v121 = 0;
                                            v143 = 0;
                                            v123 = 0;
                                            v128 = 0;
                                            v137 = 0;
                                            v124 = 0;
                                            v127 = 0;
                                            v132 = 0;
                                            v135 = 0;
                                            v13 = 0;
                                            v14 = 0;
                                            v15 = 0;
                                            v16 = 0;
                                            v17 = 0;
                                            *(_DWORD *)&v136[8] = 0;
                                            *(_QWORD *)v136 = 0x100000001;
                                            *((_QWORD *)&v134 + 1) = 0x100000001;
                                            *(_QWORD *)&v134 = 0x100000001;
                                            v133 = 0x100000001;
                                            *(_DWORD *)&v131[8] = 1;
                                            v130 = 1;
                                            *(_QWORD *)v131 = 0x100000001;
                                            v126 = 1;
                                            v129 = 1;
                                            v122 = 1;
                                            v125 = 1;
                                            v120 = 1;
                                          }
                                          else
                                          {
                                            -[SFRowCardSection key](self, "key");
                                            v40 = objc_claimAutoreleasedReturnValue();
                                            v143 = v40 != 0;
                                            v74 = (void *)v40;
                                            if (!v40
                                              || (-[SFRowCardSection key](self, "key"),
                                                  v41 = (void *)objc_claimAutoreleasedReturnValue(),
                                                  -[SFRowCardSection key](v7, "key"),
                                                  v72 = (void *)objc_claimAutoreleasedReturnValue(),
                                                  v73 = v41,
                                                  objc_msgSend(v41, "isEqual:")))
                                            {
                                              v3 = -[SFRowCardSection keyNoWrap](self, "keyNoWrap");
                                              if ((_DWORD)v3 == -[SFRowCardSection keyNoWrap](v7, "keyNoWrap"))
                                              {
                                                -[SFRowCardSection keyWeight](self, "keyWeight");
                                                v71 = (void *)objc_claimAutoreleasedReturnValue();
                                                -[SFRowCardSection keyWeight](v7, "keyWeight");
                                                v70 = (void *)objc_claimAutoreleasedReturnValue();
                                                if ((v71 == 0) == (v70 != 0))
                                                {
                                                  v128 = 0;
                                                  v137 = 0;
                                                  v124 = 0;
                                                  v127 = 0;
                                                  v132 = 0;
                                                  v135 = 0;
                                                  v13 = 0;
                                                  v14 = 0;
                                                  v15 = 0;
                                                  v16 = 0;
                                                  v17 = 0;
                                                  *(_DWORD *)&v136[8] = 0;
                                                  *(_QWORD *)v136 = 0x100000001;
                                                  *((_QWORD *)&v134 + 1) = 0x100000001;
                                                  *(_QWORD *)&v134 = 0x100000001;
                                                  v133 = 0x100000001;
                                                  *(_DWORD *)&v131[8] = 1;
                                                  v130 = 1;
                                                  *(_QWORD *)v131 = 0x100000001;
                                                  v126 = 1;
                                                  v129 = 1;
                                                  v122 = 1;
                                                  v125 = 1;
                                                  v120 = 1;
                                                  v121 = 1;
                                                  v123 = 1;
                                                }
                                                else
                                                {
                                                  -[SFRowCardSection keyWeight](self, "keyWeight");
                                                  v42 = objc_claimAutoreleasedReturnValue();
                                                  v137 = v42 != 0;
                                                  v69 = (void *)v42;
                                                  if (!v42
                                                    || (-[SFRowCardSection keyWeight](self, "keyWeight"),
                                                        v43 = (void *)objc_claimAutoreleasedReturnValue(),
                                                        -[SFRowCardSection keyWeight](v7, "keyWeight"),
                                                        v65 = (void *)objc_claimAutoreleasedReturnValue(),
                                                        v66 = v43,
                                                        objc_msgSend(v43, "isEqual:")))
                                                  {
                                                    -[SFRowCardSection value](self, "value");
                                                    v68 = (void *)objc_claimAutoreleasedReturnValue();
                                                    -[SFRowCardSection value](v7, "value");
                                                    v67 = (void *)objc_claimAutoreleasedReturnValue();
                                                    if ((v68 == 0) == (v67 != 0))
                                                    {
                                                      v127 = 0;
                                                      v132 = 0;
                                                      v135 = 0;
                                                      v13 = 0;
                                                      v14 = 0;
                                                      v15 = 0;
                                                      v16 = 0;
                                                      v17 = 0;
                                                      *(_DWORD *)&v136[8] = 0;
                                                      *(_QWORD *)v136 = 0x100000001;
                                                      *((_QWORD *)&v134 + 1) = 0x100000001;
                                                      *(_QWORD *)&v134 = 0x100000001;
                                                      v133 = 0x100000001;
                                                      *(_DWORD *)&v131[8] = 1;
                                                      v130 = 1;
                                                      *(_QWORD *)v131 = 0x100000001;
                                                      v126 = 1;
                                                      v129 = 1;
                                                      v122 = 1;
                                                      v125 = 1;
                                                      v120 = 1;
                                                      v121 = 1;
                                                      v123 = 1;
                                                      v128 = 1;
                                                      v124 = 1;
                                                    }
                                                    else
                                                    {
                                                      -[SFRowCardSection value](self, "value");
                                                      v44 = objc_claimAutoreleasedReturnValue();
                                                      *(_DWORD *)&v136[8] = v44 != 0;
                                                      v62 = (void *)v44;
                                                      if (!v44
                                                        || (-[SFRowCardSection value](self, "value"),
                                                            v45 = (void *)objc_claimAutoreleasedReturnValue(),
                                                            -[SFRowCardSection value](v7, "value"),
                                                            v63 = (void *)objc_claimAutoreleasedReturnValue(),
                                                            v64 = v45,
                                                            objc_msgSend(v45, "isEqual:")))
                                                      {
                                                        v3 = -[SFRowCardSection valueNoWrap](self, "valueNoWrap");
                                                        if ((_DWORD)v3 == -[SFRowCardSection valueNoWrap](v7, "valueNoWrap"))
                                                        {
                                                          -[SFRowCardSection valueWeight](self, "valueWeight");
                                                          v61 = (void *)objc_claimAutoreleasedReturnValue();
                                                          -[SFRowCardSection valueWeight](v7, "valueWeight");
                                                          v60 = (void *)objc_claimAutoreleasedReturnValue();
                                                          if ((v61 == 0) == (v60 != 0))
                                                          {
                                                            v132 = 0;
                                                            v135 = 0;
                                                            v13 = 0;
                                                            v14 = 0;
                                                            v15 = 0;
                                                            v16 = 0;
                                                            v17 = 0;
                                                            *(_QWORD *)v136 = 0x100000001;
                                                            *((_QWORD *)&v134 + 1) = 0x100000001;
                                                            *(_QWORD *)&v134 = 0x100000001;
                                                            v133 = 0x100000001;
                                                            *(_DWORD *)&v131[8] = 1;
                                                            v130 = 0x100000001;
                                                            *(_QWORD *)v131 = 0x100000001;
                                                            v126 = 1;
                                                            v129 = 1;
                                                            v122 = 1;
                                                            v125 = 1;
                                                            v120 = 1;
                                                            v121 = 1;
                                                            v123 = 1;
                                                            v128 = 1;
                                                            v124 = 1;
                                                            v127 = 1;
                                                          }
                                                          else
                                                          {
                                                            -[SFRowCardSection valueWeight](self, "valueWeight");
                                                            v46 = objc_claimAutoreleasedReturnValue();
                                                            HIDWORD(v135) = v46 != 0;
                                                            v57 = (void *)v46;
                                                            if (!v46
                                                              || (-[SFRowCardSection valueWeight](self, "valueWeight"),
                                                                  v47 = (void *)objc_claimAutoreleasedReturnValue(),
                                                                  -[SFRowCardSection valueWeight](v7, "valueWeight"),
                                                                  v58 = (void *)objc_claimAutoreleasedReturnValue(),
                                                                  v59 = v47,
                                                                  objc_msgSend(v47, "isEqual:")))
                                                            {
                                                              v3 = -[SFRowCardSection cardPaddingBottom](self, "cardPaddingBottom");
                                                              if ((_DWORD)v3 == -[SFRowCardSection cardPaddingBottom](v7, "cardPaddingBottom"))
                                                              {
                                                                -[SFRowCardSection leadingSubtitle](self, "leadingSubtitle");
                                                                v56 = (void *)objc_claimAutoreleasedReturnValue();
                                                                -[SFRowCardSection leadingSubtitle](v7, "leadingSubtitle");
                                                                v55 = (void *)objc_claimAutoreleasedReturnValue();
                                                                if ((v56 == 0) == (v55 != 0))
                                                                {
                                                                  v13 = 0;
                                                                  v14 = 0;
                                                                  v15 = 0;
                                                                  v16 = 0;
                                                                  v17 = 0;
                                                                  *(_QWORD *)v136 = 0x100000001;
                                                                  HIDWORD(v134) = 1;
                                                                  LODWORD(v135) = 0;
                                                                  LODWORD(v134) = 1;
                                                                  *(_QWORD *)((char *)&v134 + 4) = 0x100000001;
                                                                  v133 = 0x100000001;
                                                                  *(_DWORD *)&v131[8] = 1;
                                                                  v130 = 0x100000001;
                                                                  *(_QWORD *)v131 = 0x100000001;
                                                                  v126 = 1;
                                                                  v129 = 1;
                                                                  v122 = 1;
                                                                  v125 = 1;
                                                                  v120 = 1;
                                                                  v121 = 1;
                                                                  v123 = 1;
                                                                  v128 = 1;
                                                                  v124 = 1;
                                                                  v127 = 1;
                                                                  v132 = 0x100000001;
                                                                }
                                                                else
                                                                {
                                                                  -[SFRowCardSection leadingSubtitle](self, "leadingSubtitle");
                                                                  v48 = objc_claimAutoreleasedReturnValue();
                                                                  LODWORD(v135) = v48 != 0;
                                                                  v52 = (void *)v48;
                                                                  if (!v48
                                                                    || (-[SFRowCardSection leadingSubtitle](self, "leadingSubtitle"), v49 = (void *)objc_claimAutoreleasedReturnValue(), -[SFRowCardSection leadingSubtitle](v7, "leadingSubtitle"), v53 = (void *)objc_claimAutoreleasedReturnValue(), v54 = v49, objc_msgSend(v49, "isEqual:")))
                                                                  {
                                                                    -[SFRowCardSection trailingSubtitle](self, "trailingSubtitle");
                                                                    v51 = (void *)objc_claimAutoreleasedReturnValue();
                                                                    -[SFRowCardSection trailingSubtitle](v7, "trailingSubtitle");
                                                                    v9 = objc_claimAutoreleasedReturnValue();
                                                                    if ((v51 == 0) == (v9 != 0))
                                                                    {
                                                                      v15 = 0;
                                                                      v16 = 0;
                                                                      v17 = 0;
                                                                      *(_QWORD *)v136 = 0x100000001;
                                                                      *((_QWORD *)&v134 + 1) = 0x100000001;
                                                                      *(_QWORD *)&v134 = 0x100000001;
                                                                      v133 = 0x100000001;
                                                                      *(_DWORD *)&v131[8] = 1;
                                                                      v130 = 0x100000001;
                                                                      *(_QWORD *)v131 = 0x100000001;
                                                                      v126 = 1;
                                                                      v129 = 1;
                                                                      v122 = 1;
                                                                      v125 = 1;
                                                                      v120 = 1;
                                                                      v121 = 1;
                                                                      v123 = 1;
                                                                      v128 = 1;
                                                                      v124 = 1;
                                                                      v127 = 1;
                                                                      v132 = 0x100000001;
                                                                      v13 = 1;
                                                                      v14 = 1;
                                                                    }
                                                                    else
                                                                    {
                                                                      -[SFRowCardSection trailingSubtitle](self, "trailingSubtitle");
                                                                      v11 = objc_claimAutoreleasedReturnValue();
                                                                      if (v11)
                                                                      {
                                                                        -[SFRowCardSection trailingSubtitle](self, "trailingSubtitle");
                                                                        v4 = objc_claimAutoreleasedReturnValue();
                                                                        -[SFRowCardSection trailingSubtitle](v7, "trailingSubtitle");
                                                                        v3 = objc_claimAutoreleasedReturnValue();
                                                                        v17 = objc_msgSend((id)v4, "isEqual:", v3);
                                                                        v16 = 1;
                                                                        *(_QWORD *)v136 = 0x100000001;
                                                                        *((_QWORD *)&v134 + 1) = 0x100000001;
                                                                        *(_QWORD *)&v134 = 0x100000001;
                                                                        v133 = 0x100000001;
                                                                        *(_DWORD *)&v131[8] = 1;
                                                                        v130 = 0x100000001;
                                                                        *(_QWORD *)v131 = 0x100000001;
                                                                        v126 = 1;
                                                                        v129 = 1;
                                                                        v122 = 1;
                                                                        v125 = 1;
                                                                        v120 = 1;
                                                                        v121 = 1;
                                                                        v123 = 1;
                                                                        v128 = 1;
                                                                        v124 = 1;
                                                                        v127 = 1;
                                                                        v132 = 0x100000001;
                                                                        v13 = 1;
                                                                        v14 = 1;
                                                                        v15 = 1;
                                                                      }
                                                                      else
                                                                      {
                                                                        v16 = 0;
                                                                        *(_QWORD *)v136 = 0x100000001;
                                                                        *((_QWORD *)&v134 + 1) = 0x100000001;
                                                                        *(_QWORD *)&v134 = 0x100000001;
                                                                        v133 = 0x100000001;
                                                                        *(_DWORD *)&v131[8] = 1;
                                                                        v130 = 0x100000001;
                                                                        *(_QWORD *)v131 = 0x100000001;
                                                                        v126 = 1;
                                                                        v129 = 1;
                                                                        v122 = 1;
                                                                        v125 = 1;
                                                                        v120 = 1;
                                                                        v121 = 1;
                                                                        v123 = 1;
                                                                        v128 = 1;
                                                                        v124 = 1;
                                                                        v127 = 1;
                                                                        v132 = 0x100000001;
                                                                        v13 = 1;
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
                                                                    *(_QWORD *)v136 = 0x100000001;
                                                                    *((_QWORD *)&v134 + 1) = 0x100000001;
                                                                    *(_QWORD *)&v134 = 0x100000001;
                                                                    v133 = 0x100000001;
                                                                    *(_DWORD *)&v131[8] = 1;
                                                                    v130 = 0x100000001;
                                                                    *(_QWORD *)v131 = 0x100000001;
                                                                    v126 = 1;
                                                                    v129 = 1;
                                                                    v122 = 1;
                                                                    v125 = 1;
                                                                    v120 = 1;
                                                                    v121 = 1;
                                                                    v123 = 1;
                                                                    v128 = 1;
                                                                    v124 = 1;
                                                                    v127 = 1;
                                                                    v132 = 0x100000001;
                                                                    v13 = 1;
                                                                    LODWORD(v135) = 1;
                                                                  }
                                                                }
                                                              }
                                                              else
                                                              {
                                                                v13 = 0;
                                                                v14 = 0;
                                                                v15 = 0;
                                                                v16 = 0;
                                                                v17 = 0;
                                                                *(_QWORD *)v136 = 0x100000001;
                                                                HIDWORD(v134) = 1;
                                                                LODWORD(v135) = 0;
                                                                LODWORD(v134) = 1;
                                                                *(_QWORD *)((char *)&v134 + 4) = 0x100000001;
                                                                v133 = 0x100000001;
                                                                *(_DWORD *)&v131[8] = 1;
                                                                v130 = 0x100000001;
                                                                *(_QWORD *)v131 = 0x100000001;
                                                                v126 = 1;
                                                                v129 = 1;
                                                                v122 = 1;
                                                                v125 = 1;
                                                                v120 = 1;
                                                                v121 = 1;
                                                                v123 = 1;
                                                                v128 = 1;
                                                                v124 = 1;
                                                                v127 = 1;
                                                                v132 = 1;
                                                              }
                                                            }
                                                            else
                                                            {
                                                              v13 = 0;
                                                              v14 = 0;
                                                              v15 = 0;
                                                              v16 = 0;
                                                              v17 = 0;
                                                              *(_QWORD *)v136 = 0x100000001;
                                                              HIDWORD(v134) = 1;
                                                              v135 = 0x100000000;
                                                              LODWORD(v134) = 1;
                                                              *(_QWORD *)((char *)&v134 + 4) = 0x100000001;
                                                              v133 = 0x100000001;
                                                              *(_DWORD *)&v131[8] = 1;
                                                              v130 = 0x100000001;
                                                              *(_QWORD *)v131 = 0x100000001;
                                                              v126 = 1;
                                                              v129 = 1;
                                                              v122 = 1;
                                                              v125 = 1;
                                                              v120 = 1;
                                                              v121 = 1;
                                                              v123 = 1;
                                                              v128 = 1;
                                                              v124 = 1;
                                                              v127 = 1;
                                                              v132 = 1;
                                                            }
                                                          }
                                                        }
                                                        else
                                                        {
                                                          v132 = 0;
                                                          v135 = 0;
                                                          v13 = 0;
                                                          v14 = 0;
                                                          v15 = 0;
                                                          v16 = 0;
                                                          v17 = 0;
                                                          *(_QWORD *)v136 = 0x100000001;
                                                          *((_QWORD *)&v134 + 1) = 0x100000001;
                                                          *(_QWORD *)&v134 = 0x100000001;
                                                          v133 = 0x100000001;
                                                          *(_DWORD *)&v131[8] = 1;
                                                          v130 = 1;
                                                          *(_QWORD *)v131 = 0x100000001;
                                                          v126 = 1;
                                                          v129 = 1;
                                                          v122 = 1;
                                                          v125 = 1;
                                                          v120 = 1;
                                                          v121 = 1;
                                                          v123 = 1;
                                                          v128 = 1;
                                                          v124 = 1;
                                                          v127 = 1;
                                                        }
                                                      }
                                                      else
                                                      {
                                                        v132 = 0;
                                                        v135 = 0;
                                                        v13 = 0;
                                                        v14 = 0;
                                                        v15 = 0;
                                                        v16 = 0;
                                                        v17 = 0;
                                                        *(_QWORD *)v136 = 0x100000001;
                                                        *((_QWORD *)&v134 + 1) = 0x100000001;
                                                        *(_QWORD *)&v134 = 0x100000001;
                                                        v133 = 0x100000001;
                                                        *(_DWORD *)&v131[8] = 1;
                                                        v130 = 1;
                                                        *(_QWORD *)v131 = 0x100000001;
                                                        v126 = 1;
                                                        v129 = 1;
                                                        v122 = 1;
                                                        v125 = 1;
                                                        v120 = 1;
                                                        v121 = 1;
                                                        v123 = 1;
                                                        v128 = 1;
                                                        v124 = 1;
                                                        v127 = 1;
                                                        *(_DWORD *)&v136[8] = 1;
                                                      }
                                                    }
                                                  }
                                                  else
                                                  {
                                                    v124 = 0;
                                                    v127 = 0;
                                                    v132 = 0;
                                                    v135 = 0;
                                                    v13 = 0;
                                                    v14 = 0;
                                                    v15 = 0;
                                                    v16 = 0;
                                                    v17 = 0;
                                                    *(_DWORD *)&v136[8] = 0;
                                                    *(_QWORD *)v136 = 0x100000001;
                                                    *((_QWORD *)&v134 + 1) = 0x100000001;
                                                    *(_QWORD *)&v134 = 0x100000001;
                                                    v133 = 0x100000001;
                                                    *(_DWORD *)&v131[8] = 1;
                                                    v130 = 1;
                                                    *(_QWORD *)v131 = 0x100000001;
                                                    v126 = 1;
                                                    v129 = 1;
                                                    v122 = 1;
                                                    v125 = 1;
                                                    v120 = 1;
                                                    v121 = 1;
                                                    v123 = 1;
                                                    v128 = 1;
                                                    v137 = 1;
                                                  }
                                                }
                                              }
                                              else
                                              {
                                                v123 = 0;
                                                v128 = 0;
                                                v137 = 0;
                                                v124 = 0;
                                                v127 = 0;
                                                v132 = 0;
                                                v135 = 0;
                                                v13 = 0;
                                                v14 = 0;
                                                v15 = 0;
                                                v16 = 0;
                                                v17 = 0;
                                                *(_DWORD *)&v136[8] = 0;
                                                *(_QWORD *)v136 = 0x100000001;
                                                *((_QWORD *)&v134 + 1) = 0x100000001;
                                                *(_QWORD *)&v134 = 0x100000001;
                                                v133 = 0x100000001;
                                                *(_DWORD *)&v131[8] = 1;
                                                v130 = 1;
                                                *(_QWORD *)v131 = 0x100000001;
                                                v126 = 1;
                                                v129 = 1;
                                                v122 = 1;
                                                v125 = 1;
                                                v120 = 1;
                                                v121 = 1;
                                              }
                                            }
                                            else
                                            {
                                              v123 = 0;
                                              v128 = 0;
                                              v137 = 0;
                                              v124 = 0;
                                              v127 = 0;
                                              v132 = 0;
                                              v135 = 0;
                                              v13 = 0;
                                              v14 = 0;
                                              v15 = 0;
                                              v16 = 0;
                                              v17 = 0;
                                              *(_DWORD *)&v136[8] = 0;
                                              *(_QWORD *)v136 = 0x100000001;
                                              *((_QWORD *)&v134 + 1) = 0x100000001;
                                              *(_QWORD *)&v134 = 0x100000001;
                                              v133 = 0x100000001;
                                              *(_DWORD *)&v131[8] = 1;
                                              v130 = 1;
                                              *(_QWORD *)v131 = 0x100000001;
                                              v126 = 1;
                                              v129 = 1;
                                              v122 = 1;
                                              v125 = 1;
                                              v120 = 1;
                                              v121 = 1;
                                              v143 = 1;
                                            }
                                          }
                                        }
                                        else
                                        {
                                          v120 = 0;
                                          v121 = 0;
                                          v143 = 0;
                                          v123 = 0;
                                          v128 = 0;
                                          v137 = 0;
                                          v124 = 0;
                                          v127 = 0;
                                          v132 = 0;
                                          v135 = 0;
                                          v13 = 0;
                                          v14 = 0;
                                          v15 = 0;
                                          v16 = 0;
                                          v17 = 0;
                                          *(_DWORD *)&v136[8] = 0;
                                          *(_QWORD *)v136 = 0x100000001;
                                          *((_QWORD *)&v134 + 1) = 0x100000001;
                                          *(_QWORD *)&v134 = 0x100000001;
                                          v133 = 0x100000001;
                                          *(_DWORD *)&v131[8] = 1;
                                          v130 = 1;
                                          *(_QWORD *)v131 = 0x100000001;
                                          v126 = 1;
                                          v129 = 1;
                                          v122 = 1;
                                          v125 = 1;
                                          v144 = 1;
                                        }
                                      }
                                    }
                                    else
                                    {
                                      v122 = 0;
                                      v125 = 0;
                                      v144 = 0;
                                      v120 = 0;
                                      v121 = 0;
                                      v143 = 0;
                                      v123 = 0;
                                      v128 = 0;
                                      v137 = 0;
                                      v124 = 0;
                                      v127 = 0;
                                      v132 = 0;
                                      v135 = 0;
                                      v13 = 0;
                                      v14 = 0;
                                      v15 = 0;
                                      v16 = 0;
                                      v17 = 0;
                                      *(_DWORD *)&v136[8] = 0;
                                      *(_QWORD *)v136 = 0x100000001;
                                      *((_QWORD *)&v134 + 1) = 0x100000001;
                                      *(_QWORD *)&v134 = 0x100000001;
                                      v133 = 0x100000001;
                                      *(_DWORD *)&v131[8] = 1;
                                      v130 = 1;
                                      *(_QWORD *)v131 = 0x100000001;
                                      v126 = 1;
                                      v129 = 1;
                                      v145 = 1;
                                    }
                                  }
                                }
                                else
                                {
                                  v126 = 0;
                                  v129 = 0;
                                  v145 = 0;
                                  v122 = 0;
                                  v125 = 0;
                                  v144 = 0;
                                  v120 = 0;
                                  v121 = 0;
                                  v143 = 0;
                                  v123 = 0;
                                  v128 = 0;
                                  v137 = 0;
                                  v124 = 0;
                                  v127 = 0;
                                  v132 = 0;
                                  v135 = 0;
                                  v13 = 0;
                                  v14 = 0;
                                  v15 = 0;
                                  v16 = 0;
                                  v17 = 0;
                                  *(_DWORD *)&v136[8] = 0;
                                  *(_QWORD *)v136 = 0x100000001;
                                  *((_QWORD *)&v134 + 1) = 0x100000001;
                                  *(_QWORD *)&v134 = 0x100000001;
                                  v133 = 0x100000001;
                                  *(_DWORD *)&v131[8] = 1;
                                  v130 = 1;
                                  *(_QWORD *)v131 = 0x100000001;
                                  *(_DWORD *)v146 = 1;
                                }
                              }
                            }
                            else
                            {
                              v130 = 0;
                              *(_QWORD *)v131 = 0x100000000;
                              *(_DWORD *)v146 = 0;
                              v126 = 0;
                              v129 = 0;
                              v145 = 0;
                              v122 = 0;
                              v125 = 0;
                              v144 = 0;
                              v120 = 0;
                              v121 = 0;
                              v143 = 0;
                              v123 = 0;
                              v128 = 0;
                              v137 = 0;
                              v124 = 0;
                              v127 = 0;
                              v132 = 0;
                              v135 = 0;
                              v13 = 0;
                              v14 = 0;
                              v15 = 0;
                              v16 = 0;
                              v17 = 0;
                              *(_QWORD *)&v136[4] = 1;
                              *(_DWORD *)v136 = 1;
                              *((_QWORD *)&v134 + 1) = 0x100000001;
                              *(_QWORD *)&v134 = 0x100000001;
                              v133 = 0x100000001;
                              *(_DWORD *)&v131[8] = 1;
                            }
                          }
                          else
                          {
                            v130 = 0;
                            *(_QWORD *)v131 = 0x100000000;
                            *(_QWORD *)v146 = 0x100000000;
                            v126 = 0;
                            v129 = 0;
                            v145 = 0;
                            v122 = 0;
                            v125 = 0;
                            v144 = 0;
                            v120 = 0;
                            v121 = 0;
                            v143 = 0;
                            v123 = 0;
                            v128 = 0;
                            v137 = 0;
                            v124 = 0;
                            v127 = 0;
                            v132 = 0;
                            v135 = 0;
                            v13 = 0;
                            v14 = 0;
                            v15 = 0;
                            v16 = 0;
                            v17 = 0;
                            *(_DWORD *)&v136[8] = 0;
                            *(_QWORD *)v136 = 0x100000001;
                            *((_QWORD *)&v134 + 1) = 0x100000001;
                            *(_QWORD *)&v134 = 0x100000001;
                            v133 = 0x100000001;
                            *(_DWORD *)&v131[8] = 1;
                          }
                        }
                      }
                      else
                      {
                        *(_QWORD *)v146 = 0;
                        v130 = 0;
                        memset(v131, 0, sizeof(v131));
                        v126 = 0;
                        v129 = 0;
                        v145 = 0;
                        v122 = 0;
                        v125 = 0;
                        v144 = 0;
                        v120 = 0;
                        v121 = 0;
                        v143 = 0;
                        v123 = 0;
                        v128 = 0;
                        v137 = 0;
                        v124 = 0;
                        v127 = 0;
                        v132 = 0;
                        v135 = 0;
                        v13 = 0;
                        v14 = 0;
                        v15 = 0;
                        v16 = 0;
                        v17 = 0;
                        *(_DWORD *)&v136[8] = 0;
                        *(_QWORD *)v136 = 0x100000001;
                        *((_QWORD *)&v134 + 1) = 0x100000001;
                        *(_QWORD *)&v134 = 0x100000001;
                        v133 = 0x100000001;
                        *(_DWORD *)&v146[8] = 1;
                      }
                    }
                  }
                  else
                  {
                    v133 = 0;
                    *(_QWORD *)&v146[4] = 0;
                    v130 = 0;
                    memset(v131, 0, sizeof(v131));
                    *(_DWORD *)v146 = 0;
                    v126 = 0;
                    v129 = 0;
                    v145 = 0;
                    v122 = 0;
                    v125 = 0;
                    v144 = 0;
                    v120 = 0;
                    v121 = 0;
                    v143 = 0;
                    v123 = 0;
                    v128 = 0;
                    v137 = 0;
                    v124 = 0;
                    v127 = 0;
                    v132 = 0;
                    v135 = 0;
                    v13 = 0;
                    v14 = 0;
                    v15 = 0;
                    v16 = 0;
                    v17 = 0;
                    *(_DWORD *)&v136[8] = 0;
                    *(_QWORD *)v136 = 0x100000001;
                    *((_QWORD *)&v134 + 1) = 0x100000001;
                    *(_QWORD *)&v134 = 0x100000001;
                  }
                }
                else
                {
                  v133 = 0;
                  *(_QWORD *)&v146[4] = 0;
                  v130 = 0;
                  memset(v131, 0, sizeof(v131));
                  *(_DWORD *)v146 = 0;
                  v126 = 0;
                  v129 = 0;
                  v145 = 0;
                  v122 = 0;
                  v125 = 0;
                  v144 = 0;
                  v120 = 0;
                  v121 = 0;
                  v143 = 0;
                  v123 = 0;
                  v128 = 0;
                  v137 = 0;
                  v124 = 0;
                  v127 = 0;
                  v132 = 0;
                  v135 = 0;
                  v13 = 0;
                  v14 = 0;
                  v15 = 0;
                  v16 = 0;
                  v17 = 0;
                  *(_DWORD *)&v136[8] = 0;
                  *(_QWORD *)v136 = 0x100000001;
                  *((_QWORD *)&v134 + 1) = 0x100000001;
                  *(_QWORD *)&v134 = 0x100000001;
                  *(_DWORD *)&v146[12] = 1;
                }
              }
            }
            else
            {
              *(_QWORD *)((char *)&v134 + 4) = 0;
              *(_QWORD *)&v146[8] = 0;
              v133 = 0;
              *(_QWORD *)v146 = 0;
              v130 = 0;
              memset(v131, 0, sizeof(v131));
              v126 = 0;
              v129 = 0;
              v145 = 0;
              v122 = 0;
              v125 = 0;
              v144 = 0;
              v120 = 0;
              v121 = 0;
              v143 = 0;
              v123 = 0;
              v128 = 0;
              v137 = 0;
              v124 = 0;
              v127 = 0;
              v132 = 0;
              v135 = 0;
              v13 = 0;
              v14 = 0;
              v15 = 0;
              v16 = 0;
              v17 = 0;
              *(_DWORD *)&v136[8] = 0;
              *(_QWORD *)v136 = 0x100000001;
              HIDWORD(v134) = 1;
              LODWORD(v134) = 1;
            }
            goto LABEL_16;
          }
          v133 = 0;
          *(_QWORD *)&v134 = 0;
          LODWORD(v138) = 0;
          *((_QWORD *)&v134 + 1) = 0x100000000;
          *(_QWORD *)&v146[8] = 0;
          *(_QWORD *)v146 = 0;
          v130 = 0;
          memset(v131, 0, sizeof(v131));
          v126 = 0;
          v129 = 0;
          v145 = 0;
          v122 = 0;
          v125 = 0;
          v144 = 0;
          v120 = 0;
          v121 = 0;
          v143 = 0;
          v123 = 0;
          v128 = 0;
          v137 = 0;
          v124 = 0;
          v127 = 0;
          v132 = 0;
          v135 = 0;
          v13 = 0;
          v14 = 0;
          v15 = 0;
          v16 = 0;
          v17 = 0;
          *(_DWORD *)&v136[8] = 0;
          *(_QWORD *)v136 = 0x100000001;
        }
        else
        {
          v134 = 0uLL;
          LODWORD(v138) = 0;
          *(_QWORD *)&v146[8] = 0;
          v133 = 0;
          *(_QWORD *)v146 = 0;
          v130 = 0;
          memset(v131, 0, sizeof(v131));
          v126 = 0;
          v129 = 0;
          v145 = 0;
          v122 = 0;
          v125 = 0;
          v144 = 0;
          v120 = 0;
          v121 = 0;
          v143 = 0;
          v123 = 0;
          v128 = 0;
          v137 = 0;
          v124 = 0;
          v127 = 0;
          v132 = 0;
          v135 = 0;
          v13 = 0;
          v14 = 0;
          v15 = 0;
          v16 = 0;
          v17 = 0;
          *(_DWORD *)&v136[8] = 0;
          *(_QWORD *)v136 = 0x100000001;
          *(_DWORD *)&v146[16] = 1;
        }
      }
    }
    else
    {
      memset(v136, 0, sizeof(v136));
      v134 = 0uLL;
      v138 = 0x100000000;
      v133 = 0;
      v130 = 0;
      memset(v131, 0, sizeof(v131));
      memset(v146, 0, sizeof(v146));
      v126 = 0;
      v129 = 0;
      v145 = 0;
      v122 = 0;
      v125 = 0;
      v144 = 0;
      v120 = 0;
      v121 = 0;
      v143 = 0;
      v123 = 0;
      v128 = 0;
      v137 = 0;
      v124 = 0;
      v127 = 0;
      v132 = 0;
      v135 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
    }
  }
LABEL_16:
  if (v16)
  {
    v20 = v13;
    v21 = v14;
    v22 = v15;

    v15 = v22;
    v14 = v21;
    v13 = v20;
  }
  if (v15)

  if (v14)
  {

  }
  if ((_DWORD)v135)
  {

  }
  if (v13)

  if (HIDWORD(v132))
  {

  }
  if (HIDWORD(v135))
  {

  }
  if ((_DWORD)v132)

  if (HIDWORD(v130))
  {

  }
  if (*(_DWORD *)&v136[8])
  {

  }
  if (v127)

  if (v124)
  {

  }
  if (v137)
  {

  }
  if (v128)

  if (v123)
  {

  }
  if (v143)
  {

  }
  if (v121)

  if (v120)
  {

  }
  if (v144)
  {

  }
  if (v125)

  if (v122)
  {

  }
  if (v145)
  {

  }
  if (v129)

  if (v126)
  {

  }
  if (*(_DWORD *)v146)
  {

  }
  if (*(_DWORD *)v131)

  if ((_DWORD)v130)
  {

  }
  if (*(_DWORD *)&v146[4])
  {

  }
  if (*(_DWORD *)&v131[4])

  if (*(_DWORD *)&v131[8])
  {

  }
  if (*(_DWORD *)&v146[8])
  {

  }
  if (HIDWORD(v133))

  if ((_DWORD)v133)
  {

  }
  if (*(_DWORD *)&v146[12])
  {

  }
  if (DWORD1(v134))

  if (DWORD2(v134))
  {

  }
  if ((_DWORD)v138)
  {

  }
  if ((_DWORD)v134)

  if (HIDWORD(v134))
  {

  }
  if (*(_DWORD *)&v146[16])
  {

  }
  if (*(_DWORD *)v136)

  if (*(_DWORD *)&v136[4])
  {

  }
  if (HIDWORD(v138))
  {

  }
  if (v140 != v139)

LABEL_105:
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
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  unint64_t v33;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  objc_super v43;

  v43.receiver = self;
  v43.super_class = (Class)SFRowCardSection;
  v3 = -[SFCardSection hash](&v43, sel_hash);
  -[SFCardSection punchoutOptions](self, "punchoutOptions");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v42, "hash");
  -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 ^ objc_msgSend(v41, "hash");
  -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 ^ objc_msgSend(v40, "hash");
  v7 = v6 ^ -[SFCardSection canBeHidden](self, "canBeHidden");
  v8 = v7 ^ -[SFCardSection hasTopPadding](self, "hasTopPadding") ^ v3;
  v9 = -[SFCardSection hasBottomPadding](self, "hasBottomPadding");
  -[SFRowCardSection type](self, "type");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9 ^ objc_msgSend(v39, "hash");
  v11 = v10 ^ -[SFCardSection separatorStyle](self, "separatorStyle");
  -[SFCardSection backgroundColor](self, "backgroundColor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11 ^ objc_msgSend(v38, "hash");
  -[SFRowCardSection image](self, "image");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v8 ^ v12 ^ objc_msgSend(v37, "hash");
  v14 = -[SFRowCardSection imageIsRightAligned](self, "imageIsRightAligned");
  -[SFRowCardSection leadingText](self, "leadingText");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14 ^ objc_msgSend(v36, "hash");
  -[SFRowCardSection trailingText](self, "trailingText");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15 ^ objc_msgSend(v35, "hash");
  -[SFRowCardSection attributionImage](self, "attributionImage");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v16 ^ objc_msgSend(v17, "hash");
  -[SFRowCardSection key](self, "key");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v18 ^ objc_msgSend(v19, "hash");
  v21 = v13 ^ v20 ^ -[SFRowCardSection keyNoWrap](self, "keyNoWrap");
  -[SFRowCardSection keyWeight](self, "keyWeight");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "hash");
  -[SFRowCardSection value](self, "value");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v23 ^ objc_msgSend(v24, "hash");
  v26 = v25 ^ -[SFRowCardSection valueNoWrap](self, "valueNoWrap");
  -[SFRowCardSection valueWeight](self, "valueWeight");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v26 ^ objc_msgSend(v27, "hash");
  v29 = v28 ^ -[SFRowCardSection cardPaddingBottom](self, "cardPaddingBottom");
  -[SFRowCardSection leadingSubtitle](self, "leadingSubtitle");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v29 ^ objc_msgSend(v30, "hash");
  -[SFRowCardSection trailingSubtitle](self, "trailingSubtitle");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v21 ^ v31 ^ objc_msgSend(v32, "hash");

  return v33;
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (SFImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (BOOL)imageIsRightAligned
{
  return self->_imageIsRightAligned;
}

- (SFRichText)leadingText
{
  return self->_leadingText;
}

- (void)setLeadingText:(id)a3
{
  objc_storeStrong((id *)&self->_leadingText, a3);
}

- (SFRichText)trailingText
{
  return self->_trailingText;
}

- (void)setTrailingText:(id)a3
{
  objc_storeStrong((id *)&self->_trailingText, a3);
}

- (SFImage)attributionImage
{
  return self->_attributionImage;
}

- (void)setAttributionImage:(id)a3
{
  objc_storeStrong((id *)&self->_attributionImage, a3);
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (BOOL)keyNoWrap
{
  return self->_keyNoWrap;
}

- (NSNumber)keyWeight
{
  return self->_keyWeight;
}

- (void)setKeyWeight:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (BOOL)valueNoWrap
{
  return self->_valueNoWrap;
}

- (NSNumber)valueWeight
{
  return self->_valueWeight;
}

- (void)setValueWeight:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (BOOL)cardPaddingBottom
{
  return self->_cardPaddingBottom;
}

- (SFRichText)leadingSubtitle
{
  return self->_leadingSubtitle;
}

- (void)setLeadingSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_leadingSubtitle, a3);
}

- (SFRichText)trailingSubtitle
{
  return self->_trailingSubtitle;
}

- (void)setTrailingSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_trailingSubtitle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingSubtitle, 0);
  objc_storeStrong((id *)&self->_leadingSubtitle, 0);
  objc_storeStrong((id *)&self->_valueWeight, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_keyWeight, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_attributionImage, 0);
  objc_storeStrong((id *)&self->_trailingText, 0);
  objc_storeStrong((id *)&self->_leadingText, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFRowCardSection)initWithProtobuf:(id)a3
{
  id v4;
  SFRowCardSection *v5;
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
  SFImage *v25;
  void *v26;
  SFImage *v27;
  void *v28;
  SFRichText *v29;
  void *v30;
  SFRichText *v31;
  void *v32;
  SFRichText *v33;
  void *v34;
  SFRichText *v35;
  void *v36;
  SFImage *v37;
  void *v38;
  SFImage *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  SFRichText *v47;
  void *v48;
  SFRichText *v49;
  void *v50;
  SFRichText *v51;
  void *v52;
  SFRichText *v53;
  SFRowCardSection *v54;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  objc_super v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v60.receiver = self;
  v60.super_class = (Class)SFRowCardSection;
  v5 = -[SFCardSection init](&v60, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "punchoutOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v7 = 0;

    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    objc_msgSend(v4, "punchoutOptions", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v57;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v57 != v11)
            objc_enumerationMutation(v8);
          v13 = -[SFPunchout initWithProtobuf:]([SFPunchout alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * i));
          if (v13)
            objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
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
      -[SFRowCardSection setType:](v5, "setType:", v19);

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
    objc_msgSend(v4, "image");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      v25 = [SFImage alloc];
      objc_msgSend(v4, "image");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[SFImage initWithProtobuf:](v25, "initWithProtobuf:", v26);
      -[SFRowCardSection setImage:](v5, "setImage:", v27);

    }
    if (objc_msgSend(v4, "imageIsRightAligned"))
      -[SFRowCardSection setImageIsRightAligned:](v5, "setImageIsRightAligned:", objc_msgSend(v4, "imageIsRightAligned"));
    objc_msgSend(v4, "leadingText");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      v29 = [SFRichText alloc];
      objc_msgSend(v4, "leadingText");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = -[SFRichText initWithProtobuf:](v29, "initWithProtobuf:", v30);
      -[SFRowCardSection setLeadingText:](v5, "setLeadingText:", v31);

    }
    objc_msgSend(v4, "trailingText");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      v33 = [SFRichText alloc];
      objc_msgSend(v4, "trailingText");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = -[SFRichText initWithProtobuf:](v33, "initWithProtobuf:", v34);
      -[SFRowCardSection setTrailingText:](v5, "setTrailingText:", v35);

    }
    objc_msgSend(v4, "attributionImage");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      v37 = [SFImage alloc];
      objc_msgSend(v4, "attributionImage");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = -[SFImage initWithProtobuf:](v37, "initWithProtobuf:", v38);
      -[SFRowCardSection setAttributionImage:](v5, "setAttributionImage:", v39);

    }
    objc_msgSend(v4, "key");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (v40)
    {
      objc_msgSend(v4, "key");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFRowCardSection setKey:](v5, "setKey:", v41);

    }
    if (objc_msgSend(v4, "keyNoWrap"))
      -[SFRowCardSection setKeyNoWrap:](v5, "setKeyNoWrap:", objc_msgSend(v4, "keyNoWrap"));
    if (objc_msgSend(v4, "keyWeight"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "keyWeight"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFRowCardSection setKeyWeight:](v5, "setKeyWeight:", v42);

    }
    objc_msgSend(v4, "value");
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if (v43)
    {
      objc_msgSend(v4, "value");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFRowCardSection setValue:](v5, "setValue:", v44);

    }
    if (objc_msgSend(v4, "valueNoWrap"))
      -[SFRowCardSection setValueNoWrap:](v5, "setValueNoWrap:", objc_msgSend(v4, "valueNoWrap"));
    if (objc_msgSend(v4, "valueWeight"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "valueWeight"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFRowCardSection setValueWeight:](v5, "setValueWeight:", v45);

    }
    if (objc_msgSend(v4, "cardPaddingBottom"))
      -[SFRowCardSection setCardPaddingBottom:](v5, "setCardPaddingBottom:", objc_msgSend(v4, "cardPaddingBottom"));
    objc_msgSend(v4, "leadingSubtitle");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (v46)
    {
      v47 = [SFRichText alloc];
      objc_msgSend(v4, "leadingSubtitle");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = -[SFRichText initWithProtobuf:](v47, "initWithProtobuf:", v48);
      -[SFRowCardSection setLeadingSubtitle:](v5, "setLeadingSubtitle:", v49);

    }
    objc_msgSend(v4, "trailingSubtitle");
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    if (v50)
    {
      v51 = [SFRichText alloc];
      objc_msgSend(v4, "trailingSubtitle");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = -[SFRichText initWithProtobuf:](v51, "initWithProtobuf:", v52);
      -[SFRowCardSection setTrailingSubtitle:](v5, "setTrailingSubtitle:", v53);

    }
    v54 = v5;

  }
  return v5;
}

@end
