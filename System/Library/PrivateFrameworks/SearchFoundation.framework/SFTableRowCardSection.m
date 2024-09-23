@implementation SFTableRowCardSection

- (void)setIsSubHeader:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isSubHeader = a3;
}

- (BOOL)hasIsSubHeader
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setReducedRowHeight:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_reducedRowHeight = a3;
}

- (BOOL)hasReducedRowHeight
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setVerticalAlign:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_verticalAlign = a3;
}

- (BOOL)hasVerticalAlign
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setAlignRowsToHeader:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_alignRowsToHeader = a3;
}

- (BOOL)hasAlignRowsToHeader
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (SFTableRowCardSection)initWithCoder:(id)a3
{
  id v4;
  SFTableRowCardSection *v5;
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
    -[SFTableRowCardSection setType:](v5, "setType:", v12);

    -[SFCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", -[SFCardSection separatorStyle](v8, "separatorStyle"));
    -[SFCardSection backgroundColor](v8, "backgroundColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setBackgroundColor:](v5, "setBackgroundColor:", v13);

    -[SFCardSection richData](v8, "richData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFTableRowCardSection setRichData:](v5, "setRichData:", v14);

    -[SFCardSection tableIdentifier](v8, "tableIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFTableRowCardSection setTableIdentifier:](v5, "setTableIdentifier:", v15);

    -[SFCardSection alignmentSchema](v8, "alignmentSchema");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFTableRowCardSection setAlignmentSchema:](v5, "setAlignmentSchema:", v16);

    -[SFCardSection data](v8, "data");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFTableRowCardSection setData:](v5, "setData:", v17);

    -[SFTableRowCardSection setIsSubHeader:](v5, "setIsSubHeader:", -[SFCardSection isSubHeader](v8, "isSubHeader"));
    -[SFCardSection tabGroupIdentifier](v8, "tabGroupIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFTableRowCardSection setTabGroupIdentifier:](v5, "setTabGroupIdentifier:", v18);

    -[SFTableRowCardSection setReducedRowHeight:](v5, "setReducedRowHeight:", -[SFCardSection reducedRowHeight](v8, "reducedRowHeight"));
    -[SFTableRowCardSection setVerticalAlign:](v5, "setVerticalAlign:", -[SFCardSection verticalAlign](v8, "verticalAlign"));
    -[SFTableRowCardSection setAlignRowsToHeader:](v5, "setAlignRowsToHeader:", -[SFCardSection alignRowsToHeader](v8, "alignRowsToHeader"));
    -[SFCardSection nextCard](v8, "nextCard");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setNextCard:](v5, "setNextCard:", v19);

    -[SFCardSection commands](v8, "commands");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCommands:](v5, "setCommands:", v20);

    -[SFCardSection parameterKeyPaths](v8, "parameterKeyPaths");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setParameterKeyPaths:](v5, "setParameterKeyPaths:", v21);

    -[SFCardSection cardSectionId](v8, "cardSectionId");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCardSectionId:](v5, "setCardSectionId:", v22);

    -[SFCardSection resultIdentifier](v8, "resultIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setResultIdentifier:](v5, "setResultIdentifier:", v23);

    -[SFCardSection userReportRequest](v8, "userReportRequest");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setUserReportRequest:](v5, "setUserReportRequest:", v24);

    -[SFCardSection command](v8, "command");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCommand:](v5, "setCommand:", v25);

    -[SFCardSection previewCommand](v8, "previewCommand");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewCommand:](v5, "setPreviewCommand:", v26);

    -[SFCardSection previewButtonItems](v8, "previewButtonItems");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewButtonItems:](v5, "setPreviewButtonItems:", v27);

    -[SFCardSection cardSectionDetail](v8, "cardSectionDetail");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCardSectionDetail:](v5, "setCardSectionDetail:", v28);

    -[SFCardSection previewButtonItemsTitle](v8, "previewButtonItemsTitle");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewButtonItemsTitle:](v5, "setPreviewButtonItemsTitle:", v29);

    -[SFCardSection backgroundColor](v8, "backgroundColor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setBackgroundColor:](v5, "setBackgroundColor:", v30);

    -[SFCardSection setShouldHideInAmbientMode:](v5, "setShouldHideInAmbientMode:", -[SFCardSection shouldHideInAmbientMode](v8, "shouldHideInAmbientMode"));
    -[SFCardSection leadingSwipeButtonItems](v8, "leadingSwipeButtonItems");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setLeadingSwipeButtonItems:](v5, "setLeadingSwipeButtonItems:", v31);

    -[SFCardSection trailingSwipeButtonItems](v8, "trailingSwipeButtonItems");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setTrailingSwipeButtonItems:](v5, "setTrailingSwipeButtonItems:", v32);

    -[SFCardSection punchoutOptions](v8, "punchoutOptions");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutOptions:](v5, "setPunchoutOptions:", v33);

    -[SFCardSection punchoutPickerTitle](v8, "punchoutPickerTitle");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerTitle:](v5, "setPunchoutPickerTitle:", v34);

    -[SFCardSection punchoutPickerDismissText](v8, "punchoutPickerDismissText");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerDismissText:](v5, "setPunchoutPickerDismissText:", v35);

    -[SFCardSection setCanBeHidden:](v5, "setCanBeHidden:", -[SFCardSection canBeHidden](v8, "canBeHidden"));
    -[SFCardSection setHasTopPadding:](v5, "setHasTopPadding:", -[SFCardSection hasTopPadding](v8, "hasTopPadding"));
    -[SFCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", -[SFCardSection hasBottomPadding](v8, "hasBottomPadding"));
    -[SFCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", -[SFCardSection separatorStyle](v8, "separatorStyle"));
    -[SFCardSection referencedCommands](v8, "referencedCommands");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setReferencedCommands:](v5, "setReferencedCommands:", v36);

    -[SFCardSection setForceEnable3DTouch:](v5, "setForceEnable3DTouch:", -[SFCardSection forceEnable3DTouch](v8, "forceEnable3DTouch"));
    -[SFCardSection setShouldShowInSmartDialog:](v5, "setShouldShowInSmartDialog:", -[SFCardSection shouldShowInSmartDialog](v8, "shouldShowInSmartDialog"));
    -[SFCardSection appEntityAnnotation](v8, "appEntityAnnotation");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setAppEntityAnnotation:](v5, "setAppEntityAnnotation:", v37);

    -[SFCardSection emphasisSubjectId](v8, "emphasisSubjectId");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setEmphasisSubjectId:](v5, "setEmphasisSubjectId:", v38);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFTableRowCardSection;
  -[SFCardSection encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBTableRowCardSection *v2;
  void *v3;

  v2 = -[_SFPBTableRowCardSection initWithFacade:]([_SFPBTableRowCardSection alloc], "initWithFacade:", self);
  -[_SFPBTableRowCardSection dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBTableRowCardSection *v2;
  void *v3;

  v2 = -[_SFPBTableRowCardSection initWithFacade:]([_SFPBTableRowCardSection alloc], "initWithFacade:", self);
  -[_SFPBTableRowCardSection jsonData](v2, "jsonData");
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
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)SFTableRowCardSection;
  v4 = -[SFCardSection copyWithZone:](&v26, sel_copyWithZone_, a3);
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
  -[SFTableRowCardSection type](self, "type");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setType:", v12);

  objc_msgSend(v4, "setSeparatorStyle:", -[SFCardSection separatorStyle](self, "separatorStyle"));
  -[SFCardSection backgroundColor](self, "backgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setBackgroundColor:", v14);

  -[SFTableRowCardSection richData](self, "richData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v4, "setRichData:", v16);

  -[SFTableRowCardSection tableIdentifier](self, "tableIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");
  objc_msgSend(v4, "setTableIdentifier:", v18);

  -[SFTableRowCardSection alignmentSchema](self, "alignmentSchema");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");
  objc_msgSend(v4, "setAlignmentSchema:", v20);

  -[SFTableRowCardSection data](self, "data");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "copy");
  objc_msgSend(v4, "setData:", v22);

  objc_msgSend(v4, "setIsSubHeader:", -[SFTableRowCardSection isSubHeader](self, "isSubHeader"));
  -[SFTableRowCardSection tabGroupIdentifier](self, "tabGroupIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v23, "copy");
  objc_msgSend(v4, "setTabGroupIdentifier:", v24);

  objc_msgSend(v4, "setReducedRowHeight:", -[SFTableRowCardSection reducedRowHeight](self, "reducedRowHeight"));
  objc_msgSend(v4, "setVerticalAlign:", -[SFTableRowCardSection verticalAlign](self, "verticalAlign"));
  objc_msgSend(v4, "setAlignRowsToHeader:", -[SFTableRowCardSection alignRowsToHeader](self, "alignRowsToHeader"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SFTableRowCardSection *v4;
  SFTableRowCardSection *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _BOOL4 v9;
  void *v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  SFTableRowCardSection *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  SFTableRowCardSection *v29;
  void *v30;
  _BOOL4 v31;
  _BOOL4 v32;
  _BOOL4 v33;
  char v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  uint64_t v45;
  uint64_t v46;
  SFTableRowCardSection *v47;
  void *v48;
  int v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  _BOOL4 v60;
  uint64_t v61;
  void *v62;
  _BOOL4 v63;
  int v64;
  _BOOL4 v65;
  uint64_t v66;
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
  SFTableRowCardSection *v113;
  _BOOL4 v114;
  void *v115;
  _QWORD v116[5];
  int v117;
  int v118;
  id v119;
  id v120;
  _QWORD v121[4];
  SFTableRowCardSection *v122;
  objc_super v123;

  v4 = (SFTableRowCardSection *)a3;
  if (self == v4)
  {
    LOBYTE(v21) = 1;
    goto LABEL_82;
  }
  if (!-[SFTableRowCardSection isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class())
    || (v123.receiver = self,
        v123.super_class = (Class)SFTableRowCardSection,
        !-[SFCardSection isEqual:](&v123, sel_isEqual_, v4)))
  {
    LOBYTE(v21) = 0;
    goto LABEL_82;
  }
  v5 = v4;
  -[SFCardSection punchoutOptions](self, "punchoutOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCardSection punchoutOptions](v5, "punchoutOptions");
  v119 = (id)objc_claimAutoreleasedReturnValue();
  v120 = v6;
  v117 = v119 != 0;
  v118 = v6 == 0;
  v122 = v5;
  if (v118 == v117)
  {
    v11 = 0;
    memset(v116, 0, sizeof(v116));
    v12 = 0;
    memset(v121, 0, sizeof(v121));
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    LOBYTE(v21) = 0;
    goto LABEL_27;
  }
  -[SFCardSection punchoutOptions](self, "punchoutOptions");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8 != 0;
  v115 = (void *)v8;
  if (v8)
  {
    -[SFCardSection punchoutOptions](self, "punchoutOptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection punchoutOptions](v5, "punchoutOptions");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    v110 = v10;
    if (!objc_msgSend(v10, "isEqual:"))
    {
      v11 = 0;
      v12 = 0;
      memset(v121, 0, sizeof(v121));
      memset(v116, 0, 36);
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v19 = 0;
      v20 = 0;
      LOBYTE(v21) = 0;
      HIDWORD(v116[4]) = 1;
      goto LABEL_27;
    }
  }
  -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v22 = objc_claimAutoreleasedReturnValue();
  -[SFCardSection punchoutPickerTitle](v5, "punchoutPickerTitle");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = (void *)v22;
  HIDWORD(v116[4]) = v9;
  if ((v22 == 0) == (v111 != 0))
  {
    v11 = 0;
    memset(v116, 0, 32);
    v12 = 0;
    memset(v121, 0, sizeof(v121));
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    LOBYTE(v21) = 0;
    LODWORD(v116[4]) = 1;
    goto LABEL_27;
  }
  -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v23 = objc_claimAutoreleasedReturnValue();
  HIDWORD(v121[3]) = v23 != 0;
  v108 = (void *)v23;
  if (v23)
  {
    -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = v5;
    v26 = (void *)v24;
    -[SFCardSection punchoutPickerTitle](v25, "punchoutPickerTitle");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    v105 = v26;
    if (!objc_msgSend(v26, "isEqual:"))
    {
      v11 = 0;
      v12 = 0;
      memset(v116, 0, 28);
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      memset(v121, 0, 28);
      v18 = 0;
      v19 = 0;
      v20 = 0;
      LOBYTE(v21) = 0;
      *(_QWORD *)((char *)&v116[3] + 4) = 0x100000001;
      HIDWORD(v121[3]) = 1;
      goto LABEL_27;
    }
    v5 = v122;
  }
  -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCardSection punchoutPickerDismissText](v5, "punchoutPickerDismissText");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v107 == 0) == (v106 != 0))
  {
    v11 = 0;
    memset(v116, 0, 24);
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    memset(v121, 0, 28);
    v18 = 0;
    v19 = 0;
    v20 = 0;
    LOBYTE(v21) = 0;
    *(_QWORD *)((char *)&v116[3] + 4) = 0x100000001;
    LODWORD(v116[3]) = 1;
    goto LABEL_27;
  }
  -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v27 = objc_claimAutoreleasedReturnValue();
  LODWORD(v121[3]) = v27 != 0;
  v103 = (void *)v27;
  if (v27)
  {
    -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = v5;
    v30 = (void *)v28;
    -[SFCardSection punchoutPickerDismissText](v29, "punchoutPickerDismissText");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = v30;
    if (!objc_msgSend(v30, "isEqual:", v101))
    {
      memset(v116, 0, 24);
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      memset(v121, 0, 24);
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v19 = 0;
      v20 = 0;
      LOBYTE(v21) = 0;
      *(_QWORD *)((char *)&v116[3] + 4) = 0x100000001;
      LODWORD(v116[3]) = 1;
      v11 = 1;
      LODWORD(v121[3]) = 1;
      goto LABEL_27;
    }
    v5 = v122;
  }
  v31 = -[SFCardSection canBeHidden](self, "canBeHidden");
  if (v31 != -[SFCardSection canBeHidden](v5, "canBeHidden")
    || (v32 = -[SFCardSection hasTopPadding](self, "hasTopPadding"),
        v32 != -[SFCardSection hasTopPadding](v5, "hasTopPadding"))
    || (v33 = -[SFCardSection hasBottomPadding](self, "hasBottomPadding"),
        v33 != -[SFCardSection hasBottomPadding](v5, "hasBottomPadding")))
  {
    memset(v116, 0, 24);
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    memset(v121, 0, 24);
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    LOBYTE(v21) = 0;
    *(_QWORD *)((char *)&v116[3] + 4) = 0x100000001;
    LODWORD(v116[3]) = 1;
    v11 = 1;
    goto LABEL_27;
  }
  -[SFTableRowCardSection type](self, "type");
  v45 = objc_claimAutoreleasedReturnValue();
  -[SFTableRowCardSection type](v5, "type");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = (void *)v45;
  if ((v45 == 0) == (v99 != 0))
  {
    v12 = 0;
    memset(v116, 0, 20);
    v13 = 0;
    v14 = 0;
    v15 = 0;
    memset(v121, 0, 24);
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    LOBYTE(v21) = 0;
    *(_QWORD *)((char *)&v116[3] + 4) = 0x100000001;
    v11 = 1;
    *(_QWORD *)((char *)&v116[2] + 4) = 0x100000001;
    goto LABEL_27;
  }
  -[SFTableRowCardSection type](self, "type");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  HIDWORD(v121[2]) = v98 != 0;
  if (v98)
  {
    -[SFTableRowCardSection type](self, "type");
    v46 = objc_claimAutoreleasedReturnValue();
    v47 = v5;
    v48 = (void *)v46;
    -[SFTableRowCardSection type](v47, "type");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = v48;
    if (!objc_msgSend(v48, "isEqual:"))
    {
      v116[0] = 0;
      v116[1] = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      memset(v121, 0, 20);
      v18 = 0;
      v19 = 0;
      v20 = 0;
      LOBYTE(v21) = 0;
      *(_QWORD *)((char *)&v116[3] + 4) = 0x100000001;
      *(_QWORD *)((char *)&v116[2] + 4) = 0x100000001;
      v11 = 1;
      LODWORD(v116[2]) = 1;
      HIDWORD(v121[2]) = 1;
      goto LABEL_27;
    }
    v5 = v122;
  }
  v49 = -[SFCardSection separatorStyle](self, "separatorStyle");
  if (v49 == -[SFCardSection separatorStyle](v5, "separatorStyle"))
  {
    -[SFCardSection backgroundColor](self, "backgroundColor");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection backgroundColor](v5, "backgroundColor");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v95 == 0) == (v94 != 0))
    {
      v116[0] = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      memset(v121, 0, 20);
      v18 = 0;
      v19 = 0;
      v20 = 0;
      LOBYTE(v21) = 0;
      *(_QWORD *)((char *)&v116[3] + 4) = 0x100000001;
      *(_QWORD *)((char *)&v116[2] + 4) = 0x100000001;
      v11 = 1;
      LODWORD(v116[2]) = 1;
      v116[1] = 1;
    }
    else
    {
      -[SFCardSection backgroundColor](self, "backgroundColor");
      v50 = objc_claimAutoreleasedReturnValue();
      LODWORD(v121[2]) = v50 != 0;
      v93 = (void *)v50;
      if (!v50
        || (-[SFCardSection backgroundColor](self, "backgroundColor"),
            v51 = (void *)objc_claimAutoreleasedReturnValue(),
            -[SFCardSection backgroundColor](v122, "backgroundColor"),
            v89 = (void *)objc_claimAutoreleasedReturnValue(),
            v90 = v51,
            objc_msgSend(v51, "isEqual:")))
      {
        -[SFTableRowCardSection richData](self, "richData");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFTableRowCardSection richData](v122, "richData");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v92 == 0) == (v91 != 0))
        {
          v12 = 0;
          v121[0] = 0;
          v121[1] = 0;
          v13 = 0;
          v14 = 0;
          v15 = 0;
          v16 = 0;
          v17 = 0;
          v18 = 0;
          v19 = 0;
          v20 = 0;
          LOBYTE(v21) = 0;
          LODWORD(v116[4]) = 1;
          v116[3] = 0x100000001;
          v11 = 1;
          v116[2] = 0x100000001;
          v116[1] = 0x100000001;
          v116[0] = 0x100000000;
        }
        else
        {
          -[SFTableRowCardSection richData](self, "richData");
          v52 = objc_claimAutoreleasedReturnValue();
          HIDWORD(v121[1]) = v52 != 0;
          v88 = (void *)v52;
          if (!v52
            || (-[SFTableRowCardSection richData](self, "richData"),
                v53 = (void *)objc_claimAutoreleasedReturnValue(),
                -[SFTableRowCardSection richData](v122, "richData"),
                v84 = (void *)objc_claimAutoreleasedReturnValue(),
                v85 = v53,
                objc_msgSend(v53, "isEqual:")))
          {
            -[SFTableRowCardSection tableIdentifier](self, "tableIdentifier");
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            -[SFTableRowCardSection tableIdentifier](v122, "tableIdentifier");
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            if ((v87 == 0) == (v86 != 0))
            {
              v13 = 0;
              *(_QWORD *)((char *)v121 + 4) = 0;
              v14 = 0;
              v15 = 0;
              v16 = 0;
              v17 = 0;
              LODWORD(v121[0]) = 0;
              v18 = 0;
              v19 = 0;
              v20 = 0;
              LOBYTE(v21) = 0;
              LODWORD(v116[4]) = 1;
              v116[3] = 0x100000001;
              v11 = 1;
              v116[2] = 0x100000001;
              v116[1] = 0x100000001;
              v12 = 1;
              v116[0] = 0x100000001;
            }
            else
            {
              -[SFTableRowCardSection tableIdentifier](self, "tableIdentifier");
              v54 = objc_claimAutoreleasedReturnValue();
              LODWORD(v121[1]) = v54 != 0;
              v83 = (void *)v54;
              if (!v54
                || (-[SFTableRowCardSection tableIdentifier](self, "tableIdentifier"),
                    v55 = (void *)objc_claimAutoreleasedReturnValue(),
                    -[SFTableRowCardSection tableIdentifier](v122, "tableIdentifier"),
                    v79 = (void *)objc_claimAutoreleasedReturnValue(),
                    v80 = v55,
                    objc_msgSend(v55, "isEqual:")))
              {
                -[SFTableRowCardSection alignmentSchema](self, "alignmentSchema");
                v82 = (void *)objc_claimAutoreleasedReturnValue();
                -[SFTableRowCardSection alignmentSchema](v122, "alignmentSchema");
                v81 = (void *)objc_claimAutoreleasedReturnValue();
                if ((v82 == 0) == (v81 != 0))
                {
                  v15 = 0;
                  v121[0] = 0;
                  v16 = 0;
                  v17 = 0;
                  v18 = 0;
                  v19 = 0;
                  v20 = 0;
                  LOBYTE(v21) = 0;
                  LODWORD(v116[4]) = 1;
                  v116[3] = 0x100000001;
                  v11 = 1;
                  v116[2] = 0x100000001;
                  v116[1] = 0x100000001;
                  v12 = 1;
                  v116[0] = 0x100000001;
                  v13 = 1;
                  v14 = 1;
                }
                else
                {
                  -[SFTableRowCardSection alignmentSchema](self, "alignmentSchema");
                  v56 = objc_claimAutoreleasedReturnValue();
                  HIDWORD(v121[0]) = v56 != 0;
                  v78 = (void *)v56;
                  if (!v56
                    || (-[SFTableRowCardSection alignmentSchema](self, "alignmentSchema"),
                        v57 = (void *)objc_claimAutoreleasedReturnValue(),
                        -[SFTableRowCardSection alignmentSchema](v122, "alignmentSchema"),
                        v74 = (void *)objc_claimAutoreleasedReturnValue(),
                        v75 = v57,
                        objc_msgSend(v57, "isEqual:")))
                  {
                    -[SFTableRowCardSection data](self, "data");
                    v77 = (void *)objc_claimAutoreleasedReturnValue();
                    -[SFTableRowCardSection data](v122, "data");
                    v76 = (void *)objc_claimAutoreleasedReturnValue();
                    if ((v77 == 0) == (v76 != 0))
                    {
                      v17 = 0;
                      LODWORD(v121[0]) = 0;
                      v18 = 0;
                      v19 = 0;
                      v20 = 0;
                      LOBYTE(v21) = 0;
                      LODWORD(v116[4]) = 1;
                      v116[3] = 0x100000001;
                      v11 = 1;
                      v116[2] = 0x100000001;
                      v116[1] = 0x100000001;
                      v12 = 1;
                      v116[0] = 0x100000001;
                      v13 = 1;
                      v14 = 1;
                      v15 = 1;
                      v16 = 1;
                    }
                    else
                    {
                      -[SFTableRowCardSection data](self, "data");
                      v58 = objc_claimAutoreleasedReturnValue();
                      LODWORD(v121[0]) = v58 != 0;
                      v73 = (void *)v58;
                      if (!v58
                        || (-[SFTableRowCardSection data](self, "data"),
                            v59 = (void *)objc_claimAutoreleasedReturnValue(),
                            -[SFTableRowCardSection data](v122, "data"),
                            v71 = (void *)objc_claimAutoreleasedReturnValue(),
                            v72 = v59,
                            objc_msgSend(v59, "isEqual:")))
                      {
                        v60 = -[SFTableRowCardSection isSubHeader](self, "isSubHeader");
                        if (v60 == -[SFTableRowCardSection isSubHeader](v122, "isSubHeader"))
                        {
                          -[SFTableRowCardSection tabGroupIdentifier](self, "tabGroupIdentifier");
                          v70 = (void *)objc_claimAutoreleasedReturnValue();
                          -[SFTableRowCardSection tabGroupIdentifier](v122, "tabGroupIdentifier");
                          v69 = (void *)objc_claimAutoreleasedReturnValue();
                          if ((v70 == 0) == (v69 != 0))
                          {
                            v19 = 0;
                            v20 = 0;
                            LOBYTE(v21) = 0;
                            LODWORD(v116[4]) = 1;
                            v116[3] = 0x100000001;
                            v11 = 1;
                            v116[2] = 0x100000001;
                            v116[1] = 0x100000001;
                            v12 = 1;
                            v116[0] = 0x100000001;
                            v13 = 1;
                            v14 = 1;
                            v15 = 1;
                            v16 = 1;
                            v17 = 1;
                            v18 = 1;
                          }
                          else
                          {
                            -[SFTableRowCardSection tabGroupIdentifier](self, "tabGroupIdentifier");
                            v61 = objc_claimAutoreleasedReturnValue();
                            v114 = v61 != 0;
                            v68 = (void *)v61;
                            if (!v61
                              || (-[SFTableRowCardSection tabGroupIdentifier](self, "tabGroupIdentifier"),
                                  v62 = (void *)objc_claimAutoreleasedReturnValue(),
                                  -[SFTableRowCardSection tabGroupIdentifier](v122, "tabGroupIdentifier"),
                                  v66 = objc_claimAutoreleasedReturnValue(),
                                  v67 = v62,
                                  objc_msgSend(v62, "isEqual:")))
                            {
                              v63 = -[SFTableRowCardSection reducedRowHeight](self, "reducedRowHeight");
                              if (v63 == -[SFTableRowCardSection reducedRowHeight](v122, "reducedRowHeight")
                                && (v64 = -[SFTableRowCardSection verticalAlign](self, "verticalAlign"),
                                    v64 == -[SFTableRowCardSection verticalAlign](v122, "verticalAlign")))
                              {
                                v65 = -[SFTableRowCardSection alignRowsToHeader](self, "alignRowsToHeader");
                                v21 = v65 ^ -[SFTableRowCardSection alignRowsToHeader](v122, "alignRowsToHeader") ^ 1;
                              }
                              else
                              {
                                LOBYTE(v21) = 0;
                              }
                              LODWORD(v116[4]) = 1;
                              v116[3] = 0x100000001;
                              v11 = 1;
                              v116[2] = 0x100000001;
                              v116[1] = 0x100000001;
                              v12 = 1;
                              v116[0] = 0x100000001;
                              v13 = 1;
                              v14 = 1;
                              v15 = 1;
                              v16 = 1;
                              v17 = 1;
                              v18 = 1;
                              v19 = 1;
                              v20 = v114;
                            }
                            else
                            {
                              LOBYTE(v21) = 0;
                              LODWORD(v116[4]) = 1;
                              v116[3] = 0x100000001;
                              v11 = 1;
                              v116[2] = 0x100000001;
                              v116[1] = 0x100000001;
                              v12 = 1;
                              v116[0] = 0x100000001;
                              v13 = 1;
                              v14 = 1;
                              v15 = 1;
                              v16 = 1;
                              v17 = 1;
                              v18 = 1;
                              v19 = 1;
                              v20 = 1;
                            }
                            v7 = (void *)v66;
                          }
                        }
                        else
                        {
                          v18 = 0;
                          v19 = 0;
                          v20 = 0;
                          LOBYTE(v21) = 0;
                          LODWORD(v116[4]) = 1;
                          v116[3] = 0x100000001;
                          v11 = 1;
                          v116[2] = 0x100000001;
                          v116[1] = 0x100000001;
                          v12 = 1;
                          v116[0] = 0x100000001;
                          v13 = 1;
                          v14 = 1;
                          v15 = 1;
                          v16 = 1;
                          v17 = 1;
                        }
                      }
                      else
                      {
                        v18 = 0;
                        v19 = 0;
                        v20 = 0;
                        LOBYTE(v21) = 0;
                        LODWORD(v116[4]) = 1;
                        v116[3] = 0x100000001;
                        v11 = 1;
                        v116[2] = 0x100000001;
                        v116[1] = 0x100000001;
                        v12 = 1;
                        v116[0] = 0x100000001;
                        v13 = 1;
                        v14 = 1;
                        v15 = 1;
                        v16 = 1;
                        v17 = 1;
                        LODWORD(v121[0]) = 1;
                      }
                    }
                  }
                  else
                  {
                    v16 = 0;
                    v17 = 0;
                    v121[0] = 0x100000000;
                    v18 = 0;
                    v19 = 0;
                    v20 = 0;
                    LOBYTE(v21) = 0;
                    LODWORD(v116[4]) = 1;
                    v116[3] = 0x100000001;
                    v11 = 1;
                    v116[2] = 0x100000001;
                    v116[1] = 0x100000001;
                    v12 = 1;
                    v116[0] = 0x100000001;
                    v13 = 1;
                    v14 = 1;
                    v15 = 1;
                  }
                }
              }
              else
              {
                v14 = 0;
                v15 = 0;
                v121[0] = 0;
                v16 = 0;
                v17 = 0;
                v18 = 0;
                v19 = 0;
                v20 = 0;
                LOBYTE(v21) = 0;
                LODWORD(v116[4]) = 1;
                v116[3] = 0x100000001;
                v11 = 1;
                v116[2] = 0x100000001;
                v116[1] = 0x100000001;
                v12 = 1;
                v116[0] = 0x100000001;
                v13 = 1;
                LODWORD(v121[1]) = 1;
              }
            }
          }
          else
          {
            v116[0] = 0x100000000;
            v13 = 0;
            *(_QWORD *)((char *)v121 + 4) = 0;
            v14 = 0;
            v15 = 0;
            v16 = 0;
            v17 = 0;
            LODWORD(v121[0]) = 0;
            v18 = 0;
            v19 = 0;
            v20 = 0;
            LOBYTE(v21) = 0;
            LODWORD(v116[4]) = 1;
            v116[3] = 0x100000001;
            v11 = 1;
            v116[2] = 0x100000001;
            v116[1] = 0x100000001;
            v12 = 1;
            HIDWORD(v121[1]) = 1;
          }
        }
      }
      else
      {
        v116[0] = 0;
        v12 = 0;
        v121[0] = 0;
        v121[1] = 0;
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v17 = 0;
        v18 = 0;
        v19 = 0;
        v20 = 0;
        LOBYTE(v21) = 0;
        LODWORD(v116[4]) = 1;
        v116[3] = 0x100000001;
        v11 = 1;
        v116[2] = 0x100000001;
        v116[1] = 0x100000001;
        LODWORD(v121[2]) = 1;
      }
    }
  }
  else
  {
    v116[0] = 0;
    v116[1] = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    memset(v121, 0, 20);
    v18 = 0;
    v19 = 0;
    v20 = 0;
    LOBYTE(v21) = 0;
    *(_QWORD *)((char *)&v116[3] + 4) = 0x100000001;
    *(_QWORD *)((char *)&v116[2] + 4) = 0x100000001;
    v11 = 1;
    LODWORD(v116[2]) = 1;
  }
LABEL_27:
  if (v20)
  {
    v113 = v4;
    v34 = v21;
    v21 = v14;
    v35 = v16;
    v36 = v17;
    v37 = v15;
    v38 = v13;
    v39 = v12;
    v40 = v18;
    v41 = v11;
    v42 = v19;

    v43 = v42;
    v11 = v41;
    v18 = v40;
    v12 = v39;
    v13 = v38;
    v15 = v37;
    v17 = v36;
    v16 = v35;
    v14 = v21;
    LOBYTE(v21) = v34;
    v4 = v113;
    if (!v43)
      goto LABEL_29;
  }
  else if (!v19)
  {
LABEL_29:
    if (!v18)
      goto LABEL_31;
    goto LABEL_30;
  }

  if (v18)
  {
LABEL_30:

  }
LABEL_31:
  if (LODWORD(v121[0]))
  {

    if (!v17)
      goto LABEL_33;
LABEL_87:

    if (!v16)
      goto LABEL_35;
    goto LABEL_34;
  }
  if (v17)
    goto LABEL_87;
LABEL_33:
  if (v16)
  {
LABEL_34:

  }
LABEL_35:
  if (HIDWORD(v121[0]))
  {

  }
  if (v15)

  if (v14)
  {

  }
  if (LODWORD(v121[1]))
  {

  }
  if (v13)

  if (LODWORD(v116[0]))
  {

  }
  if (HIDWORD(v121[1]))
  {

  }
  if (v12)

  if (HIDWORD(v116[0]))
  {

  }
  if (LODWORD(v121[2]))
  {

  }
  if (HIDWORD(v116[1]))

  if (LODWORD(v116[1]))
  {

  }
  if (HIDWORD(v121[2]))
  {

  }
  if (LODWORD(v116[2]))

  if (HIDWORD(v116[2]))
  {

  }
  if (LODWORD(v121[3]))
  {

  }
  if (v11)

  if (LODWORD(v116[3]))
  {

  }
  if (HIDWORD(v121[3]))
  {

  }
  if (HIDWORD(v116[3]))

  if (LODWORD(v116[4]))
  {

  }
  if (HIDWORD(v116[4]))
  {

  }
  if (v118 != v117)

LABEL_82:
  return v21;
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
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  void *v30;
  void *v31;
  void *v32;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)SFTableRowCardSection;
  v3 = -[SFCardSection hash](&v33, sel_hash);
  -[SFCardSection punchoutOptions](self, "punchoutOptions");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v32, "hash");
  -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 ^ objc_msgSend(v31, "hash");
  -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 ^ objc_msgSend(v30, "hash");
  v7 = v6 ^ -[SFCardSection canBeHidden](self, "canBeHidden");
  v8 = v7 ^ -[SFCardSection hasTopPadding](self, "hasTopPadding") ^ v3;
  v9 = -[SFCardSection hasBottomPadding](self, "hasBottomPadding");
  -[SFTableRowCardSection type](self, "type");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9 ^ objc_msgSend(v10, "hash");
  v12 = v11 ^ -[SFCardSection separatorStyle](self, "separatorStyle");
  -[SFCardSection backgroundColor](self, "backgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 ^ objc_msgSend(v13, "hash");
  -[SFTableRowCardSection richData](self, "richData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v8 ^ v14 ^ objc_msgSend(v15, "hash");
  -[SFTableRowCardSection tableIdentifier](self, "tableIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "hash");
  -[SFTableRowCardSection alignmentSchema](self, "alignmentSchema");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v18 ^ objc_msgSend(v19, "hash");
  -[SFTableRowCardSection data](self, "data");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v20 ^ objc_msgSend(v21, "hash");
  v23 = v22 ^ -[SFTableRowCardSection isSubHeader](self, "isSubHeader");
  -[SFTableRowCardSection tabGroupIdentifier](self, "tabGroupIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v23 ^ objc_msgSend(v24, "hash");
  v26 = v25 ^ -[SFTableRowCardSection reducedRowHeight](self, "reducedRowHeight");
  v27 = v16 ^ v26 ^ -[SFTableRowCardSection verticalAlign](self, "verticalAlign");
  v28 = v27 ^ -[SFTableRowCardSection alignRowsToHeader](self, "alignRowsToHeader");

  return v28;
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSArray)richData
{
  return self->_richData;
}

- (void)setRichData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (NSString)tableIdentifier
{
  return self->_tableIdentifier;
}

- (void)setTableIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (SFTableAlignmentSchema)alignmentSchema
{
  return self->_alignmentSchema;
}

- (void)setAlignmentSchema:(id)a3
{
  objc_storeStrong((id *)&self->_alignmentSchema, a3);
}

- (NSArray)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (BOOL)isSubHeader
{
  return self->_isSubHeader;
}

- (NSString)tabGroupIdentifier
{
  return self->_tabGroupIdentifier;
}

- (void)setTabGroupIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (BOOL)reducedRowHeight
{
  return self->_reducedRowHeight;
}

- (int)verticalAlign
{
  return self->_verticalAlign;
}

- (BOOL)alignRowsToHeader
{
  return self->_alignRowsToHeader;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_alignmentSchema, 0);
  objc_storeStrong((id *)&self->_tableIdentifier, 0);
  objc_storeStrong((id *)&self->_richData, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFTableRowCardSection)initWithProtobuf:(id)a3
{
  id v4;
  SFTableRowCardSection *v5;
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
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  SFRichText *v31;
  void *v32;
  void *v33;
  void *v34;
  SFTableAlignmentSchema *v35;
  void *v36;
  SFTableAlignmentSchema *v37;
  void *v38;
  id v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t k;
  SFFormattedText *v45;
  void *v46;
  void *v47;
  SFTableRowCardSection *v48;
  SFTableRowCardSection *v50;
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
  __int128 v61;
  __int128 v62;
  objc_super v63;
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v63.receiver = self;
  v63.super_class = (Class)SFTableRowCardSection;
  v5 = -[SFCardSection init](&v63, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "punchoutOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v7 = 0;

    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    objc_msgSend(v4, "punchoutOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v59, v66, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v60;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v60 != v11)
            objc_enumerationMutation(v8);
          v13 = -[SFPunchout initWithProtobuf:]([SFPunchout alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * i));
          if (v13)
            objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v59, v66, 16);
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
      -[SFTableRowCardSection setType:](v5, "setType:", v19);

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
    objc_msgSend(v4, "richDatas");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
      v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v25 = 0;

    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    objc_msgSend(v4, "richDatas");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v56;
      do
      {
        for (j = 0; j != v28; ++j)
        {
          if (*(_QWORD *)v56 != v29)
            objc_enumerationMutation(v26);
          v31 = -[SFRichText initWithProtobuf:]([SFRichText alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * j));
          if (v31)
            objc_msgSend(v25, "addObject:", v31);

        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
      }
      while (v28);
    }

    -[SFTableRowCardSection setRichData:](v5, "setRichData:", v25);
    objc_msgSend(v4, "tableIdentifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      objc_msgSend(v4, "tableIdentifier");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFTableRowCardSection setTableIdentifier:](v5, "setTableIdentifier:", v33);

    }
    objc_msgSend(v4, "alignmentSchema");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      v35 = [SFTableAlignmentSchema alloc];
      objc_msgSend(v4, "alignmentSchema");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = -[SFTableAlignmentSchema initWithProtobuf:](v35, "initWithProtobuf:", v36);
      -[SFTableRowCardSection setAlignmentSchema:](v5, "setAlignmentSchema:", v37);

    }
    objc_msgSend(v4, "datas");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v5;
    if (v38)
      v39 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v39 = 0;

    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    objc_msgSend(v4, "datas");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v51, v64, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v52;
      do
      {
        for (k = 0; k != v42; ++k)
        {
          if (*(_QWORD *)v52 != v43)
            objc_enumerationMutation(v40);
          v45 = -[SFFormattedText initWithProtobuf:]([SFFormattedText alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * k));
          if (v45)
            objc_msgSend(v39, "addObject:", v45);

        }
        v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v51, v64, 16);
      }
      while (v42);
    }

    v5 = v50;
    -[SFTableRowCardSection setData:](v50, "setData:", v39);
    if (objc_msgSend(v4, "isSubHeader"))
      -[SFTableRowCardSection setIsSubHeader:](v50, "setIsSubHeader:", objc_msgSend(v4, "isSubHeader"));
    objc_msgSend(v4, "tabGroupIdentifier");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (v46)
    {
      objc_msgSend(v4, "tabGroupIdentifier");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFTableRowCardSection setTabGroupIdentifier:](v50, "setTabGroupIdentifier:", v47);

    }
    if (objc_msgSend(v4, "reducedRowHeight"))
      -[SFTableRowCardSection setReducedRowHeight:](v50, "setReducedRowHeight:", objc_msgSend(v4, "reducedRowHeight"));
    if (objc_msgSend(v4, "verticalAlign"))
      -[SFTableRowCardSection setVerticalAlign:](v50, "setVerticalAlign:", objc_msgSend(v4, "verticalAlign"));
    if (objc_msgSend(v4, "alignRowsToHeader"))
      -[SFTableRowCardSection setAlignRowsToHeader:](v50, "setAlignRowsToHeader:", objc_msgSend(v4, "alignRowsToHeader"));
    v48 = v50;

  }
  return v5;
}

@end
