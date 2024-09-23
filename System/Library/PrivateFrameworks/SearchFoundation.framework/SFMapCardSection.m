@implementation SFMapCardSection

- (void)setInteractive:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_interactive = a3;
}

- (BOOL)hasInteractive
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setSizeFormat:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_sizeFormat = a3;
}

- (BOOL)hasSizeFormat
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setPinBehavior:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_pinBehavior = a3;
}

- (BOOL)hasPinBehavior
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (SFMapCardSection)initWithCoder:(id)a3
{
  id v4;
  SFMapCardSection *v5;
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
    -[SFMapCardSection setType:](v5, "setType:", v12);

    -[SFCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", -[SFCardSection separatorStyle](v8, "separatorStyle"));
    -[SFCardSection backgroundColor](v8, "backgroundColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setBackgroundColor:](v5, "setBackgroundColor:", v13);

    -[SFCardSection location](v8, "location");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFMapCardSection setLocation:](v5, "setLocation:", v14);

    -[SFCardSection pinColor](v8, "pinColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFMapCardSection setPinColor:](v5, "setPinColor:", v15);

    -[SFCardSection footnoteLabel](v8, "footnoteLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFMapCardSection setFootnoteLabel:](v5, "setFootnoteLabel:", v16);

    -[SFCardSection footnote](v8, "footnote");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFMapCardSection setFootnote:](v5, "setFootnote:", v17);

    -[SFMapCardSection setInteractive:](v5, "setInteractive:", -[SFCardSection interactive](v8, "interactive"));
    -[SFMapCardSection setSizeFormat:](v5, "setSizeFormat:", -[SFCardSection sizeFormat](v8, "sizeFormat"));
    -[SFCardSection boundingMapRegion](v8, "boundingMapRegion");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFMapCardSection setBoundingMapRegion:](v5, "setBoundingMapRegion:", v18);

    -[SFMapCardSection setPinBehavior:](v5, "setPinBehavior:", -[SFCardSection pinBehavior](v8, "pinBehavior"));
    -[SFCardSection pins](v8, "pins");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFMapCardSection setPins:](v5, "setPins:", v19);

    -[SFCardSection nextCard](v8, "nextCard");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setNextCard:](v5, "setNextCard:", v20);

    -[SFCardSection commands](v8, "commands");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCommands:](v5, "setCommands:", v21);

    -[SFCardSection parameterKeyPaths](v8, "parameterKeyPaths");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setParameterKeyPaths:](v5, "setParameterKeyPaths:", v22);

    -[SFCardSection cardSectionId](v8, "cardSectionId");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCardSectionId:](v5, "setCardSectionId:", v23);

    -[SFCardSection resultIdentifier](v8, "resultIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setResultIdentifier:](v5, "setResultIdentifier:", v24);

    -[SFCardSection userReportRequest](v8, "userReportRequest");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setUserReportRequest:](v5, "setUserReportRequest:", v25);

    -[SFCardSection command](v8, "command");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCommand:](v5, "setCommand:", v26);

    -[SFCardSection previewCommand](v8, "previewCommand");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewCommand:](v5, "setPreviewCommand:", v27);

    -[SFCardSection previewButtonItems](v8, "previewButtonItems");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewButtonItems:](v5, "setPreviewButtonItems:", v28);

    -[SFCardSection cardSectionDetail](v8, "cardSectionDetail");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCardSectionDetail:](v5, "setCardSectionDetail:", v29);

    -[SFCardSection previewButtonItemsTitle](v8, "previewButtonItemsTitle");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewButtonItemsTitle:](v5, "setPreviewButtonItemsTitle:", v30);

    -[SFCardSection backgroundColor](v8, "backgroundColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setBackgroundColor:](v5, "setBackgroundColor:", v31);

    -[SFCardSection setShouldHideInAmbientMode:](v5, "setShouldHideInAmbientMode:", -[SFCardSection shouldHideInAmbientMode](v8, "shouldHideInAmbientMode"));
    -[SFCardSection leadingSwipeButtonItems](v8, "leadingSwipeButtonItems");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setLeadingSwipeButtonItems:](v5, "setLeadingSwipeButtonItems:", v32);

    -[SFCardSection trailingSwipeButtonItems](v8, "trailingSwipeButtonItems");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setTrailingSwipeButtonItems:](v5, "setTrailingSwipeButtonItems:", v33);

    -[SFCardSection punchoutOptions](v8, "punchoutOptions");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutOptions:](v5, "setPunchoutOptions:", v34);

    -[SFCardSection punchoutPickerTitle](v8, "punchoutPickerTitle");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerTitle:](v5, "setPunchoutPickerTitle:", v35);

    -[SFCardSection punchoutPickerDismissText](v8, "punchoutPickerDismissText");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerDismissText:](v5, "setPunchoutPickerDismissText:", v36);

    -[SFCardSection setCanBeHidden:](v5, "setCanBeHidden:", -[SFCardSection canBeHidden](v8, "canBeHidden"));
    -[SFCardSection setHasTopPadding:](v5, "setHasTopPadding:", -[SFCardSection hasTopPadding](v8, "hasTopPadding"));
    -[SFCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", -[SFCardSection hasBottomPadding](v8, "hasBottomPadding"));
    -[SFCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", -[SFCardSection separatorStyle](v8, "separatorStyle"));
    -[SFCardSection referencedCommands](v8, "referencedCommands");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setReferencedCommands:](v5, "setReferencedCommands:", v37);

    -[SFCardSection setForceEnable3DTouch:](v5, "setForceEnable3DTouch:", -[SFCardSection forceEnable3DTouch](v8, "forceEnable3DTouch"));
    -[SFCardSection setShouldShowInSmartDialog:](v5, "setShouldShowInSmartDialog:", -[SFCardSection shouldShowInSmartDialog](v8, "shouldShowInSmartDialog"));
    -[SFCardSection appEntityAnnotation](v8, "appEntityAnnotation");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setAppEntityAnnotation:](v5, "setAppEntityAnnotation:", v38);

    -[SFCardSection emphasisSubjectId](v8, "emphasisSubjectId");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setEmphasisSubjectId:](v5, "setEmphasisSubjectId:", v39);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFMapCardSection;
  -[SFCardSection encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBMapCardSection *v2;
  void *v3;

  v2 = -[_SFPBMapCardSection initWithFacade:]([_SFPBMapCardSection alloc], "initWithFacade:", self);
  -[_SFPBMapCardSection dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBMapCardSection *v2;
  void *v3;

  v2 = -[_SFPBMapCardSection initWithFacade:]([_SFPBMapCardSection alloc], "initWithFacade:", self);
  -[_SFPBMapCardSection jsonData](v2, "jsonData");
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
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)SFMapCardSection;
  v4 = -[SFCardSection copyWithZone:](&v28, sel_copyWithZone_, a3);
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
  -[SFMapCardSection type](self, "type");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setType:", v12);

  objc_msgSend(v4, "setSeparatorStyle:", -[SFCardSection separatorStyle](self, "separatorStyle"));
  -[SFCardSection backgroundColor](self, "backgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setBackgroundColor:", v14);

  -[SFMapCardSection location](self, "location");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v4, "setLocation:", v16);

  -[SFMapCardSection pinColor](self, "pinColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");
  objc_msgSend(v4, "setPinColor:", v18);

  -[SFMapCardSection footnoteLabel](self, "footnoteLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");
  objc_msgSend(v4, "setFootnoteLabel:", v20);

  -[SFMapCardSection footnote](self, "footnote");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "copy");
  objc_msgSend(v4, "setFootnote:", v22);

  objc_msgSend(v4, "setInteractive:", -[SFMapCardSection interactive](self, "interactive"));
  objc_msgSend(v4, "setSizeFormat:", -[SFMapCardSection sizeFormat](self, "sizeFormat"));
  -[SFMapCardSection boundingMapRegion](self, "boundingMapRegion");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v23, "copy");
  objc_msgSend(v4, "setBoundingMapRegion:", v24);

  objc_msgSend(v4, "setPinBehavior:", -[SFMapCardSection pinBehavior](self, "pinBehavior"));
  -[SFMapCardSection pins](self, "pins");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v25, "copy");
  objc_msgSend(v4, "setPins:", v26);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  SFMapCardSection *v5;
  SFMapCardSection *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  char v16;
  uint64_t v17;
  void *v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  uint64_t v25;
  _BOOL4 v26;
  uint64_t v27;
  SFMapCardSection *v28;
  void *v29;
  void *v30;
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
  uint64_t v41;
  void *v42;
  SFMapCardSection *v43;
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
  uint64_t v95;
  int v96;
  _BYTE v97[12];
  uint64_t v98;
  _BYTE v99[36];
  int v100;
  int v101;
  id v102;
  id v103;
  _QWORD v104[4];
  objc_super v105;

  v5 = (SFMapCardSection *)a3;
  if (self == v5)
  {
    v16 = 1;
    goto LABEL_79;
  }
  if (!-[SFMapCardSection isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class())
    || (v105.receiver = self,
        v105.super_class = (Class)SFMapCardSection,
        !-[SFCardSection isEqual:](&v105, sel_isEqual_, v5)))
  {
    v16 = 0;
    goto LABEL_79;
  }
  v6 = v5;
  -[SFCardSection punchoutOptions](self, "punchoutOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;
  -[SFCardSection punchoutOptions](v6, "punchoutOptions");
  v102 = (id)objc_claimAutoreleasedReturnValue();
  v103 = v7;
  v100 = v102 != 0;
  v101 = v8;
  if ((_DWORD)v8 == v100)
  {
    memset(v99, 0, sizeof(v99));
    v10 = 0;
    v98 = 0;
    memset(v97, 0, sizeof(v97));
    memset(v104, 0, sizeof(v104));
    v95 = 0;
    v96 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    goto LABEL_16;
  }
  -[SFCardSection punchoutOptions](self, "punchoutOptions");
  v3 = objc_claimAutoreleasedReturnValue();
  v94 = (void *)v3;
  if (v3)
  {
    -[SFCardSection punchoutOptions](self, "punchoutOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection punchoutOptions](v6, "punchoutOptions");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = v9;
    if (!objc_msgSend(v9, "isEqual:"))
    {
      memset(v99, 0, 32);
      v10 = 0;
      v98 = 0;
      memset(v97, 0, sizeof(v97));
      memset(v104, 0, sizeof(v104));
      v95 = 0;
      v96 = 0;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      *(_DWORD *)&v99[32] = 1;
      goto LABEL_16;
    }
  }
  -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCardSection punchoutPickerTitle](v6, "punchoutPickerTitle");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)&v99[32] = v3 != 0;
  if ((v93 == 0) == (v92 != 0))
  {
    memset(v99, 0, 24);
    v10 = 0;
    v98 = 0;
    memset(v97, 0, sizeof(v97));
    memset(v104, 0, sizeof(v104));
    v95 = 0;
    v96 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    *(_QWORD *)&v99[24] = 1;
    goto LABEL_16;
  }
  -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v17 = objc_claimAutoreleasedReturnValue();
  HIDWORD(v104[3]) = v17 != 0;
  v89 = (void *)v17;
  if (v17)
  {
    -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection punchoutPickerTitle](v6, "punchoutPickerTitle");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = v18;
    if (!objc_msgSend(v18, "isEqual:"))
    {
      memset(v99, 0, 20);
      v10 = 0;
      v98 = 0;
      memset(v97, 0, sizeof(v97));
      v95 = 0;
      v96 = 0;
      v11 = 0;
      v12 = 0;
      memset(v104, 0, 28);
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      *(_DWORD *)&v99[28] = 0;
      *(_QWORD *)&v99[20] = 0x100000001;
      HIDWORD(v104[3]) = 1;
      goto LABEL_16;
    }
  }
  -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCardSection punchoutPickerDismissText](v6, "punchoutPickerDismissText");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v88 == 0) == (v87 != 0))
  {
    *(_QWORD *)v99 = 0;
    *(_QWORD *)&v99[8] = 0;
    v10 = 0;
    v98 = 0;
    memset(v97, 0, sizeof(v97));
    v95 = 0;
    v96 = 0;
    v11 = 0;
    v12 = 0;
    memset(v104, 0, 28);
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    *(_QWORD *)&v99[24] = 1;
    *(_DWORD *)&v99[16] = 1;
    *(_DWORD *)&v99[20] = 1;
    goto LABEL_16;
  }
  -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = v25 != 0;
  v84 = (void *)v25;
  if (v25)
  {
    -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = v6;
    v29 = (void *)v27;
    v43 = v28;
    -[SFCardSection punchoutPickerDismissText](v28, "punchoutPickerDismissText");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = v29;
    if (!objc_msgSend(v29, "isEqual:"))
    {
      *(_QWORD *)&v99[8] = 0;
      v10 = 0;
      v98 = 0;
      memset(v97, 0, sizeof(v97));
      v95 = 0;
      v96 = 0;
      v11 = 0;
      v12 = 0;
      memset(v104, 0, 28);
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      *(_QWORD *)&v99[20] = 0x100000001;
      *(_DWORD *)&v99[16] = 1;
      *(_QWORD *)v99 = 1;
      *(_DWORD *)&v99[28] = 1;
      v6 = v43;
      goto LABEL_16;
    }
    v6 = v43;
  }
  v3 = -[SFCardSection canBeHidden](self, "canBeHidden");
  *(_DWORD *)&v99[28] = v26;
  if ((_DWORD)v3 == -[SFCardSection canBeHidden](v6, "canBeHidden")
    && (v3 = -[SFCardSection hasTopPadding](self, "hasTopPadding"),
        (_DWORD)v3 == -[SFCardSection hasTopPadding](v6, "hasTopPadding"))
    && (v3 = -[SFCardSection hasBottomPadding](self, "hasBottomPadding"),
        (_DWORD)v3 == -[SFCardSection hasBottomPadding](v6, "hasBottomPadding")))
  {
    -[SFMapCardSection type](self, "type");
    v3 = objc_claimAutoreleasedReturnValue();
    -[SFMapCardSection type](v6, "type");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = (void *)v3;
    if ((v3 == 0) == (v80 != 0))
    {
      *(_QWORD *)&v99[4] = 0;
      v10 = 0;
      v98 = 0;
      memset(v97, 0, sizeof(v97));
      v95 = 0;
      v96 = 0;
      v11 = 0;
      v12 = 0;
      memset(v104, 0, 28);
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      *(_QWORD *)&v99[20] = 0x100000001;
      *(_DWORD *)&v99[16] = 1;
      *(_DWORD *)v99 = 1;
      *(_DWORD *)&v99[12] = 1;
    }
    else
    {
      -[SFMapCardSection type](self, "type");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v104[3]) = v79 != 0;
      if (!v79
        || (-[SFMapCardSection type](self, "type"),
            v30 = (void *)objc_claimAutoreleasedReturnValue(),
            -[SFMapCardSection type](v6, "type"),
            v77 = (void *)objc_claimAutoreleasedReturnValue(),
            v78 = v30,
            objc_msgSend(v30, "isEqual:")))
      {
        v3 = -[SFCardSection separatorStyle](self, "separatorStyle");
        if ((_DWORD)v3 == -[SFCardSection separatorStyle](v6, "separatorStyle"))
        {
          -[SFCardSection backgroundColor](self, "backgroundColor");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFCardSection backgroundColor](v6, "backgroundColor");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          if ((v76 == 0) == (v75 != 0))
          {
            v98 = 0;
            memset(v97, 0, sizeof(v97));
            v95 = 0;
            v96 = 0;
            memset(v104, 0, 24);
            v11 = 0;
            v12 = 0;
            v13 = 0;
            v14 = 0;
            v15 = 0;
            v16 = 0;
            *(_QWORD *)&v99[20] = 0x100000001;
            *(_DWORD *)&v99[16] = 1;
            *(_QWORD *)v99 = 1;
            *(_QWORD *)&v99[8] = 0x100000001;
            v10 = 1;
          }
          else
          {
            -[SFCardSection backgroundColor](self, "backgroundColor");
            v31 = objc_claimAutoreleasedReturnValue();
            HIDWORD(v104[2]) = v31 != 0;
            v74 = (void *)v31;
            if (!v31
              || (-[SFCardSection backgroundColor](self, "backgroundColor"),
                  v32 = (void *)objc_claimAutoreleasedReturnValue(),
                  -[SFCardSection backgroundColor](v6, "backgroundColor"),
                  v70 = (void *)objc_claimAutoreleasedReturnValue(),
                  v71 = v32,
                  objc_msgSend(v32, "isEqual:")))
            {
              -[SFMapCardSection location](self, "location");
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              -[SFMapCardSection location](v6, "location");
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              if ((v73 == 0) == (v72 != 0))
              {
                memset(v97, 0, sizeof(v97));
                v95 = 0;
                v96 = 0;
                v11 = 0;
                v12 = 0;
                memset(v104, 0, 20);
                v13 = 0;
                v14 = 0;
                v15 = 0;
                v16 = 0;
                *(_QWORD *)&v99[20] = 0x100000001;
                *(_DWORD *)&v99[16] = 1;
                *(_QWORD *)v99 = 0x100000001;
                *(_QWORD *)&v99[8] = 0x100000001;
                v10 = 1;
                v98 = 1;
              }
              else
              {
                -[SFMapCardSection location](self, "location");
                v33 = objc_claimAutoreleasedReturnValue();
                LODWORD(v104[2]) = v33 != 0;
                v69 = (void *)v33;
                if (!v33
                  || (-[SFMapCardSection location](self, "location"),
                      v34 = (void *)objc_claimAutoreleasedReturnValue(),
                      -[SFMapCardSection location](v6, "location"),
                      v65 = (void *)objc_claimAutoreleasedReturnValue(),
                      v66 = v34,
                      objc_msgSend(v34, "isEqual:")))
                {
                  -[SFMapCardSection pinColor](self, "pinColor");
                  v68 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SFMapCardSection pinColor](v6, "pinColor");
                  v67 = (void *)objc_claimAutoreleasedReturnValue();
                  if ((v68 == 0) == (v67 != 0))
                  {
                    *(_QWORD *)&v97[4] = 0;
                    v104[0] = 0;
                    v104[1] = 0;
                    v95 = 0;
                    v11 = 0;
                    v12 = 0;
                    v13 = 0;
                    v14 = 0;
                    v15 = 0;
                    v16 = 0;
                    *(_QWORD *)&v99[20] = 0x100000001;
                    *(_DWORD *)&v99[16] = 1;
                    *(_QWORD *)v99 = 0x100000001;
                    *(_QWORD *)&v99[8] = 0x100000001;
                    v10 = 1;
                    v98 = 0x100000001;
                    v96 = 0;
                    *(_DWORD *)v97 = 1;
                  }
                  else
                  {
                    -[SFMapCardSection pinColor](self, "pinColor");
                    v35 = objc_claimAutoreleasedReturnValue();
                    HIDWORD(v104[1]) = v35 != 0;
                    v64 = (void *)v35;
                    if (!v35
                      || (-[SFMapCardSection pinColor](self, "pinColor"),
                          v36 = (void *)objc_claimAutoreleasedReturnValue(),
                          -[SFMapCardSection pinColor](v6, "pinColor"),
                          v60 = (void *)objc_claimAutoreleasedReturnValue(),
                          v61 = v36,
                          objc_msgSend(v36, "isEqual:")))
                    {
                      -[SFMapCardSection footnoteLabel](self, "footnoteLabel");
                      v63 = (void *)objc_claimAutoreleasedReturnValue();
                      -[SFMapCardSection footnoteLabel](v6, "footnoteLabel");
                      v62 = (void *)objc_claimAutoreleasedReturnValue();
                      if ((v63 == 0) == (v62 != 0))
                      {
                        *(_QWORD *)((char *)v104 + 4) = 0;
                        v95 = 0x100000000;
                        v11 = 0;
                        v12 = 0;
                        LODWORD(v104[0]) = 0;
                        v13 = 0;
                        v14 = 0;
                        v15 = 0;
                        v16 = 0;
                        *(_QWORD *)&v99[20] = 0x100000001;
                        *(_DWORD *)&v99[16] = 1;
                        *(_QWORD *)v99 = 0x100000001;
                        *(_QWORD *)&v99[8] = 0x100000001;
                        v10 = 1;
                        v98 = 0x100000001;
                        v96 = 0;
                        *(_QWORD *)v97 = 1;
                        *(_DWORD *)&v97[8] = 1;
                      }
                      else
                      {
                        -[SFMapCardSection footnoteLabel](self, "footnoteLabel");
                        v37 = objc_claimAutoreleasedReturnValue();
                        LODWORD(v104[1]) = v37 != 0;
                        v59 = (void *)v37;
                        if (!v37
                          || (-[SFMapCardSection footnoteLabel](self, "footnoteLabel"),
                              v38 = (void *)objc_claimAutoreleasedReturnValue(),
                              -[SFMapCardSection footnoteLabel](v6, "footnoteLabel"),
                              v55 = (void *)objc_claimAutoreleasedReturnValue(),
                              v56 = v38,
                              objc_msgSend(v38, "isEqual:")))
                        {
                          -[SFMapCardSection footnote](self, "footnote");
                          v58 = (void *)objc_claimAutoreleasedReturnValue();
                          -[SFMapCardSection footnote](v6, "footnote");
                          v57 = (void *)objc_claimAutoreleasedReturnValue();
                          if ((v58 == 0) == (v57 != 0))
                          {
                            v104[0] = 0;
                            v11 = 0;
                            v12 = 0;
                            v13 = 0;
                            v14 = 0;
                            v15 = 0;
                            v16 = 0;
                            *(_QWORD *)&v99[20] = 0x100000001;
                            *(_DWORD *)&v99[16] = 1;
                            *(_QWORD *)v99 = 0x100000001;
                            *(_QWORD *)&v99[8] = 0x100000001;
                            v10 = 1;
                            v98 = 0x100000001;
                            v96 = 0;
                            *(_QWORD *)v97 = 0x100000001;
                            *(_DWORD *)&v97[8] = 1;
                            v95 = 0x100000001;
                          }
                          else
                          {
                            -[SFMapCardSection footnote](self, "footnote");
                            v39 = objc_claimAutoreleasedReturnValue();
                            HIDWORD(v104[0]) = v39 != 0;
                            v54 = (void *)v39;
                            if (!v39
                              || (-[SFMapCardSection footnote](self, "footnote"),
                                  v40 = (void *)objc_claimAutoreleasedReturnValue(),
                                  -[SFMapCardSection footnote](v6, "footnote"),
                                  v52 = (void *)objc_claimAutoreleasedReturnValue(),
                                  v53 = v40,
                                  objc_msgSend(v40, "isEqual:")))
                            {
                              v3 = -[SFMapCardSection interactive](self, "interactive");
                              if ((_DWORD)v3 == -[SFMapCardSection interactive](v6, "interactive")
                                && (v3 = -[SFMapCardSection sizeFormat](self, "sizeFormat"),
                                    (_DWORD)v3 == -[SFMapCardSection sizeFormat](v6, "sizeFormat")))
                              {
                                -[SFMapCardSection boundingMapRegion](self, "boundingMapRegion");
                                v51 = (void *)objc_claimAutoreleasedReturnValue();
                                -[SFMapCardSection boundingMapRegion](v6, "boundingMapRegion");
                                v50 = (void *)objc_claimAutoreleasedReturnValue();
                                if ((v51 == 0) == (v50 != 0))
                                {
                                  v12 = 0;
                                  LODWORD(v104[0]) = 0;
                                  v13 = 0;
                                  v14 = 0;
                                  v15 = 0;
                                  v16 = 0;
                                  *(_QWORD *)&v99[20] = 0x100000001;
                                  *(_DWORD *)&v99[16] = 1;
                                  *(_QWORD *)v99 = 0x100000001;
                                  *(_QWORD *)&v99[8] = 0x100000001;
                                  v10 = 1;
                                  v98 = 0x100000001;
                                  *(_QWORD *)v97 = 0x100000001;
                                  *(_DWORD *)&v97[8] = 1;
                                  v95 = 0x100000001;
                                  v96 = 1;
                                  v11 = 1;
                                }
                                else
                                {
                                  -[SFMapCardSection boundingMapRegion](self, "boundingMapRegion");
                                  v41 = objc_claimAutoreleasedReturnValue();
                                  LODWORD(v104[0]) = v41 != 0;
                                  v49 = (void *)v41;
                                  if (!v41
                                    || (-[SFMapCardSection boundingMapRegion](self, "boundingMapRegion"),
                                        v42 = (void *)objc_claimAutoreleasedReturnValue(),
                                        -[SFMapCardSection boundingMapRegion](v6, "boundingMapRegion"),
                                        v47 = (void *)objc_claimAutoreleasedReturnValue(),
                                        v48 = v42,
                                        objc_msgSend(v42, "isEqual:")))
                                  {
                                    v3 = -[SFMapCardSection pinBehavior](self, "pinBehavior");
                                    if ((_DWORD)v3 == -[SFMapCardSection pinBehavior](v6, "pinBehavior"))
                                    {
                                      -[SFMapCardSection pins](self, "pins");
                                      v46 = (void *)objc_claimAutoreleasedReturnValue();
                                      -[SFMapCardSection pins](v6, "pins");
                                      v45 = (void *)objc_claimAutoreleasedReturnValue();
                                      if ((v46 == 0) == (v45 != 0))
                                      {
                                        v14 = 0;
                                        v15 = 0;
                                        v16 = 0;
                                        *(_QWORD *)&v99[20] = 0x100000001;
                                        *(_DWORD *)&v99[16] = 1;
                                        *(_QWORD *)v99 = 0x100000001;
                                        *(_QWORD *)&v99[8] = 0x100000001;
                                        v10 = 1;
                                        v98 = 0x100000001;
                                        *(_QWORD *)v97 = 0x100000001;
                                        *(_DWORD *)&v97[8] = 1;
                                        v95 = 0x100000001;
                                        v96 = 1;
                                        v11 = 1;
                                        v12 = 1;
                                        v13 = 1;
                                      }
                                      else
                                      {
                                        -[SFMapCardSection pins](self, "pins");
                                        v44 = (void *)objc_claimAutoreleasedReturnValue();
                                        if (v44)
                                        {
                                          -[SFMapCardSection pins](self, "pins");
                                          v8 = objc_claimAutoreleasedReturnValue();
                                          -[SFMapCardSection pins](v6, "pins");
                                          v3 = objc_claimAutoreleasedReturnValue();
                                          v16 = objc_msgSend((id)v8, "isEqual:", v3);
                                          v15 = 1;
                                          *(_QWORD *)&v99[20] = 0x100000001;
                                          *(_DWORD *)&v99[16] = 1;
                                          *(_QWORD *)v99 = 0x100000001;
                                          *(_QWORD *)&v99[8] = 0x100000001;
                                          v10 = 1;
                                          v98 = 0x100000001;
                                          *(_QWORD *)v97 = 0x100000001;
                                          *(_DWORD *)&v97[8] = 1;
                                          v95 = 0x100000001;
                                          v96 = 1;
                                          v11 = 1;
                                          v12 = 1;
                                          v13 = 1;
                                          v14 = 1;
                                        }
                                        else
                                        {
                                          v44 = 0;
                                          v15 = 0;
                                          *(_QWORD *)&v99[20] = 0x100000001;
                                          *(_DWORD *)&v99[16] = 1;
                                          *(_QWORD *)v99 = 0x100000001;
                                          *(_QWORD *)&v99[8] = 0x100000001;
                                          v10 = 1;
                                          v98 = 0x100000001;
                                          *(_QWORD *)v97 = 0x100000001;
                                          *(_DWORD *)&v97[8] = 1;
                                          v95 = 0x100000001;
                                          v96 = 1;
                                          v11 = 1;
                                          v12 = 1;
                                          v13 = 1;
                                          v14 = 1;
                                          v16 = 1;
                                        }
                                      }
                                    }
                                    else
                                    {
                                      v13 = 0;
                                      v14 = 0;
                                      v15 = 0;
                                      v16 = 0;
                                      *(_QWORD *)&v99[20] = 0x100000001;
                                      *(_DWORD *)&v99[16] = 1;
                                      *(_QWORD *)v99 = 0x100000001;
                                      *(_QWORD *)&v99[8] = 0x100000001;
                                      v10 = 1;
                                      v98 = 0x100000001;
                                      *(_QWORD *)v97 = 0x100000001;
                                      *(_DWORD *)&v97[8] = 1;
                                      v95 = 0x100000001;
                                      v96 = 1;
                                      v11 = 1;
                                      v12 = 1;
                                    }
                                  }
                                  else
                                  {
                                    v13 = 0;
                                    v14 = 0;
                                    v15 = 0;
                                    v16 = 0;
                                    *(_QWORD *)&v99[20] = 0x100000001;
                                    *(_DWORD *)&v99[16] = 1;
                                    *(_QWORD *)v99 = 0x100000001;
                                    *(_QWORD *)&v99[8] = 0x100000001;
                                    v10 = 1;
                                    v98 = 0x100000001;
                                    *(_QWORD *)v97 = 0x100000001;
                                    *(_DWORD *)&v97[8] = 1;
                                    v95 = 0x100000001;
                                    v96 = 1;
                                    v11 = 1;
                                    v12 = 1;
                                    LODWORD(v104[0]) = 1;
                                  }
                                }
                              }
                              else
                              {
                                v11 = 0;
                                v12 = 0;
                                LODWORD(v104[0]) = 0;
                                v13 = 0;
                                v14 = 0;
                                v15 = 0;
                                v16 = 0;
                                *(_QWORD *)&v99[20] = 0x100000001;
                                *(_DWORD *)&v99[16] = 1;
                                *(_QWORD *)v99 = 0x100000001;
                                *(_QWORD *)&v99[8] = 0x100000001;
                                v10 = 1;
                                v98 = 0x100000001;
                                *(_QWORD *)v97 = 0x100000001;
                                *(_DWORD *)&v97[8] = 1;
                                v95 = 0x100000001;
                                v96 = 1;
                              }
                            }
                            else
                            {
                              v11 = 0;
                              v12 = 0;
                              v104[0] = 0x100000000;
                              v13 = 0;
                              v14 = 0;
                              v15 = 0;
                              v16 = 0;
                              *(_QWORD *)&v99[20] = 0x100000001;
                              *(_DWORD *)&v99[16] = 1;
                              *(_QWORD *)v99 = 0x100000001;
                              *(_QWORD *)&v99[8] = 0x100000001;
                              v10 = 1;
                              v98 = 0x100000001;
                              *(_QWORD *)v97 = 0x100000001;
                              *(_DWORD *)&v97[8] = 1;
                              v95 = 0x100000001;
                              v96 = 1;
                            }
                          }
                        }
                        else
                        {
                          v95 = 0x100000000;
                          v104[0] = 0;
                          v11 = 0;
                          v12 = 0;
                          v13 = 0;
                          v14 = 0;
                          v15 = 0;
                          v16 = 0;
                          *(_QWORD *)&v99[20] = 0x100000001;
                          *(_DWORD *)&v99[16] = 1;
                          *(_QWORD *)v99 = 0x100000001;
                          *(_QWORD *)&v99[8] = 0x100000001;
                          v10 = 1;
                          v98 = 0x100000001;
                          v96 = 0;
                          *(_QWORD *)v97 = 0x100000001;
                          *(_DWORD *)&v97[8] = 1;
                          LODWORD(v104[1]) = 1;
                        }
                      }
                    }
                    else
                    {
                      v95 = 0;
                      *(_QWORD *)((char *)v104 + 4) = 0;
                      v11 = 0;
                      v12 = 0;
                      LODWORD(v104[0]) = 0;
                      v13 = 0;
                      v14 = 0;
                      v15 = 0;
                      v16 = 0;
                      *(_QWORD *)&v99[20] = 0x100000001;
                      *(_DWORD *)&v99[16] = 1;
                      *(_QWORD *)v99 = 0x100000001;
                      *(_QWORD *)&v99[8] = 0x100000001;
                      v10 = 1;
                      v98 = 0x100000001;
                      v96 = 0;
                      *(_QWORD *)v97 = 1;
                      *(_DWORD *)&v97[8] = 1;
                      HIDWORD(v104[1]) = 1;
                    }
                  }
                }
                else
                {
                  memset(v97, 0, sizeof(v97));
                  v104[0] = 0;
                  v104[1] = 0;
                  v95 = 0;
                  v96 = 0;
                  v11 = 0;
                  v12 = 0;
                  v13 = 0;
                  v14 = 0;
                  v15 = 0;
                  v16 = 0;
                  *(_QWORD *)&v99[20] = 0x100000001;
                  *(_DWORD *)&v99[16] = 1;
                  *(_QWORD *)v99 = 0x100000001;
                  *(_QWORD *)&v99[8] = 0x100000001;
                  v10 = 1;
                  v98 = 0x100000001;
                  LODWORD(v104[2]) = 1;
                }
              }
            }
            else
            {
              v98 = 0;
              memset(v97, 0, sizeof(v97));
              v95 = 0;
              v96 = 0;
              v11 = 0;
              v12 = 0;
              memset(v104, 0, 20);
              v13 = 0;
              v14 = 0;
              v15 = 0;
              v16 = 0;
              *(_QWORD *)&v99[20] = 0x100000001;
              *(_DWORD *)&v99[16] = 1;
              *(_QWORD *)v99 = 0x100000001;
              *(_QWORD *)&v99[8] = 0x100000001;
              v10 = 1;
              HIDWORD(v104[2]) = 1;
            }
          }
        }
        else
        {
          v10 = 0;
          v98 = 0;
          memset(v97, 0, sizeof(v97));
          v95 = 0;
          v96 = 0;
          memset(v104, 0, 24);
          v11 = 0;
          v12 = 0;
          v13 = 0;
          v14 = 0;
          v15 = 0;
          v16 = 0;
          *(_QWORD *)&v99[20] = 0x100000001;
          *(_DWORD *)&v99[16] = 1;
          *(_QWORD *)v99 = 1;
          *(_QWORD *)&v99[8] = 0x100000001;
        }
      }
      else
      {
        v10 = 0;
        v98 = 0;
        memset(v97, 0, sizeof(v97));
        v95 = 0;
        v96 = 0;
        memset(v104, 0, 24);
        v11 = 0;
        v12 = 0;
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        *(_QWORD *)&v99[20] = 0x100000001;
        *(_DWORD *)&v99[16] = 1;
        *(_QWORD *)v99 = 1;
        *(_QWORD *)&v99[8] = 0x100000001;
        LODWORD(v104[3]) = 1;
      }
    }
  }
  else
  {
    *(_QWORD *)&v99[8] = 0;
    v10 = 0;
    v98 = 0;
    memset(v97, 0, sizeof(v97));
    v95 = 0;
    v96 = 0;
    v11 = 0;
    v12 = 0;
    memset(v104, 0, 28);
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    *(_QWORD *)&v99[20] = 0x100000001;
    *(_DWORD *)&v99[16] = 1;
    *(_QWORD *)v99 = 1;
  }
LABEL_16:
  if (v15)
  {
    v19 = v11;
    v20 = v10;
    v21 = v12;
    v22 = v13;
    v23 = v14;

    v14 = v23;
    v13 = v22;
    v12 = v21;
    v10 = v20;
    v11 = v19;
  }
  if (v14)

  if (v13)
  {

  }
  if (LODWORD(v104[0]))
  {

    if (!v12)
      goto LABEL_24;
LABEL_81:

    if (!v11)
      goto LABEL_26;
    goto LABEL_25;
  }
  if (v12)
    goto LABEL_81;
LABEL_24:
  if (v11)
  {
LABEL_25:

  }
LABEL_26:
  if (HIDWORD(v104[0]))
  {

  }
  if (v96)

  if ((_DWORD)v95)
  {

  }
  if (LODWORD(v104[1]))
  {

  }
  if (*(_DWORD *)&v97[4])

  if (HIDWORD(v95))
  {

  }
  if (HIDWORD(v104[1]))
  {

  }
  if (*(_DWORD *)&v97[8])

  if (*(_DWORD *)v97)
  {

  }
  if (LODWORD(v104[2]))
  {

  }
  if (HIDWORD(v98))

  if ((_DWORD)v98)
  {

  }
  if (HIDWORD(v104[2]))
  {

  }
  if (*(_DWORD *)&v99[4])

  if (v10)
  {

  }
  if (LODWORD(v104[3]))
  {

  }
  if (*(_DWORD *)&v99[8])

  if (*(_DWORD *)&v99[12])
  {

  }
  if (*(_DWORD *)&v99[28])
  {

  }
  if (*(_DWORD *)v99)

  if (*(_DWORD *)&v99[16])
  {

  }
  if (HIDWORD(v104[3]))
  {

  }
  if (*(_DWORD *)&v99[20])

  if (*(_DWORD *)&v99[24])
  {

  }
  if (*(_DWORD *)&v99[32])
  {

  }
  if (v101 != v100)

LABEL_79:
  return v16;
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
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  unint64_t v29;
  void *v31;
  void *v32;
  void *v33;
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)SFMapCardSection;
  v3 = -[SFCardSection hash](&v34, sel_hash);
  -[SFCardSection punchoutOptions](self, "punchoutOptions");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v33, "hash");
  -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 ^ objc_msgSend(v32, "hash");
  -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 ^ objc_msgSend(v31, "hash");
  v7 = v6 ^ -[SFCardSection canBeHidden](self, "canBeHidden");
  v8 = v7 ^ -[SFCardSection hasTopPadding](self, "hasTopPadding") ^ v3;
  v9 = -[SFCardSection hasBottomPadding](self, "hasBottomPadding");
  -[SFMapCardSection type](self, "type");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9 ^ objc_msgSend(v10, "hash");
  v12 = v11 ^ -[SFCardSection separatorStyle](self, "separatorStyle");
  -[SFCardSection backgroundColor](self, "backgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 ^ objc_msgSend(v13, "hash");
  -[SFMapCardSection location](self, "location");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v8 ^ v14 ^ objc_msgSend(v15, "hash");
  -[SFMapCardSection pinColor](self, "pinColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "hash");
  -[SFMapCardSection footnoteLabel](self, "footnoteLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v18 ^ objc_msgSend(v19, "hash");
  -[SFMapCardSection footnote](self, "footnote");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v20 ^ objc_msgSend(v21, "hash");
  v23 = v22 ^ -[SFMapCardSection interactive](self, "interactive");
  v24 = v23 ^ -[SFMapCardSection sizeFormat](self, "sizeFormat");
  -[SFMapCardSection boundingMapRegion](self, "boundingMapRegion");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v24 ^ objc_msgSend(v25, "hash");
  v27 = v16 ^ v26 ^ -[SFMapCardSection pinBehavior](self, "pinBehavior");
  -[SFMapCardSection pins](self, "pins");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v27 ^ objc_msgSend(v28, "hash");

  return v29;
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (SFLatLng)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (SFColor)pinColor
{
  return self->_pinColor;
}

- (void)setPinColor:(id)a3
{
  objc_storeStrong((id *)&self->_pinColor, a3);
}

- (NSString)footnoteLabel
{
  return self->_footnoteLabel;
}

- (void)setFootnoteLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (NSString)footnote
{
  return self->_footnote;
}

- (void)setFootnote:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (BOOL)interactive
{
  return self->_interactive;
}

- (int)sizeFormat
{
  return self->_sizeFormat;
}

- (SFMapRegion)boundingMapRegion
{
  return self->_boundingMapRegion;
}

- (void)setBoundingMapRegion:(id)a3
{
  objc_storeStrong((id *)&self->_boundingMapRegion, a3);
}

- (int)pinBehavior
{
  return self->_pinBehavior;
}

- (NSArray)pins
{
  return self->_pins;
}

- (void)setPins:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pins, 0);
  objc_storeStrong((id *)&self->_boundingMapRegion, 0);
  objc_storeStrong((id *)&self->_footnote, 0);
  objc_storeStrong((id *)&self->_footnoteLabel, 0);
  objc_storeStrong((id *)&self->_pinColor, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFMapCardSection)initWithProtobuf:(id)a3
{
  id v4;
  SFMapCardSection *v5;
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
  SFLatLng *v25;
  void *v26;
  SFLatLng *v27;
  void *v28;
  SFColor *v29;
  void *v30;
  SFColor *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  SFMapRegion *v37;
  void *v38;
  SFMapRegion *v39;
  void *v40;
  id v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t j;
  SFPin *v47;
  SFMapCardSection *v48;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  objc_super v58;
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v58.receiver = self;
  v58.super_class = (Class)SFMapCardSection;
  v5 = -[SFCardSection init](&v58, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "punchoutOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v7 = 0;

    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    objc_msgSend(v4, "punchoutOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v55;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v55 != v11)
            objc_enumerationMutation(v8);
          v13 = -[SFPunchout initWithProtobuf:]([SFPunchout alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * i));
          if (v13)
            objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
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
      -[SFMapCardSection setType:](v5, "setType:", v19);

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
    objc_msgSend(v4, "location");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      v25 = [SFLatLng alloc];
      objc_msgSend(v4, "location");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[SFLatLng initWithProtobuf:](v25, "initWithProtobuf:", v26);
      -[SFMapCardSection setLocation:](v5, "setLocation:", v27);

    }
    objc_msgSend(v4, "pinColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      v29 = [SFColor alloc];
      objc_msgSend(v4, "pinColor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = -[SFColor initWithProtobuf:](v29, "initWithProtobuf:", v30);
      -[SFMapCardSection setPinColor:](v5, "setPinColor:", v31);

    }
    objc_msgSend(v4, "footnoteLabel");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      objc_msgSend(v4, "footnoteLabel");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFMapCardSection setFootnoteLabel:](v5, "setFootnoteLabel:", v33);

    }
    objc_msgSend(v4, "footnote");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      objc_msgSend(v4, "footnote");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFMapCardSection setFootnote:](v5, "setFootnote:", v35);

    }
    if (objc_msgSend(v4, "interactive"))
      -[SFMapCardSection setInteractive:](v5, "setInteractive:", objc_msgSend(v4, "interactive"));
    if (objc_msgSend(v4, "sizeFormat"))
      -[SFMapCardSection setSizeFormat:](v5, "setSizeFormat:", objc_msgSend(v4, "sizeFormat"));
    objc_msgSend(v4, "boundingMapRegion");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      v37 = [SFMapRegion alloc];
      objc_msgSend(v4, "boundingMapRegion");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = -[SFMapRegion initWithProtobuf:](v37, "initWithProtobuf:", v38);
      -[SFMapCardSection setBoundingMapRegion:](v5, "setBoundingMapRegion:", v39);

    }
    if (objc_msgSend(v4, "pinBehavior"))
      -[SFMapCardSection setPinBehavior:](v5, "setPinBehavior:", objc_msgSend(v4, "pinBehavior"));
    objc_msgSend(v4, "pins");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (v40)
      v41 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v41 = 0;

    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    objc_msgSend(v4, "pins", 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
    if (v43)
    {
      v44 = v43;
      v45 = *(_QWORD *)v51;
      do
      {
        for (j = 0; j != v44; ++j)
        {
          if (*(_QWORD *)v51 != v45)
            objc_enumerationMutation(v42);
          v47 = -[SFPin initWithProtobuf:]([SFPin alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * j));
          if (v47)
            objc_msgSend(v41, "addObject:", v47);

        }
        v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
      }
      while (v44);
    }

    -[SFMapCardSection setPins:](v5, "setPins:", v41);
    v48 = v5;

  }
  return v5;
}

@end
