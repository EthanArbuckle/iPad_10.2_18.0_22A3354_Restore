@implementation SFDescriptionCardSection

- (void)setTitleNoWrap:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_titleNoWrap = a3;
}

- (BOOL)hasTitleNoWrap
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setDescriptionExpand:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_descriptionExpand = a3;
}

- (BOOL)hasDescriptionExpand
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setImageAlign:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_imageAlign = a3;
}

- (BOOL)hasImageAlign
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setTextAlign:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_textAlign = a3;
}

- (BOOL)hasTextAlign
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (SFDescriptionCardSection)initWithCoder:(id)a3
{
  id v4;
  SFDescriptionCardSection *v5;
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

    -[SFCardSection descriptionText](v8, "descriptionText");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDescriptionCardSection setDescriptionText:](v5, "setDescriptionText:", v16);

    -[SFCardSection expandText](v8, "expandText");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDescriptionCardSection setExpandText:](v5, "setExpandText:", v17);

    -[SFCardSection image](v8, "image");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDescriptionCardSection setImage:](v5, "setImage:", v18);

    -[SFDescriptionCardSection setTitleNoWrap:](v5, "setTitleNoWrap:", -[SFCardSection titleNoWrap](v8, "titleNoWrap"));
    -[SFCardSection titleWeight](v8, "titleWeight");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDescriptionCardSection setTitleWeight:](v5, "setTitleWeight:", v19);

    -[SFCardSection descriptionSize](v8, "descriptionSize");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDescriptionCardSection setDescriptionSize:](v5, "setDescriptionSize:", v20);

    -[SFCardSection descriptionWeight](v8, "descriptionWeight");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDescriptionCardSection setDescriptionWeight:](v5, "setDescriptionWeight:", v21);

    -[SFDescriptionCardSection setDescriptionExpand:](v5, "setDescriptionExpand:", -[SFCardSection descriptionExpand](v8, "descriptionExpand"));
    -[SFDescriptionCardSection setImageAlign:](v5, "setImageAlign:", -[SFCardSection imageAlign](v8, "imageAlign"));
    -[SFDescriptionCardSection setTextAlign:](v5, "setTextAlign:", -[SFCardSection textAlign](v8, "textAlign"));
    -[SFCardSection attributionText](v8, "attributionText");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDescriptionCardSection setAttributionText:](v5, "setAttributionText:", v22);

    -[SFCardSection attributionURL](v8, "attributionURL");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDescriptionCardSection setAttributionURL:](v5, "setAttributionURL:", v23);

    -[SFCardSection attributionGlyph](v8, "attributionGlyph");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDescriptionCardSection setAttributionGlyph:](v5, "setAttributionGlyph:", v24);

    -[SFCardSection richDescriptions](v8, "richDescriptions");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDescriptionCardSection setRichDescriptions:](v5, "setRichDescriptions:", v25);

    -[SFCardSection punchoutOptions](v8, "punchoutOptions");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutOptions:](v5, "setPunchoutOptions:", v26);

    -[SFCardSection punchoutPickerTitle](v8, "punchoutPickerTitle");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerTitle:](v5, "setPunchoutPickerTitle:", v27);

    -[SFCardSection punchoutPickerDismissText](v8, "punchoutPickerDismissText");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerDismissText:](v5, "setPunchoutPickerDismissText:", v28);

    -[SFCardSection setCanBeHidden:](v5, "setCanBeHidden:", -[SFCardSection canBeHidden](v8, "canBeHidden"));
    -[SFCardSection setHasTopPadding:](v5, "setHasTopPadding:", -[SFCardSection hasTopPadding](v8, "hasTopPadding"));
    -[SFCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", -[SFCardSection hasBottomPadding](v8, "hasBottomPadding"));
    -[SFCardSection type](v8, "type");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFTitleCardSection setType:](v5, "setType:", v29);

    -[SFCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", -[SFCardSection separatorStyle](v8, "separatorStyle"));
    -[SFCardSection backgroundColor](v8, "backgroundColor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setBackgroundColor:](v5, "setBackgroundColor:", v30);

    -[SFCardSection title](v8, "title");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFTitleCardSection setTitle:](v5, "setTitle:", v31);

    -[SFCardSection subtitle](v8, "subtitle");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFTitleCardSection setSubtitle:](v5, "setSubtitle:", v32);

    -[SFTitleCardSection setIsCentered:](v5, "setIsCentered:", -[SFCardSection isCentered](v8, "isCentered"));
    -[SFCardSection nextCard](v8, "nextCard");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setNextCard:](v5, "setNextCard:", v33);

    -[SFCardSection commands](v8, "commands");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCommands:](v5, "setCommands:", v34);

    -[SFCardSection parameterKeyPaths](v8, "parameterKeyPaths");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setParameterKeyPaths:](v5, "setParameterKeyPaths:", v35);

    -[SFCardSection cardSectionId](v8, "cardSectionId");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCardSectionId:](v5, "setCardSectionId:", v36);

    -[SFCardSection resultIdentifier](v8, "resultIdentifier");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setResultIdentifier:](v5, "setResultIdentifier:", v37);

    -[SFCardSection userReportRequest](v8, "userReportRequest");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setUserReportRequest:](v5, "setUserReportRequest:", v38);

    -[SFCardSection command](v8, "command");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCommand:](v5, "setCommand:", v39);

    -[SFCardSection previewCommand](v8, "previewCommand");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewCommand:](v5, "setPreviewCommand:", v40);

    -[SFCardSection previewButtonItems](v8, "previewButtonItems");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewButtonItems:](v5, "setPreviewButtonItems:", v41);

    -[SFCardSection cardSectionDetail](v8, "cardSectionDetail");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCardSectionDetail:](v5, "setCardSectionDetail:", v42);

    -[SFCardSection previewButtonItemsTitle](v8, "previewButtonItemsTitle");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewButtonItemsTitle:](v5, "setPreviewButtonItemsTitle:", v43);

    -[SFCardSection backgroundColor](v8, "backgroundColor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setBackgroundColor:](v5, "setBackgroundColor:", v44);

    -[SFCardSection setShouldHideInAmbientMode:](v5, "setShouldHideInAmbientMode:", -[SFCardSection shouldHideInAmbientMode](v8, "shouldHideInAmbientMode"));
    -[SFCardSection leadingSwipeButtonItems](v8, "leadingSwipeButtonItems");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setLeadingSwipeButtonItems:](v5, "setLeadingSwipeButtonItems:", v45);

    -[SFCardSection trailingSwipeButtonItems](v8, "trailingSwipeButtonItems");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setTrailingSwipeButtonItems:](v5, "setTrailingSwipeButtonItems:", v46);

    -[SFCardSection punchoutOptions](v8, "punchoutOptions");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutOptions:](v5, "setPunchoutOptions:", v47);

    -[SFCardSection punchoutPickerTitle](v8, "punchoutPickerTitle");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerTitle:](v5, "setPunchoutPickerTitle:", v48);

    -[SFCardSection punchoutPickerDismissText](v8, "punchoutPickerDismissText");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerDismissText:](v5, "setPunchoutPickerDismissText:", v49);

    -[SFCardSection setCanBeHidden:](v5, "setCanBeHidden:", -[SFCardSection canBeHidden](v8, "canBeHidden"));
    -[SFCardSection setHasTopPadding:](v5, "setHasTopPadding:", -[SFCardSection hasTopPadding](v8, "hasTopPadding"));
    -[SFCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", -[SFCardSection hasBottomPadding](v8, "hasBottomPadding"));
    -[SFCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", -[SFCardSection separatorStyle](v8, "separatorStyle"));
    -[SFCardSection referencedCommands](v8, "referencedCommands");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setReferencedCommands:](v5, "setReferencedCommands:", v50);

    -[SFCardSection setForceEnable3DTouch:](v5, "setForceEnable3DTouch:", -[SFCardSection forceEnable3DTouch](v8, "forceEnable3DTouch"));
    -[SFCardSection setShouldShowInSmartDialog:](v5, "setShouldShowInSmartDialog:", -[SFCardSection shouldShowInSmartDialog](v8, "shouldShowInSmartDialog"));
    -[SFCardSection appEntityAnnotation](v8, "appEntityAnnotation");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setAppEntityAnnotation:](v5, "setAppEntityAnnotation:", v51);

    -[SFCardSection emphasisSubjectId](v8, "emphasisSubjectId");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setEmphasisSubjectId:](v5, "setEmphasisSubjectId:", v52);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFDescriptionCardSection;
  -[SFTitleCardSection encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBDescriptionCardSection *v2;
  void *v3;

  v2 = -[_SFPBDescriptionCardSection initWithFacade:]([_SFPBDescriptionCardSection alloc], "initWithFacade:", self);
  -[_SFPBDescriptionCardSection dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBDescriptionCardSection *v2;
  void *v3;

  v2 = -[_SFPBDescriptionCardSection initWithFacade:]([_SFPBDescriptionCardSection alloc], "initWithFacade:", self);
  -[_SFPBDescriptionCardSection jsonData](v2, "jsonData");
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
  objc_super v40;

  v40.receiver = self;
  v40.super_class = (Class)SFDescriptionCardSection;
  v4 = -[SFTitleCardSection copyWithZone:](&v40, sel_copyWithZone_, a3);
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

  -[SFDescriptionCardSection descriptionText](self, "descriptionText");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");
  objc_msgSend(v4, "setDescriptionText:", v20);

  -[SFDescriptionCardSection expandText](self, "expandText");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "copy");
  objc_msgSend(v4, "setExpandText:", v22);

  -[SFDescriptionCardSection image](self, "image");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v23, "copy");
  objc_msgSend(v4, "setImage:", v24);

  objc_msgSend(v4, "setTitleNoWrap:", -[SFDescriptionCardSection titleNoWrap](self, "titleNoWrap"));
  -[SFDescriptionCardSection titleWeight](self, "titleWeight");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v25, "copy");
  objc_msgSend(v4, "setTitleWeight:", v26);

  -[SFDescriptionCardSection descriptionSize](self, "descriptionSize");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v27, "copy");
  objc_msgSend(v4, "setDescriptionSize:", v28);

  -[SFDescriptionCardSection descriptionWeight](self, "descriptionWeight");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v29, "copy");
  objc_msgSend(v4, "setDescriptionWeight:", v30);

  objc_msgSend(v4, "setDescriptionExpand:", -[SFDescriptionCardSection descriptionExpand](self, "descriptionExpand"));
  objc_msgSend(v4, "setImageAlign:", -[SFDescriptionCardSection imageAlign](self, "imageAlign"));
  objc_msgSend(v4, "setTextAlign:", -[SFDescriptionCardSection textAlign](self, "textAlign"));
  -[SFDescriptionCardSection attributionText](self, "attributionText");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v31, "copy");
  objc_msgSend(v4, "setAttributionText:", v32);

  -[SFDescriptionCardSection attributionURL](self, "attributionURL");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend(v33, "copy");
  objc_msgSend(v4, "setAttributionURL:", v34);

  -[SFDescriptionCardSection attributionGlyph](self, "attributionGlyph");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)objc_msgSend(v35, "copy");
  objc_msgSend(v4, "setAttributionGlyph:", v36);

  -[SFDescriptionCardSection richDescriptions](self, "richDescriptions");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)objc_msgSend(v37, "copy");
  objc_msgSend(v4, "setRichDescriptions:", v38);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  SFDescriptionCardSection *v5;
  SFDescriptionCardSection *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _BOOL4 v10;
  void *v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  char v17;
  void *v18;
  int v19;
  SFDescriptionCardSection *v20;
  int v21;
  int v22;
  int v23;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
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
  int v130;
  int v131;
  int v132;
  int v133;
  int v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  _BYTE v138[20];
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  _BOOL4 v142;
  uint64_t v143;
  int v144;
  int v145;
  id v146;
  id v147;
  _BOOL4 v148;
  _BOOL4 v149;
  _BOOL4 v150;
  _BOOL4 v151;
  _BOOL4 v152;
  __int128 v153;
  objc_super v154;

  v5 = (SFDescriptionCardSection *)a3;
  if (self == v5)
  {
    v17 = 1;
    goto LABEL_117;
  }
  if (!-[SFDescriptionCardSection isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class())
    || (v154.receiver = self,
        v154.super_class = (Class)SFDescriptionCardSection,
        !-[SFTitleCardSection isEqual:](&v154, sel_isEqual_, v5)))
  {
    v17 = 0;
    goto LABEL_117;
  }
  v6 = v5;
  -[SFCardSection punchoutOptions](self, "punchoutOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCardSection punchoutOptions](v6, "punchoutOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8 != 0;
  v146 = v8;
  v147 = v7;
  v144 = v9;
  v145 = v7 == 0;
  if (v145 == (_DWORD)v9)
  {
    v143 = 0;
    v141 = 0;
    v140 = 0;
    v153 = 0uLL;
    v12 = 0;
    memset(v138, 0, sizeof(v138));
    v136 = 0;
    v132 = 0;
    v134 = 0;
    v152 = 0;
    v130 = 0;
    v131 = 0;
    v151 = 0;
    v126 = 0;
    v129 = 0;
    v150 = 0;
    v120 = 0;
    v123 = 0;
    v149 = 0;
    v125 = 0;
    v128 = 0;
    v148 = 0;
    v121 = 0;
    v127 = 0;
    v142 = 0;
    v124 = 0;
    v122 = 0;
    v133 = 0;
    v135 = 0;
    v137 = 0;
    v139 = 0;
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
    v10 = v3 != 0;
    v119 = (void *)v3;
    if (!v3
      || (-[SFCardSection punchoutOptions](self, "punchoutOptions"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          -[SFCardSection punchoutOptions](v6, "punchoutOptions"),
          v116 = v11,
          v115 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v11, "isEqual:")))
    {
      -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v118 == 0;
      -[SFCardSection punchoutPickerTitle](v6, "punchoutPickerTitle");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      HIDWORD(v143) = v10;
      if ((_DWORD)v3 == (v117 != 0))
      {
        v140 = 0;
        v153 = 0uLL;
        v12 = 0;
        LODWORD(v143) = 0;
        memset(v138, 0, sizeof(v138));
        v136 = 0;
        v132 = 0;
        v134 = 0;
        v152 = 0;
        v130 = 0;
        v131 = 0;
        v151 = 0;
        v126 = 0;
        v129 = 0;
        v150 = 0;
        v120 = 0;
        v123 = 0;
        v149 = 0;
        v125 = 0;
        v128 = 0;
        v148 = 0;
        v121 = 0;
        v127 = 0;
        v142 = 0;
        v124 = 0;
        v122 = 0;
        v133 = 0;
        v135 = 0;
        v137 = 0;
        v139 = 0;
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v17 = 0;
        v141 = 1;
      }
      else
      {
        -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
        v3 = objc_claimAutoreleasedReturnValue();
        HIDWORD(v153) = v3 != 0;
        v114 = (void *)v3;
        if (!v3
          || (-[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle"),
              v18 = (void *)objc_claimAutoreleasedReturnValue(),
              -[SFCardSection punchoutPickerTitle](v6, "punchoutPickerTitle"),
              v111 = v18,
              v110 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v18, "isEqual:")))
        {
          -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          v3 = v113 == 0;
          -[SFCardSection punchoutPickerDismissText](v6, "punchoutPickerDismissText");
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          if ((_DWORD)v3 == (v112 != 0))
          {
            *(_QWORD *)v138 = 0;
            *(_QWORD *)&v138[8] = 0;
            *(_QWORD *)((char *)&v153 + 4) = 0;
            v12 = 0;
            LODWORD(v143) = 0;
            v136 = 0;
            LODWORD(v153) = 0;
            v132 = 0;
            v134 = 0;
            v152 = 0;
            v130 = 0;
            v131 = 0;
            v151 = 0;
            v126 = 0;
            v129 = 0;
            v150 = 0;
            v120 = 0;
            v123 = 0;
            v149 = 0;
            v125 = 0;
            v128 = 0;
            v148 = 0;
            v121 = 0;
            v127 = 0;
            v142 = 0;
            v124 = 0;
            v122 = 0;
            v133 = 0;
            v135 = 0;
            v137 = 0;
            v139 = 0;
            v13 = 0;
            v14 = 0;
            v15 = 0;
            v16 = 0;
            v17 = 0;
            v141 = 1;
            v140 = 1;
            *(_DWORD *)&v138[16] = 1;
          }
          else
          {
            -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
            v3 = objc_claimAutoreleasedReturnValue();
            DWORD2(v153) = v3 != 0;
            v109 = (void *)v3;
            if (!v3
              || (-[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText"),
                  v25 = (void *)objc_claimAutoreleasedReturnValue(),
                  -[SFCardSection punchoutPickerDismissText](v6, "punchoutPickerDismissText"),
                  v108 = v25,
                  v107 = (void *)objc_claimAutoreleasedReturnValue(),
                  objc_msgSend(v25, "isEqual:")))
            {
              v3 = -[SFCardSection canBeHidden](self, "canBeHidden");
              if ((_DWORD)v3 == -[SFCardSection canBeHidden](v6, "canBeHidden")
                && (v3 = -[SFCardSection hasTopPadding](self, "hasTopPadding"),
                    (_DWORD)v3 == -[SFCardSection hasTopPadding](v6, "hasTopPadding"))
                && (v3 = -[SFCardSection hasBottomPadding](self, "hasBottomPadding"),
                    (_DWORD)v3 == -[SFCardSection hasBottomPadding](v6, "hasBottomPadding")))
              {
                -[SFTitleCardSection type](self, "type");
                v106 = (void *)objc_claimAutoreleasedReturnValue();
                v3 = v106 == 0;
                -[SFTitleCardSection type](v6, "type");
                v105 = (void *)objc_claimAutoreleasedReturnValue();
                if ((_DWORD)v3 != (v105 != 0))
                {
                  -[SFTitleCardSection type](self, "type");
                  v26 = objc_claimAutoreleasedReturnValue();
                  v3 = v26 != 0;
                  v104 = (void *)v26;
                  if (v26)
                  {
                    -[SFTitleCardSection type](self, "type");
                    v27 = (void *)objc_claimAutoreleasedReturnValue();
                    -[SFTitleCardSection type](v6, "type");
                    v102 = (void *)objc_claimAutoreleasedReturnValue();
                    v103 = v27;
                    if (!objc_msgSend(v27, "isEqual:"))
                    {
                      *(_QWORD *)v138 = 0;
                      *(_QWORD *)&v153 = 0;
                      v136 = 0;
                      v132 = 0;
                      v134 = 0;
                      v152 = 0;
                      v130 = 0;
                      v131 = 0;
                      v151 = 0;
                      v126 = 0;
                      v129 = 0;
                      v150 = 0;
                      v120 = 0;
                      v123 = 0;
                      v149 = 0;
                      v125 = 0;
                      v128 = 0;
                      v148 = 0;
                      v121 = 0;
                      v127 = 0;
                      v142 = 0;
                      v124 = 0;
                      v122 = 0;
                      v133 = 0;
                      v135 = 0;
                      v137 = 0;
                      v139 = 0;
                      v13 = 0;
                      v14 = 0;
                      v15 = 0;
                      v16 = 0;
                      v17 = 0;
                      v141 = 1;
                      v140 = 1;
                      *(_DWORD *)&v138[16] = 1;
                      *(_QWORD *)&v138[8] = 0x100000001;
                      v12 = 1;
                      LODWORD(v143) = 1;
                      goto LABEL_16;
                    }
                    LODWORD(v143) = v3;
                  }
                  else
                  {
                    LODWORD(v143) = 0;
                  }
                  v3 = -[SFCardSection separatorStyle](self, "separatorStyle");
                  if ((_DWORD)v3 == -[SFCardSection separatorStyle](v6, "separatorStyle"))
                  {
                    -[SFCardSection backgroundColor](self, "backgroundColor");
                    v101 = (void *)objc_claimAutoreleasedReturnValue();
                    v3 = v101 == 0;
                    -[SFCardSection backgroundColor](v6, "backgroundColor");
                    v100 = (void *)objc_claimAutoreleasedReturnValue();
                    if ((_DWORD)v3 == (v100 != 0))
                    {
                      *(_QWORD *)&v153 = 0;
                      v136 = 0;
                      v132 = 0;
                      v134 = 0;
                      v152 = 0;
                      v130 = 0;
                      v131 = 0;
                      v151 = 0;
                      v126 = 0;
                      v129 = 0;
                      v150 = 0;
                      v120 = 0;
                      v123 = 0;
                      v149 = 0;
                      v125 = 0;
                      v128 = 0;
                      v148 = 0;
                      v121 = 0;
                      v127 = 0;
                      v142 = 0;
                      v124 = 0;
                      v122 = 0;
                      v133 = 0;
                      v135 = 0;
                      v137 = 0;
                      v139 = 0;
                      v13 = 0;
                      v14 = 0;
                      v15 = 0;
                      v16 = 0;
                      v17 = 0;
                      v141 = 1;
                      v140 = 1;
                      *(_DWORD *)&v138[16] = 1;
                      *(_QWORD *)&v138[8] = 0x100000001;
                      v12 = 1;
                      *(_QWORD *)v138 = 1;
                    }
                    else
                    {
                      -[SFCardSection backgroundColor](self, "backgroundColor");
                      v28 = objc_claimAutoreleasedReturnValue();
                      DWORD1(v153) = v28 != 0;
                      v99 = (void *)v28;
                      if (!v28
                        || (-[SFCardSection backgroundColor](self, "backgroundColor"),
                            v3 = objc_claimAutoreleasedReturnValue(),
                            -[SFCardSection backgroundColor](v6, "backgroundColor"),
                            v95 = (void *)objc_claimAutoreleasedReturnValue(),
                            v96 = (void *)v3,
                            objc_msgSend((id)v3, "isEqual:")))
                      {
                        -[SFTitleCardSection title](self, "title");
                        v98 = (void *)objc_claimAutoreleasedReturnValue();
                        v3 = v98 == 0;
                        -[SFTitleCardSection title](v6, "title");
                        v97 = (void *)objc_claimAutoreleasedReturnValue();
                        if ((_DWORD)v3 == (v97 != 0))
                        {
                          LODWORD(v153) = 0;
                          v132 = 0;
                          v134 = 0;
                          v152 = 0;
                          v130 = 0;
                          v131 = 0;
                          v151 = 0;
                          v126 = 0;
                          v129 = 0;
                          v150 = 0;
                          v120 = 0;
                          v123 = 0;
                          v149 = 0;
                          v125 = 0;
                          v128 = 0;
                          v148 = 0;
                          v121 = 0;
                          v127 = 0;
                          v142 = 0;
                          v124 = 0;
                          v122 = 0;
                          v133 = 0;
                          v135 = 0;
                          v137 = 0;
                          v139 = 0;
                          v13 = 0;
                          v14 = 0;
                          v15 = 0;
                          v16 = 0;
                          v17 = 0;
                          v141 = 1;
                          v140 = 1;
                          *(_DWORD *)&v138[16] = 1;
                          *(_QWORD *)&v138[8] = 0x100000001;
                          v12 = 1;
                          *(_QWORD *)v138 = 0x100000001;
                          v136 = 1;
                        }
                        else
                        {
                          -[SFTitleCardSection title](self, "title");
                          v29 = objc_claimAutoreleasedReturnValue();
                          LODWORD(v153) = v29 != 0;
                          v94 = (void *)v29;
                          if (!v29
                            || (-[SFTitleCardSection title](self, "title"),
                                v3 = objc_claimAutoreleasedReturnValue(),
                                -[SFTitleCardSection title](v6, "title"),
                                v90 = (void *)objc_claimAutoreleasedReturnValue(),
                                v91 = (void *)v3,
                                objc_msgSend((id)v3, "isEqual:")))
                          {
                            -[SFTitleCardSection subtitle](self, "subtitle");
                            v93 = (void *)objc_claimAutoreleasedReturnValue();
                            v3 = v93 == 0;
                            -[SFTitleCardSection subtitle](v6, "subtitle");
                            v92 = (void *)objc_claimAutoreleasedReturnValue();
                            if ((_DWORD)v3 == (v92 != 0))
                            {
                              v134 = 0;
                              v152 = 0;
                              v130 = 0;
                              v131 = 0;
                              v151 = 0;
                              v126 = 0;
                              v129 = 0;
                              v150 = 0;
                              v120 = 0;
                              v123 = 0;
                              v149 = 0;
                              v125 = 0;
                              v128 = 0;
                              v148 = 0;
                              v121 = 0;
                              v127 = 0;
                              v142 = 0;
                              v124 = 0;
                              v122 = 0;
                              v133 = 0;
                              v135 = 0;
                              v137 = 0;
                              v139 = 0;
                              v13 = 0;
                              v14 = 0;
                              v15 = 0;
                              v16 = 0;
                              v17 = 0;
                              v141 = 1;
                              v140 = 1;
                              *(_DWORD *)&v138[16] = 1;
                              *(_QWORD *)&v138[8] = 0x100000001;
                              v12 = 1;
                              *(_QWORD *)v138 = 0x100000001;
                              v136 = 0x100000001;
                              v132 = 1;
                            }
                            else
                            {
                              -[SFTitleCardSection subtitle](self, "subtitle");
                              v30 = objc_claimAutoreleasedReturnValue();
                              v152 = v30 != 0;
                              v89 = (void *)v30;
                              if (!v30
                                || (-[SFTitleCardSection subtitle](self, "subtitle"),
                                    v3 = objc_claimAutoreleasedReturnValue(),
                                    -[SFTitleCardSection subtitle](v6, "subtitle"),
                                    v85 = (void *)objc_claimAutoreleasedReturnValue(),
                                    v86 = (void *)v3,
                                    objc_msgSend((id)v3, "isEqual:")))
                              {
                                -[SFDescriptionCardSection descriptionText](self, "descriptionText");
                                v88 = (void *)objc_claimAutoreleasedReturnValue();
                                v3 = v88 == 0;
                                -[SFDescriptionCardSection descriptionText](v6, "descriptionText");
                                v87 = (void *)objc_claimAutoreleasedReturnValue();
                                if ((_DWORD)v3 == (v87 != 0))
                                {
                                  v131 = 0;
                                  v151 = 0;
                                  v126 = 0;
                                  v129 = 0;
                                  v150 = 0;
                                  v120 = 0;
                                  v123 = 0;
                                  v149 = 0;
                                  v125 = 0;
                                  v128 = 0;
                                  v148 = 0;
                                  v121 = 0;
                                  v127 = 0;
                                  v142 = 0;
                                  v124 = 0;
                                  v122 = 0;
                                  v133 = 0;
                                  v135 = 0;
                                  v137 = 0;
                                  v139 = 0;
                                  v13 = 0;
                                  v14 = 0;
                                  v15 = 0;
                                  v16 = 0;
                                  v17 = 0;
                                  v141 = 1;
                                  v140 = 1;
                                  *(_DWORD *)&v138[16] = 1;
                                  *(_QWORD *)&v138[8] = 0x100000001;
                                  v12 = 1;
                                  *(_QWORD *)v138 = 0x100000001;
                                  v136 = 0x100000001;
                                  v132 = 1;
                                  v134 = 1;
                                  v130 = 1;
                                }
                                else
                                {
                                  -[SFDescriptionCardSection descriptionText](self, "descriptionText");
                                  v31 = objc_claimAutoreleasedReturnValue();
                                  v151 = v31 != 0;
                                  v84 = (void *)v31;
                                  if (!v31
                                    || (-[SFDescriptionCardSection descriptionText](self, "descriptionText"),
                                        v3 = objc_claimAutoreleasedReturnValue(),
                                        -[SFDescriptionCardSection descriptionText](v6, "descriptionText"),
                                        v80 = (void *)objc_claimAutoreleasedReturnValue(),
                                        v81 = (void *)v3,
                                        objc_msgSend((id)v3, "isEqual:")))
                                  {
                                    -[SFDescriptionCardSection expandText](self, "expandText");
                                    v83 = (void *)objc_claimAutoreleasedReturnValue();
                                    v3 = v83 == 0;
                                    -[SFDescriptionCardSection expandText](v6, "expandText");
                                    v82 = (void *)objc_claimAutoreleasedReturnValue();
                                    if ((_DWORD)v3 == (v82 != 0))
                                    {
                                      v129 = 0;
                                      v150 = 0;
                                      v120 = 0;
                                      v123 = 0;
                                      v149 = 0;
                                      v125 = 0;
                                      v128 = 0;
                                      v148 = 0;
                                      v121 = 0;
                                      v127 = 0;
                                      v142 = 0;
                                      v124 = 0;
                                      v122 = 0;
                                      v133 = 0;
                                      v135 = 0;
                                      v137 = 0;
                                      v139 = 0;
                                      v13 = 0;
                                      v14 = 0;
                                      v15 = 0;
                                      v16 = 0;
                                      v17 = 0;
                                      v141 = 1;
                                      v140 = 1;
                                      *(_DWORD *)&v138[16] = 1;
                                      *(_QWORD *)&v138[8] = 0x100000001;
                                      v12 = 1;
                                      *(_QWORD *)v138 = 0x100000001;
                                      v136 = 0x100000001;
                                      v132 = 1;
                                      v134 = 1;
                                      v130 = 1;
                                      v131 = 1;
                                      v126 = 1;
                                    }
                                    else
                                    {
                                      -[SFDescriptionCardSection expandText](self, "expandText");
                                      v32 = objc_claimAutoreleasedReturnValue();
                                      v150 = v32 != 0;
                                      v79 = (void *)v32;
                                      if (!v32
                                        || (-[SFDescriptionCardSection expandText](self, "expandText"),
                                            v3 = objc_claimAutoreleasedReturnValue(),
                                            -[SFDescriptionCardSection expandText](v6, "expandText"),
                                            v75 = (void *)objc_claimAutoreleasedReturnValue(),
                                            v76 = (void *)v3,
                                            objc_msgSend((id)v3, "isEqual:")))
                                      {
                                        -[SFDescriptionCardSection image](self, "image");
                                        v78 = (void *)objc_claimAutoreleasedReturnValue();
                                        v3 = v78 == 0;
                                        -[SFDescriptionCardSection image](v6, "image");
                                        v77 = (void *)objc_claimAutoreleasedReturnValue();
                                        if ((_DWORD)v3 == (v77 != 0))
                                        {
                                          v123 = 0;
                                          v149 = 0;
                                          v125 = 0;
                                          v128 = 0;
                                          v148 = 0;
                                          v121 = 0;
                                          v127 = 0;
                                          v142 = 0;
                                          v124 = 0;
                                          v122 = 0;
                                          v133 = 0;
                                          v135 = 0;
                                          v137 = 0;
                                          v139 = 0;
                                          v13 = 0;
                                          v14 = 0;
                                          v15 = 0;
                                          v16 = 0;
                                          v17 = 0;
                                          v141 = 1;
                                          v140 = 1;
                                          *(_DWORD *)&v138[16] = 1;
                                          *(_QWORD *)&v138[8] = 0x100000001;
                                          v12 = 1;
                                          *(_QWORD *)v138 = 0x100000001;
                                          v136 = 0x100000001;
                                          v132 = 1;
                                          v134 = 1;
                                          v130 = 1;
                                          v131 = 1;
                                          v126 = 1;
                                          v129 = 1;
                                          v120 = 1;
                                        }
                                        else
                                        {
                                          -[SFDescriptionCardSection image](self, "image");
                                          v33 = objc_claimAutoreleasedReturnValue();
                                          v149 = v33 != 0;
                                          v74 = (void *)v33;
                                          if (!v33
                                            || (-[SFDescriptionCardSection image](self, "image"),
                                                v3 = objc_claimAutoreleasedReturnValue(),
                                                -[SFDescriptionCardSection image](v6, "image"),
                                                v72 = (void *)objc_claimAutoreleasedReturnValue(),
                                                v73 = (void *)v3,
                                                objc_msgSend((id)v3, "isEqual:")))
                                          {
                                            v3 = -[SFDescriptionCardSection titleNoWrap](self, "titleNoWrap");
                                            if ((_DWORD)v3 == -[SFDescriptionCardSection titleNoWrap](v6, "titleNoWrap"))
                                            {
                                              -[SFDescriptionCardSection titleWeight](self, "titleWeight");
                                              v71 = (void *)objc_claimAutoreleasedReturnValue();
                                              v3 = v71 == 0;
                                              -[SFDescriptionCardSection titleWeight](v6, "titleWeight");
                                              v70 = (void *)objc_claimAutoreleasedReturnValue();
                                              if ((_DWORD)v3 == (v70 != 0))
                                              {
                                                v128 = 0;
                                                v148 = 0;
                                                v121 = 0;
                                                v127 = 0;
                                                v142 = 0;
                                                v124 = 0;
                                                v122 = 0;
                                                v133 = 0;
                                                v135 = 0;
                                                v137 = 0;
                                                v139 = 0;
                                                v13 = 0;
                                                v14 = 0;
                                                v15 = 0;
                                                v16 = 0;
                                                v17 = 0;
                                                v141 = 1;
                                                v140 = 1;
                                                *(_DWORD *)&v138[16] = 1;
                                                *(_QWORD *)&v138[8] = 0x100000001;
                                                v12 = 1;
                                                *(_QWORD *)v138 = 0x100000001;
                                                v136 = 0x100000001;
                                                v132 = 1;
                                                v134 = 1;
                                                v130 = 1;
                                                v131 = 1;
                                                v126 = 1;
                                                v129 = 1;
                                                v120 = 1;
                                                v123 = 1;
                                                v125 = 1;
                                              }
                                              else
                                              {
                                                -[SFDescriptionCardSection titleWeight](self, "titleWeight");
                                                v34 = objc_claimAutoreleasedReturnValue();
                                                v148 = v34 != 0;
                                                v69 = (void *)v34;
                                                if (!v34
                                                  || (-[SFDescriptionCardSection titleWeight](self, "titleWeight"),
                                                      v3 = objc_claimAutoreleasedReturnValue(),
                                                      -[SFDescriptionCardSection titleWeight](v6, "titleWeight"),
                                                      v67 = (void *)objc_claimAutoreleasedReturnValue(),
                                                      v68 = (void *)v3,
                                                      objc_msgSend((id)v3, "isEqual:")))
                                                {
                                                  -[SFDescriptionCardSection descriptionSize](self, "descriptionSize");
                                                  v66 = (void *)objc_claimAutoreleasedReturnValue();
                                                  v3 = v66 == 0;
                                                  -[SFDescriptionCardSection descriptionSize](v6, "descriptionSize");
                                                  v65 = (void *)objc_claimAutoreleasedReturnValue();
                                                  if ((_DWORD)v3 == (v65 != 0))
                                                  {
                                                    v127 = 0;
                                                    v142 = 0;
                                                    v124 = 0;
                                                    v122 = 0;
                                                    v133 = 0;
                                                    v135 = 0;
                                                    v137 = 0;
                                                    v139 = 0;
                                                    v13 = 0;
                                                    v14 = 0;
                                                    v15 = 0;
                                                    v16 = 0;
                                                    v17 = 0;
                                                    v141 = 1;
                                                    v140 = 1;
                                                    *(_DWORD *)&v138[16] = 1;
                                                    *(_QWORD *)&v138[8] = 0x100000001;
                                                    v12 = 1;
                                                    *(_QWORD *)v138 = 0x100000001;
                                                    v136 = 0x100000001;
                                                    v132 = 1;
                                                    v134 = 1;
                                                    v130 = 1;
                                                    v131 = 1;
                                                    v126 = 1;
                                                    v129 = 1;
                                                    v120 = 1;
                                                    v123 = 1;
                                                    v125 = 1;
                                                    v128 = 1;
                                                    v121 = 1;
                                                  }
                                                  else
                                                  {
                                                    -[SFDescriptionCardSection descriptionSize](self, "descriptionSize");
                                                    v35 = objc_claimAutoreleasedReturnValue();
                                                    v142 = v35 != 0;
                                                    v64 = (void *)v35;
                                                    if (!v35
                                                      || (-[SFDescriptionCardSection descriptionSize](self, "descriptionSize"), v3 = objc_claimAutoreleasedReturnValue(), -[SFDescriptionCardSection descriptionSize](v6, "descriptionSize"), v62 = (void *)objc_claimAutoreleasedReturnValue(), v63 = (void *)v3, objc_msgSend((id)v3, "isEqual:")))
                                                    {
                                                      -[SFDescriptionCardSection descriptionWeight](self, "descriptionWeight");
                                                      v61 = (void *)objc_claimAutoreleasedReturnValue();
                                                      v3 = v61 == 0;
                                                      -[SFDescriptionCardSection descriptionWeight](v6, "descriptionWeight");
                                                      v60 = (void *)objc_claimAutoreleasedReturnValue();
                                                      if ((_DWORD)v3 == (v60 != 0))
                                                      {
                                                        v122 = 0;
                                                        v133 = 0;
                                                        v135 = 0;
                                                        v137 = 0;
                                                        v139 = 0;
                                                        v13 = 0;
                                                        v14 = 0;
                                                        v15 = 0;
                                                        v16 = 0;
                                                        v17 = 0;
                                                        v141 = 1;
                                                        v140 = 1;
                                                        *(_DWORD *)&v138[16] = 1;
                                                        *(_QWORD *)&v138[8] = 0x100000001;
                                                        v12 = 1;
                                                        *(_QWORD *)v138 = 0x100000001;
                                                        v136 = 0x100000001;
                                                        v132 = 1;
                                                        v134 = 1;
                                                        v130 = 1;
                                                        v131 = 1;
                                                        v126 = 1;
                                                        v129 = 1;
                                                        v120 = 1;
                                                        v123 = 1;
                                                        v125 = 1;
                                                        v128 = 1;
                                                        v121 = 1;
                                                        v127 = 1;
                                                        v124 = 1;
                                                      }
                                                      else
                                                      {
                                                        -[SFDescriptionCardSection descriptionWeight](self, "descriptionWeight");
                                                        v36 = objc_claimAutoreleasedReturnValue();
                                                        HIDWORD(v141) = v36 != 0;
                                                        v57 = (void *)v36;
                                                        if (!v36
                                                          || (-[SFDescriptionCardSection descriptionWeight](self, "descriptionWeight"), v3 = objc_claimAutoreleasedReturnValue(), -[SFDescriptionCardSection descriptionWeight](v6, "descriptionWeight"), v58 = (void *)objc_claimAutoreleasedReturnValue(), v59 = (void *)v3, objc_msgSend((id)v3, "isEqual:")))
                                                        {
                                                          v3 = -[SFDescriptionCardSection descriptionExpand](self, "descriptionExpand");
                                                          if ((_DWORD)v3 == -[SFDescriptionCardSection descriptionExpand](v6, "descriptionExpand")&& (v3 = -[SFDescriptionCardSection imageAlign](self, "imageAlign"), (_DWORD)v3 == -[SFDescriptionCardSection imageAlign](v6, "imageAlign"))&& (v3 = -[SFDescriptionCardSection textAlign](self, "textAlign"), (_DWORD)v3 == -[SFDescriptionCardSection textAlign](v6, "textAlign")))
                                                          {
                                                            -[SFDescriptionCardSection attributionText](self, "attributionText");
                                                            v54 = (void *)objc_claimAutoreleasedReturnValue();
                                                            v3 = v54 == 0;
                                                            -[SFDescriptionCardSection attributionText](v6, "attributionText");
                                                            v53 = (void *)objc_claimAutoreleasedReturnValue();
                                                            if ((_DWORD)v3 == (v53 != 0))
                                                            {
                                                              v135 = 0;
                                                              v137 = 0;
                                                              v139 = 0;
                                                              v13 = 0;
                                                              v14 = 0;
                                                              v15 = 0;
                                                              v16 = 0;
                                                              v17 = 0;
                                                              LODWORD(v141) = 1;
                                                              v140 = 1;
                                                              *(_DWORD *)&v138[16] = 1;
                                                              *(_QWORD *)&v138[8] = 0x100000001;
                                                              v12 = 1;
                                                              *(_QWORD *)v138 = 0x100000001;
                                                              v136 = 0x100000001;
                                                              v132 = 1;
                                                              v134 = 1;
                                                              v130 = 1;
                                                              v131 = 1;
                                                              v126 = 1;
                                                              v129 = 1;
                                                              v120 = 1;
                                                              v123 = 1;
                                                              v125 = 1;
                                                              v128 = 1;
                                                              v121 = 1;
                                                              v127 = 1;
                                                              v124 = 1;
                                                              v122 = 1;
                                                              v133 = 1;
                                                            }
                                                            else
                                                            {
                                                              -[SFDescriptionCardSection attributionText](self, "attributionText");
                                                              v37 = objc_claimAutoreleasedReturnValue();
                                                              HIDWORD(v140) = v37 != 0;
                                                              v52 = (void *)v37;
                                                              if (!v37
                                                                || (-[SFDescriptionCardSection attributionText](self, "attributionText"), v3 = objc_claimAutoreleasedReturnValue(), -[SFDescriptionCardSection attributionText](v6, "attributionText"), v55 = (void *)objc_claimAutoreleasedReturnValue(), v56 = (void *)v3, objc_msgSend((id)v3, "isEqual:")))
                                                              {
                                                                -[SFDescriptionCardSection attributionURL](self, "attributionURL");
                                                                v50 = (void *)objc_claimAutoreleasedReturnValue();
                                                                v3 = v50 == 0;
                                                                -[SFDescriptionCardSection attributionURL](v6, "attributionURL");
                                                                v48 = (void *)objc_claimAutoreleasedReturnValue();
                                                                if ((_DWORD)v3 == (v48 != 0))
                                                                {
                                                                  v137 = 0;
                                                                  v139 = 0;
                                                                  v13 = 0;
                                                                  v14 = 0;
                                                                  v15 = 0;
                                                                  v16 = 0;
                                                                  v17 = 0;
                                                                  LODWORD(v141) = 1;
                                                                  LODWORD(v140) = 1;
                                                                  *(_DWORD *)&v138[16] = 1;
                                                                  *(_QWORD *)&v138[8] = 0x100000001;
                                                                  v12 = 1;
                                                                  *(_QWORD *)v138 = 0x100000001;
                                                                  v136 = 0x100000001;
                                                                  v132 = 1;
                                                                  v134 = 1;
                                                                  v130 = 1;
                                                                  v131 = 1;
                                                                  v126 = 1;
                                                                  v129 = 1;
                                                                  v120 = 1;
                                                                  v123 = 1;
                                                                  v125 = 1;
                                                                  v128 = 1;
                                                                  v121 = 1;
                                                                  v127 = 1;
                                                                  v124 = 1;
                                                                  v122 = 1;
                                                                  v133 = 1;
                                                                  v135 = 0x100000001;
                                                                }
                                                                else
                                                                {
                                                                  -[SFDescriptionCardSection attributionURL](self, "attributionURL");
                                                                  v38 = objc_claimAutoreleasedReturnValue();
                                                                  HIDWORD(v139) = v38 != 0;
                                                                  v47 = (void *)v38;
                                                                  if (!v38
                                                                    || (-[SFDescriptionCardSection attributionURL](self, "attributionURL"), v3 = objc_claimAutoreleasedReturnValue(), -[SFDescriptionCardSection attributionURL](v6, "attributionURL"), v51 = (void *)v3, v49 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend((id)v3, "isEqual:")))
                                                                  {
                                                                    -[SFDescriptionCardSection attributionGlyph](self, "attributionGlyph");
                                                                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                                                                    v3 = v46 == 0;
                                                                    -[SFDescriptionCardSection attributionGlyph](v6, "attributionGlyph");
                                                                    v45 = (void *)objc_claimAutoreleasedReturnValue();
                                                                    if ((_DWORD)v3 == (v45 != 0))
                                                                    {
                                                                      v13 = 0;
                                                                      v14 = 0;
                                                                      v15 = 0;
                                                                      v16 = 0;
                                                                      v17 = 0;
                                                                      LODWORD(v141) = 1;
                                                                      LODWORD(v140) = 1;
                                                                      *(_DWORD *)&v138[16] = 1;
                                                                      LODWORD(v139) = 0;
                                                                      *(_QWORD *)&v138[8] = 0x100000001;
                                                                      v12 = 1;
                                                                      *(_QWORD *)v138 = 0x100000001;
                                                                      v136 = 0x100000001;
                                                                      v132 = 1;
                                                                      v134 = 1;
                                                                      v130 = 1;
                                                                      v131 = 1;
                                                                      v126 = 1;
                                                                      v129 = 1;
                                                                      v120 = 1;
                                                                      v123 = 1;
                                                                      v125 = 1;
                                                                      v128 = 1;
                                                                      v121 = 1;
                                                                      v127 = 1;
                                                                      v124 = 1;
                                                                      v122 = 1;
                                                                      v133 = 1;
                                                                      v135 = 0x100000001;
                                                                      v137 = 0x100000001;
                                                                    }
                                                                    else
                                                                    {
                                                                      -[SFDescriptionCardSection attributionGlyph](self, "attributionGlyph");
                                                                      v39 = objc_claimAutoreleasedReturnValue();
                                                                      LODWORD(v139) = v39 != 0;
                                                                      v42 = (void *)v39;
                                                                      if (!v39
                                                                        || (-[SFDescriptionCardSection attributionGlyph](self, "attributionGlyph"), v3 = objc_claimAutoreleasedReturnValue(), -[SFDescriptionCardSection attributionGlyph](v6, "attributionGlyph"), v43 = (void *)objc_claimAutoreleasedReturnValue(), v44 = (void *)v3, objc_msgSend((id)v3, "isEqual:")))
                                                                      {
                                                                        -[SFDescriptionCardSection richDescriptions](self, "richDescriptions");
                                                                        v41 = (void *)objc_claimAutoreleasedReturnValue();
                                                                        v3 = v41 == 0;
                                                                        -[SFDescriptionCardSection richDescriptions](v6, "richDescriptions");
                                                                        v40 = (void *)objc_claimAutoreleasedReturnValue();
                                                                        if ((_DWORD)v3 == (v40 != 0))
                                                                        {
                                                                          v15 = 0;
                                                                          v16 = 0;
                                                                          v17 = 0;
                                                                          LODWORD(v141) = 1;
                                                                          LODWORD(v140) = 1;
                                                                          *(_DWORD *)&v138[16] = 1;
                                                                          *(_QWORD *)&v138[8] = 0x100000001;
                                                                          v12 = 1;
                                                                          *(_QWORD *)v138 = 0x100000001;
                                                                          v136 = 0x100000001;
                                                                          v132 = 1;
                                                                          v134 = 1;
                                                                          v130 = 1;
                                                                          v131 = 1;
                                                                          v126 = 1;
                                                                          v129 = 1;
                                                                          v120 = 1;
                                                                          v123 = 1;
                                                                          v125 = 1;
                                                                          v128 = 1;
                                                                          v121 = 1;
                                                                          v127 = 1;
                                                                          v124 = 1;
                                                                          v122 = 1;
                                                                          v133 = 1;
                                                                          v135 = 0x100000001;
                                                                          v137 = 0x100000001;
                                                                          v13 = 1;
                                                                          v14 = 1;
                                                                        }
                                                                        else
                                                                        {
                                                                          -[SFDescriptionCardSection richDescriptions](self, "richDescriptions");
                                                                          v9 = objc_claimAutoreleasedReturnValue();
                                                                          if (v9)
                                                                          {
                                                                            -[SFDescriptionCardSection richDescriptions](self, "richDescriptions");
                                                                            v8 = (void *)objc_claimAutoreleasedReturnValue();
                                                                            -[SFDescriptionCardSection richDescriptions](v6, "richDescriptions");
                                                                            v3 = objc_claimAutoreleasedReturnValue();
                                                                            v17 = objc_msgSend(v8, "isEqual:", v3);
                                                                            v16 = 1;
                                                                            LODWORD(v141) = 1;
                                                                            LODWORD(v140) = 1;
                                                                            *(_DWORD *)&v138[16] = 1;
                                                                            *(_QWORD *)&v138[8] = 0x100000001;
                                                                            v12 = 1;
                                                                            *(_QWORD *)v138 = 0x100000001;
                                                                            v136 = 0x100000001;
                                                                            v132 = 1;
                                                                            v134 = 1;
                                                                            v130 = 1;
                                                                            v131 = 1;
                                                                            v126 = 1;
                                                                            v129 = 1;
                                                                            v120 = 1;
                                                                            v123 = 1;
                                                                            v125 = 1;
                                                                            v128 = 1;
                                                                            v121 = 1;
                                                                            v127 = 1;
                                                                            v124 = 1;
                                                                            v122 = 1;
                                                                            v133 = 1;
                                                                            v135 = 0x100000001;
                                                                            v137 = 0x100000001;
                                                                            v13 = 1;
                                                                            v14 = 1;
                                                                            v15 = 1;
                                                                          }
                                                                          else
                                                                          {
                                                                            v16 = 0;
                                                                            LODWORD(v141) = 1;
                                                                            LODWORD(v140) = 1;
                                                                            *(_DWORD *)&v138[16] = 1;
                                                                            *(_QWORD *)&v138[8] = 0x100000001;
                                                                            v12 = 1;
                                                                            *(_QWORD *)v138 = 0x100000001;
                                                                            v136 = 0x100000001;
                                                                            v132 = 1;
                                                                            v134 = 1;
                                                                            v130 = 1;
                                                                            v131 = 1;
                                                                            v126 = 1;
                                                                            v129 = 1;
                                                                            v120 = 1;
                                                                            v123 = 1;
                                                                            v125 = 1;
                                                                            v128 = 1;
                                                                            v121 = 1;
                                                                            v127 = 1;
                                                                            v124 = 1;
                                                                            v122 = 1;
                                                                            v133 = 1;
                                                                            v135 = 0x100000001;
                                                                            v137 = 0x100000001;
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
                                                                        LODWORD(v141) = 1;
                                                                        LODWORD(v140) = 1;
                                                                        *(_DWORD *)&v138[16] = 1;
                                                                        *(_QWORD *)&v138[8] = 0x100000001;
                                                                        v12 = 1;
                                                                        *(_QWORD *)v138 = 0x100000001;
                                                                        v136 = 0x100000001;
                                                                        v132 = 1;
                                                                        v134 = 1;
                                                                        v130 = 1;
                                                                        v131 = 1;
                                                                        v126 = 1;
                                                                        v129 = 1;
                                                                        v120 = 1;
                                                                        v123 = 1;
                                                                        v125 = 1;
                                                                        v128 = 1;
                                                                        v121 = 1;
                                                                        v127 = 1;
                                                                        v124 = 1;
                                                                        v122 = 1;
                                                                        v133 = 1;
                                                                        v135 = 0x100000001;
                                                                        v137 = 0x100000001;
                                                                        v13 = 1;
                                                                        LODWORD(v139) = 1;
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
                                                                    LODWORD(v141) = 1;
                                                                    LODWORD(v140) = 1;
                                                                    *(_DWORD *)&v138[16] = 1;
                                                                    v139 = 0x100000000;
                                                                    *(_QWORD *)&v138[8] = 0x100000001;
                                                                    v12 = 1;
                                                                    *(_QWORD *)v138 = 0x100000001;
                                                                    v136 = 0x100000001;
                                                                    v132 = 1;
                                                                    v134 = 1;
                                                                    v130 = 1;
                                                                    v131 = 1;
                                                                    v126 = 1;
                                                                    v129 = 1;
                                                                    v120 = 1;
                                                                    v123 = 1;
                                                                    v125 = 1;
                                                                    v128 = 1;
                                                                    v121 = 1;
                                                                    v127 = 1;
                                                                    v124 = 1;
                                                                    v122 = 1;
                                                                    v133 = 1;
                                                                    v135 = 0x100000001;
                                                                    v137 = 1;
                                                                  }
                                                                }
                                                              }
                                                              else
                                                              {
                                                                v135 = 0x100000000;
                                                                v137 = 0;
                                                                v139 = 0;
                                                                v13 = 0;
                                                                v14 = 0;
                                                                v15 = 0;
                                                                v16 = 0;
                                                                v17 = 0;
                                                                LODWORD(v141) = 1;
                                                                v140 = 0x100000001;
                                                                *(_DWORD *)&v138[16] = 1;
                                                                *(_QWORD *)&v138[8] = 0x100000001;
                                                                v12 = 1;
                                                                *(_QWORD *)v138 = 0x100000001;
                                                                v136 = 0x100000001;
                                                                v132 = 1;
                                                                v134 = 1;
                                                                v130 = 1;
                                                                v131 = 1;
                                                                v126 = 1;
                                                                v129 = 1;
                                                                v120 = 1;
                                                                v123 = 1;
                                                                v125 = 1;
                                                                v128 = 1;
                                                                v121 = 1;
                                                                v127 = 1;
                                                                v124 = 1;
                                                                v122 = 1;
                                                                v133 = 1;
                                                              }
                                                            }
                                                          }
                                                          else
                                                          {
                                                            v133 = 0;
                                                            v135 = 0;
                                                            v137 = 0;
                                                            v139 = 0;
                                                            v13 = 0;
                                                            v14 = 0;
                                                            v15 = 0;
                                                            v16 = 0;
                                                            v17 = 0;
                                                            LODWORD(v141) = 1;
                                                            v140 = 1;
                                                            *(_DWORD *)&v138[16] = 1;
                                                            *(_QWORD *)&v138[8] = 0x100000001;
                                                            v12 = 1;
                                                            *(_QWORD *)v138 = 0x100000001;
                                                            v136 = 0x100000001;
                                                            v132 = 1;
                                                            v134 = 1;
                                                            v130 = 1;
                                                            v131 = 1;
                                                            v126 = 1;
                                                            v129 = 1;
                                                            v120 = 1;
                                                            v123 = 1;
                                                            v125 = 1;
                                                            v128 = 1;
                                                            v121 = 1;
                                                            v127 = 1;
                                                            v124 = 1;
                                                            v122 = 1;
                                                          }
                                                        }
                                                        else
                                                        {
                                                          v133 = 0;
                                                          v135 = 0;
                                                          v137 = 0;
                                                          v139 = 0;
                                                          v13 = 0;
                                                          v14 = 0;
                                                          v15 = 0;
                                                          v16 = 0;
                                                          v17 = 0;
                                                          v141 = 0x100000001;
                                                          v140 = 1;
                                                          *(_DWORD *)&v138[16] = 1;
                                                          *(_QWORD *)&v138[8] = 0x100000001;
                                                          v12 = 1;
                                                          *(_QWORD *)v138 = 0x100000001;
                                                          v136 = 0x100000001;
                                                          v132 = 1;
                                                          v134 = 1;
                                                          v130 = 1;
                                                          v131 = 1;
                                                          v126 = 1;
                                                          v129 = 1;
                                                          v120 = 1;
                                                          v123 = 1;
                                                          v125 = 1;
                                                          v128 = 1;
                                                          v121 = 1;
                                                          v127 = 1;
                                                          v124 = 1;
                                                          v122 = 1;
                                                        }
                                                      }
                                                    }
                                                    else
                                                    {
                                                      v124 = 0;
                                                      v122 = 0;
                                                      v133 = 0;
                                                      v135 = 0;
                                                      v137 = 0;
                                                      v139 = 0;
                                                      v13 = 0;
                                                      v14 = 0;
                                                      v15 = 0;
                                                      v16 = 0;
                                                      v17 = 0;
                                                      v141 = 1;
                                                      v140 = 1;
                                                      *(_DWORD *)&v138[16] = 1;
                                                      *(_QWORD *)&v138[8] = 0x100000001;
                                                      v12 = 1;
                                                      *(_QWORD *)v138 = 0x100000001;
                                                      v136 = 0x100000001;
                                                      v132 = 1;
                                                      v134 = 1;
                                                      v130 = 1;
                                                      v131 = 1;
                                                      v126 = 1;
                                                      v129 = 1;
                                                      v120 = 1;
                                                      v123 = 1;
                                                      v125 = 1;
                                                      v128 = 1;
                                                      v121 = 1;
                                                      v127 = 1;
                                                      v142 = 1;
                                                    }
                                                  }
                                                }
                                                else
                                                {
                                                  v121 = 0;
                                                  v127 = 0;
                                                  v142 = 0;
                                                  v124 = 0;
                                                  v122 = 0;
                                                  v133 = 0;
                                                  v135 = 0;
                                                  v137 = 0;
                                                  v139 = 0;
                                                  v13 = 0;
                                                  v14 = 0;
                                                  v15 = 0;
                                                  v16 = 0;
                                                  v17 = 0;
                                                  v141 = 1;
                                                  v140 = 1;
                                                  *(_DWORD *)&v138[16] = 1;
                                                  *(_QWORD *)&v138[8] = 0x100000001;
                                                  v12 = 1;
                                                  *(_QWORD *)v138 = 0x100000001;
                                                  v136 = 0x100000001;
                                                  v132 = 1;
                                                  v134 = 1;
                                                  v130 = 1;
                                                  v131 = 1;
                                                  v126 = 1;
                                                  v129 = 1;
                                                  v120 = 1;
                                                  v123 = 1;
                                                  v125 = 1;
                                                  v128 = 1;
                                                  v148 = 1;
                                                }
                                              }
                                            }
                                            else
                                            {
                                              v125 = 0;
                                              v128 = 0;
                                              v148 = 0;
                                              v121 = 0;
                                              v127 = 0;
                                              v142 = 0;
                                              v124 = 0;
                                              v122 = 0;
                                              v133 = 0;
                                              v135 = 0;
                                              v137 = 0;
                                              v139 = 0;
                                              v13 = 0;
                                              v14 = 0;
                                              v15 = 0;
                                              v16 = 0;
                                              v17 = 0;
                                              v141 = 1;
                                              v140 = 1;
                                              *(_DWORD *)&v138[16] = 1;
                                              *(_QWORD *)&v138[8] = 0x100000001;
                                              v12 = 1;
                                              *(_QWORD *)v138 = 0x100000001;
                                              v136 = 0x100000001;
                                              v132 = 1;
                                              v134 = 1;
                                              v130 = 1;
                                              v131 = 1;
                                              v126 = 1;
                                              v129 = 1;
                                              v120 = 1;
                                              v123 = 1;
                                            }
                                          }
                                          else
                                          {
                                            v125 = 0;
                                            v128 = 0;
                                            v148 = 0;
                                            v121 = 0;
                                            v127 = 0;
                                            v142 = 0;
                                            v124 = 0;
                                            v122 = 0;
                                            v133 = 0;
                                            v135 = 0;
                                            v137 = 0;
                                            v139 = 0;
                                            v13 = 0;
                                            v14 = 0;
                                            v15 = 0;
                                            v16 = 0;
                                            v17 = 0;
                                            v141 = 1;
                                            v140 = 1;
                                            *(_DWORD *)&v138[16] = 1;
                                            *(_QWORD *)&v138[8] = 0x100000001;
                                            v12 = 1;
                                            *(_QWORD *)v138 = 0x100000001;
                                            v136 = 0x100000001;
                                            v132 = 1;
                                            v134 = 1;
                                            v130 = 1;
                                            v131 = 1;
                                            v126 = 1;
                                            v129 = 1;
                                            v120 = 1;
                                            v123 = 1;
                                            v149 = 1;
                                          }
                                        }
                                      }
                                      else
                                      {
                                        v120 = 0;
                                        v123 = 0;
                                        v149 = 0;
                                        v125 = 0;
                                        v128 = 0;
                                        v148 = 0;
                                        v121 = 0;
                                        v127 = 0;
                                        v142 = 0;
                                        v124 = 0;
                                        v122 = 0;
                                        v133 = 0;
                                        v135 = 0;
                                        v137 = 0;
                                        v139 = 0;
                                        v13 = 0;
                                        v14 = 0;
                                        v15 = 0;
                                        v16 = 0;
                                        v17 = 0;
                                        v141 = 1;
                                        v140 = 1;
                                        *(_DWORD *)&v138[16] = 1;
                                        *(_QWORD *)&v138[8] = 0x100000001;
                                        v12 = 1;
                                        *(_QWORD *)v138 = 0x100000001;
                                        v136 = 0x100000001;
                                        v132 = 1;
                                        v134 = 1;
                                        v130 = 1;
                                        v131 = 1;
                                        v126 = 1;
                                        v129 = 1;
                                        v150 = 1;
                                      }
                                    }
                                  }
                                  else
                                  {
                                    v126 = 0;
                                    v129 = 0;
                                    v150 = 0;
                                    v120 = 0;
                                    v123 = 0;
                                    v149 = 0;
                                    v125 = 0;
                                    v128 = 0;
                                    v148 = 0;
                                    v121 = 0;
                                    v127 = 0;
                                    v142 = 0;
                                    v124 = 0;
                                    v122 = 0;
                                    v133 = 0;
                                    v135 = 0;
                                    v137 = 0;
                                    v139 = 0;
                                    v13 = 0;
                                    v14 = 0;
                                    v15 = 0;
                                    v16 = 0;
                                    v17 = 0;
                                    v141 = 1;
                                    v140 = 1;
                                    *(_DWORD *)&v138[16] = 1;
                                    *(_QWORD *)&v138[8] = 0x100000001;
                                    v12 = 1;
                                    *(_QWORD *)v138 = 0x100000001;
                                    v136 = 0x100000001;
                                    v132 = 1;
                                    v134 = 1;
                                    v130 = 1;
                                    v131 = 1;
                                    v151 = 1;
                                  }
                                }
                              }
                              else
                              {
                                v130 = 0;
                                v131 = 0;
                                v151 = 0;
                                v126 = 0;
                                v129 = 0;
                                v150 = 0;
                                v120 = 0;
                                v123 = 0;
                                v149 = 0;
                                v125 = 0;
                                v128 = 0;
                                v148 = 0;
                                v121 = 0;
                                v127 = 0;
                                v142 = 0;
                                v124 = 0;
                                v122 = 0;
                                v133 = 0;
                                v135 = 0;
                                v137 = 0;
                                v139 = 0;
                                v13 = 0;
                                v14 = 0;
                                v15 = 0;
                                v16 = 0;
                                v17 = 0;
                                v141 = 1;
                                v140 = 1;
                                *(_DWORD *)&v138[16] = 1;
                                *(_QWORD *)&v138[8] = 0x100000001;
                                v12 = 1;
                                *(_QWORD *)v138 = 0x100000001;
                                v136 = 0x100000001;
                                v132 = 1;
                                v134 = 1;
                                v152 = 1;
                              }
                            }
                          }
                          else
                          {
                            v132 = 0;
                            v134 = 0;
                            v152 = 0;
                            v130 = 0;
                            v131 = 0;
                            v151 = 0;
                            v126 = 0;
                            v129 = 0;
                            v150 = 0;
                            v120 = 0;
                            v123 = 0;
                            v149 = 0;
                            v125 = 0;
                            v128 = 0;
                            v148 = 0;
                            v121 = 0;
                            v127 = 0;
                            v142 = 0;
                            v124 = 0;
                            v122 = 0;
                            v133 = 0;
                            v135 = 0;
                            v137 = 0;
                            v139 = 0;
                            v13 = 0;
                            v14 = 0;
                            v15 = 0;
                            v16 = 0;
                            v17 = 0;
                            v141 = 1;
                            v140 = 1;
                            *(_DWORD *)&v138[16] = 1;
                            *(_QWORD *)&v138[8] = 0x100000001;
                            v12 = 1;
                            *(_QWORD *)v138 = 0x100000001;
                            v136 = 0x100000001;
                            LODWORD(v153) = 1;
                          }
                        }
                      }
                      else
                      {
                        v136 = 0;
                        *(_QWORD *)&v153 = 0x100000000;
                        v132 = 0;
                        v134 = 0;
                        v152 = 0;
                        v130 = 0;
                        v131 = 0;
                        v151 = 0;
                        v126 = 0;
                        v129 = 0;
                        v150 = 0;
                        v120 = 0;
                        v123 = 0;
                        v149 = 0;
                        v125 = 0;
                        v128 = 0;
                        v148 = 0;
                        v121 = 0;
                        v127 = 0;
                        v142 = 0;
                        v124 = 0;
                        v122 = 0;
                        v133 = 0;
                        v135 = 0;
                        v137 = 0;
                        v139 = 0;
                        v13 = 0;
                        v14 = 0;
                        v15 = 0;
                        v16 = 0;
                        v17 = 0;
                        v141 = 1;
                        v140 = 1;
                        *(_DWORD *)&v138[16] = 1;
                        *(_QWORD *)&v138[8] = 0x100000001;
                        v12 = 1;
                        *(_QWORD *)v138 = 0x100000001;
                      }
                    }
                  }
                  else
                  {
                    *(_QWORD *)v138 = 0;
                    *(_QWORD *)&v153 = 0;
                    v136 = 0;
                    v132 = 0;
                    v134 = 0;
                    v152 = 0;
                    v130 = 0;
                    v131 = 0;
                    v151 = 0;
                    v126 = 0;
                    v129 = 0;
                    v150 = 0;
                    v120 = 0;
                    v123 = 0;
                    v149 = 0;
                    v125 = 0;
                    v128 = 0;
                    v148 = 0;
                    v121 = 0;
                    v127 = 0;
                    v142 = 0;
                    v124 = 0;
                    v122 = 0;
                    v133 = 0;
                    v135 = 0;
                    v137 = 0;
                    v139 = 0;
                    v13 = 0;
                    v14 = 0;
                    v15 = 0;
                    v16 = 0;
                    v17 = 0;
                    v141 = 1;
                    v140 = 1;
                    *(_DWORD *)&v138[12] = 1;
                    *(_DWORD *)&v138[16] = 1;
                    *(_DWORD *)&v138[8] = 1;
                    v12 = 1;
                  }
                  goto LABEL_16;
                }
                v12 = 0;
                LODWORD(v143) = 0;
                *(_QWORD *)v138 = 0;
                *(_QWORD *)&v153 = 0;
                v136 = 0;
                v132 = 0;
                v134 = 0;
                v152 = 0;
                v130 = 0;
                v131 = 0;
                v151 = 0;
                v126 = 0;
                v129 = 0;
                v150 = 0;
                v120 = 0;
                v123 = 0;
                v149 = 0;
                v125 = 0;
                v128 = 0;
                v148 = 0;
                v121 = 0;
                v127 = 0;
                v142 = 0;
                v124 = 0;
                v122 = 0;
                v133 = 0;
                v135 = 0;
                v137 = 0;
                v139 = 0;
                v13 = 0;
                v14 = 0;
                v15 = 0;
                v16 = 0;
                v17 = 0;
                v141 = 1;
                v140 = 1;
                *(_DWORD *)&v138[16] = 1;
                *(_DWORD *)&v138[8] = 1;
                *(_DWORD *)&v138[12] = 1;
              }
              else
              {
                v12 = 0;
                LODWORD(v143) = 0;
                *(_QWORD *)v138 = 0;
                *(_QWORD *)&v153 = 0;
                v136 = 0;
                v132 = 0;
                v134 = 0;
                v152 = 0;
                v130 = 0;
                v131 = 0;
                v151 = 0;
                v126 = 0;
                v129 = 0;
                v150 = 0;
                v120 = 0;
                v123 = 0;
                v149 = 0;
                v125 = 0;
                v128 = 0;
                v148 = 0;
                v121 = 0;
                v127 = 0;
                v142 = 0;
                v124 = 0;
                v122 = 0;
                v133 = 0;
                v135 = 0;
                v137 = 0;
                v139 = 0;
                v13 = 0;
                v14 = 0;
                v15 = 0;
                v16 = 0;
                v17 = 0;
                v141 = 1;
                v140 = 1;
                *(_DWORD *)&v138[16] = 1;
                *(_QWORD *)&v138[8] = 1;
              }
            }
            else
            {
              v12 = 0;
              LODWORD(v143) = 0;
              *(_QWORD *)v138 = 0;
              *(_QWORD *)&v153 = 0;
              v136 = 0;
              v132 = 0;
              v134 = 0;
              v152 = 0;
              v130 = 0;
              v131 = 0;
              v151 = 0;
              v126 = 0;
              v129 = 0;
              v150 = 0;
              v120 = 0;
              v123 = 0;
              v149 = 0;
              v125 = 0;
              v128 = 0;
              v148 = 0;
              v121 = 0;
              v127 = 0;
              v142 = 0;
              v124 = 0;
              v122 = 0;
              v133 = 0;
              v135 = 0;
              v137 = 0;
              v139 = 0;
              v13 = 0;
              v14 = 0;
              v15 = 0;
              v16 = 0;
              v17 = 0;
              v141 = 1;
              v140 = 1;
              *(_DWORD *)&v138[16] = 1;
              *(_QWORD *)&v138[8] = 1;
              DWORD2(v153) = 1;
            }
          }
        }
        else
        {
          *(_QWORD *)((char *)&v153 + 4) = 0;
          v12 = 0;
          LODWORD(v143) = 0;
          memset(v138, 0, sizeof(v138));
          v136 = 0;
          LODWORD(v153) = 0;
          v132 = 0;
          v134 = 0;
          v152 = 0;
          v130 = 0;
          v131 = 0;
          v151 = 0;
          v126 = 0;
          v129 = 0;
          v150 = 0;
          v120 = 0;
          v123 = 0;
          v149 = 0;
          v125 = 0;
          v128 = 0;
          v148 = 0;
          v121 = 0;
          v127 = 0;
          v142 = 0;
          v124 = 0;
          v122 = 0;
          v133 = 0;
          v135 = 0;
          v137 = 0;
          v139 = 0;
          v13 = 0;
          v14 = 0;
          v15 = 0;
          v16 = 0;
          v17 = 0;
          v141 = 1;
          v140 = 1;
          HIDWORD(v153) = 1;
        }
      }
    }
    else
    {
      v141 = 0;
      v140 = 0;
      v153 = 0uLL;
      v12 = 0;
      v143 = 0x100000000;
      memset(v138, 0, sizeof(v138));
      v136 = 0;
      v132 = 0;
      v134 = 0;
      v152 = 0;
      v130 = 0;
      v131 = 0;
      v151 = 0;
      v126 = 0;
      v129 = 0;
      v150 = 0;
      v120 = 0;
      v123 = 0;
      v149 = 0;
      v125 = 0;
      v128 = 0;
      v148 = 0;
      v121 = 0;
      v127 = 0;
      v142 = 0;
      v124 = 0;
      v122 = 0;
      v133 = 0;
      v135 = 0;
      v137 = 0;
      v139 = 0;
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
    v19 = v13;
    v20 = v6;
    v21 = v14;
    v22 = v12;
    v23 = v15;

    v15 = v23;
    v12 = v22;
    v14 = v21;
    v6 = v20;
    v13 = v19;
  }
  if (v15)

  if (v14)
  {

  }
  if ((_DWORD)v139)
  {

  }
  if (v13)

  if (HIDWORD(v137))
  {

  }
  if (HIDWORD(v139))
  {

  }
  if ((_DWORD)v137)

  if ((_DWORD)v135)
  {

  }
  if (HIDWORD(v140))
  {

  }
  if (HIDWORD(v135))

  if (v133)
  {

  }
  if (HIDWORD(v141))
  {

  }
  if (v122)

  if (v124)
  {

  }
  if (v142)
  {

  }
  if (v127)

  if (v121)
  {

  }
  if (v148)
  {

  }
  if (v128)

  if (v125)
  {

  }
  if (v149)
  {

  }
  if (v123)

  if (v120)
  {

  }
  if (v150)
  {

  }
  if (v129)

  if (v126)
  {

  }
  if (v151)
  {

  }
  if (v131)

  if (v130)
  {

  }
  if (v152)
  {

  }
  if (v134)

  if (v132)
  {

  }
  if ((_DWORD)v153)
  {

  }
  if (HIDWORD(v136))

  if ((_DWORD)v136)
  {

  }
  if (DWORD1(v153))
  {

  }
  if (*(_DWORD *)&v138[4])

  if (*(_DWORD *)v138)
  {

  }
  if ((_DWORD)v143)
  {

  }
  if (v12)

  if (*(_DWORD *)&v138[12])
  {

  }
  if (DWORD2(v153))
  {

  }
  if (*(_DWORD *)&v138[8])

  if (*(_DWORD *)&v138[16])
  {

  }
  if (HIDWORD(v153))
  {

  }
  if ((_DWORD)v140)

  if ((_DWORD)v141)
  {

  }
  if (HIDWORD(v143))
  {

  }
  if (v145 != v144)

LABEL_117:
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
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  unint64_t v36;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  objc_super v47;

  v47.receiver = self;
  v47.super_class = (Class)SFDescriptionCardSection;
  v3 = -[SFTitleCardSection hash](&v47, sel_hash);
  -[SFCardSection punchoutOptions](self, "punchoutOptions");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v46, "hash");
  -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 ^ objc_msgSend(v45, "hash");
  -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 ^ objc_msgSend(v44, "hash");
  v7 = v6 ^ -[SFCardSection canBeHidden](self, "canBeHidden");
  v8 = v7 ^ -[SFCardSection hasTopPadding](self, "hasTopPadding") ^ v3;
  v9 = -[SFCardSection hasBottomPadding](self, "hasBottomPadding");
  -[SFTitleCardSection type](self, "type");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9 ^ objc_msgSend(v43, "hash");
  v11 = v10 ^ -[SFCardSection separatorStyle](self, "separatorStyle");
  -[SFCardSection backgroundColor](self, "backgroundColor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11 ^ objc_msgSend(v42, "hash");
  -[SFTitleCardSection title](self, "title");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v8 ^ v12 ^ objc_msgSend(v41, "hash");
  -[SFTitleCardSection subtitle](self, "subtitle");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v40, "hash");
  -[SFDescriptionCardSection descriptionText](self, "descriptionText");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14 ^ objc_msgSend(v39, "hash");
  -[SFDescriptionCardSection expandText](self, "expandText");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15 ^ objc_msgSend(v38, "hash");
  -[SFDescriptionCardSection image](self, "image");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v16 ^ objc_msgSend(v17, "hash");
  v19 = v18 ^ -[SFDescriptionCardSection titleNoWrap](self, "titleNoWrap");
  -[SFDescriptionCardSection titleWeight](self, "titleWeight");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v19 ^ objc_msgSend(v20, "hash");
  -[SFDescriptionCardSection descriptionSize](self, "descriptionSize");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v13 ^ v21 ^ objc_msgSend(v22, "hash");
  -[SFDescriptionCardSection descriptionWeight](self, "descriptionWeight");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "hash");
  v26 = v25 ^ -[SFDescriptionCardSection descriptionExpand](self, "descriptionExpand");
  v27 = v26 ^ -[SFDescriptionCardSection imageAlign](self, "imageAlign");
  v28 = v27 ^ -[SFDescriptionCardSection textAlign](self, "textAlign");
  -[SFDescriptionCardSection attributionText](self, "attributionText");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v28 ^ objc_msgSend(v29, "hash");
  -[SFDescriptionCardSection attributionURL](self, "attributionURL");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v30 ^ objc_msgSend(v31, "hash");
  -[SFDescriptionCardSection attributionGlyph](self, "attributionGlyph");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v23 ^ v32 ^ objc_msgSend(v33, "hash");
  -[SFDescriptionCardSection richDescriptions](self, "richDescriptions");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v34 ^ objc_msgSend(v35, "hash");

  return v36;
}

- (SFText)descriptionText
{
  return self->_descriptionText;
}

- (void)setDescriptionText:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionText, a3);
}

- (NSString)expandText
{
  return self->_expandText;
}

- (void)setExpandText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (SFImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (BOOL)titleNoWrap
{
  return self->_titleNoWrap;
}

- (NSNumber)titleWeight
{
  return self->_titleWeight;
}

- (void)setTitleWeight:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (NSNumber)descriptionSize
{
  return self->_descriptionSize;
}

- (void)setDescriptionSize:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (NSNumber)descriptionWeight
{
  return self->_descriptionWeight;
}

- (void)setDescriptionWeight:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
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

- (void)setAttributionText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (NSURL)attributionURL
{
  return self->_attributionURL;
}

- (void)setAttributionURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (SFImage)attributionGlyph
{
  return self->_attributionGlyph;
}

- (void)setAttributionGlyph:(id)a3
{
  objc_storeStrong((id *)&self->_attributionGlyph, a3);
}

- (NSArray)richDescriptions
{
  return self->_richDescriptions;
}

- (void)setRichDescriptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 320);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_richDescriptions, 0);
  objc_storeStrong((id *)&self->_attributionGlyph, 0);
  objc_storeStrong((id *)&self->_attributionURL, 0);
  objc_storeStrong((id *)&self->_attributionText, 0);
  objc_storeStrong((id *)&self->_descriptionWeight, 0);
  objc_storeStrong((id *)&self->_descriptionSize, 0);
  objc_storeStrong((id *)&self->_titleWeight, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_expandText, 0);
  objc_storeStrong((id *)&self->_descriptionText, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFDescriptionCardSection)initWithProtobuf:(id)a3
{
  id v4;
  SFDescriptionCardSection *v5;
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
  SFText *v29;
  void *v30;
  SFText *v31;
  void *v32;
  void *v33;
  void *v34;
  SFImage *v35;
  void *v36;
  SFImage *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  SFImage *v47;
  void *v48;
  SFImage *v49;
  void *v50;
  id v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t j;
  SFRichText *v57;
  SFDescriptionCardSection *v58;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  objc_super v68;
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v68.receiver = self;
  v68.super_class = (Class)SFDescriptionCardSection;
  v5 = -[SFCardSection init](&v68, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "punchoutOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v7 = 0;

    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    objc_msgSend(v4, "punchoutOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v65;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v65 != v11)
            objc_enumerationMutation(v8);
          v13 = -[SFPunchout initWithProtobuf:]([SFPunchout alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * i));
          if (v13)
            objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
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
    objc_msgSend(v4, "descriptionText");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      v29 = [SFText alloc];
      objc_msgSend(v4, "descriptionText");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = -[SFText initWithProtobuf:](v29, "initWithProtobuf:", v30);
      -[SFDescriptionCardSection setDescriptionText:](v5, "setDescriptionText:", v31);

    }
    objc_msgSend(v4, "expandText");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      objc_msgSend(v4, "expandText");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFDescriptionCardSection setExpandText:](v5, "setExpandText:", v33);

    }
    objc_msgSend(v4, "image");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      v35 = [SFImage alloc];
      objc_msgSend(v4, "image");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = -[SFImage initWithProtobuf:](v35, "initWithProtobuf:", v36);
      -[SFDescriptionCardSection setImage:](v5, "setImage:", v37);

    }
    if (objc_msgSend(v4, "titleNoWrap"))
      -[SFDescriptionCardSection setTitleNoWrap:](v5, "setTitleNoWrap:", objc_msgSend(v4, "titleNoWrap"));
    if (objc_msgSend(v4, "titleWeight"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "titleWeight"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFDescriptionCardSection setTitleWeight:](v5, "setTitleWeight:", v38);

    }
    if (objc_msgSend(v4, "descriptionSize"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "descriptionSize"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFDescriptionCardSection setDescriptionSize:](v5, "setDescriptionSize:", v39);

    }
    if (objc_msgSend(v4, "descriptionWeight"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "descriptionWeight"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFDescriptionCardSection setDescriptionWeight:](v5, "setDescriptionWeight:", v40);

    }
    if (objc_msgSend(v4, "descriptionExpand"))
      -[SFDescriptionCardSection setDescriptionExpand:](v5, "setDescriptionExpand:", objc_msgSend(v4, "descriptionExpand"));
    if (objc_msgSend(v4, "imageAlign"))
      -[SFDescriptionCardSection setImageAlign:](v5, "setImageAlign:", objc_msgSend(v4, "imageAlign"));
    if (objc_msgSend(v4, "textAlign"))
      -[SFDescriptionCardSection setTextAlign:](v5, "setTextAlign:", objc_msgSend(v4, "textAlign"));
    objc_msgSend(v4, "attributionText");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (v41)
    {
      objc_msgSend(v4, "attributionText");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFDescriptionCardSection setAttributionText:](v5, "setAttributionText:", v42);

    }
    objc_msgSend(v4, "attributionURL");
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if (v43)
    {
      objc_msgSend(v4, "attributionURL");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      _SFPBURLHandwrittenTranslator(v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFDescriptionCardSection setAttributionURL:](v5, "setAttributionURL:", v45);

    }
    objc_msgSend(v4, "attributionGlyph");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (v46)
    {
      v47 = [SFImage alloc];
      objc_msgSend(v4, "attributionGlyph");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = -[SFImage initWithProtobuf:](v47, "initWithProtobuf:", v48);
      -[SFDescriptionCardSection setAttributionGlyph:](v5, "setAttributionGlyph:", v49);

    }
    objc_msgSend(v4, "richDescriptions");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (v50)
      v51 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v51 = 0;

    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    objc_msgSend(v4, "richDescriptions", 0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
    if (v53)
    {
      v54 = v53;
      v55 = *(_QWORD *)v61;
      do
      {
        for (j = 0; j != v54; ++j)
        {
          if (*(_QWORD *)v61 != v55)
            objc_enumerationMutation(v52);
          v57 = -[SFRichText initWithProtobuf:]([SFRichText alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * j));
          if (v57)
            objc_msgSend(v51, "addObject:", v57);

        }
        v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
      }
      while (v54);
    }

    -[SFDescriptionCardSection setRichDescriptions:](v5, "setRichDescriptions:", v51);
    v58 = v5;

  }
  return v5;
}

@end
