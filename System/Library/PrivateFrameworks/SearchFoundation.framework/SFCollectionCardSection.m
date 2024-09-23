@implementation SFCollectionCardSection

- (SFCollectionCardSection)initWithCoder:(id)a3
{
  id v4;
  SFCollectionCardSection *v5;
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
    -[SFCollectionCardSection setType:](v5, "setType:", v12);

    -[SFCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", -[SFCardSection separatorStyle](v8, "separatorStyle"));
    -[SFCardSection backgroundColor](v8, "backgroundColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setBackgroundColor:](v5, "setBackgroundColor:", v13);

    -[SFCardSection cardSections](v8, "cardSections");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCollectionCardSection setCardSections:](v5, "setCardSections:", v14);

    -[SFCardSection title](v8, "title");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCollectionCardSection setTitle:](v5, "setTitle:", v15);

    -[SFCardSection buttonItem](v8, "buttonItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCollectionCardSection setButtonItem:](v5, "setButtonItem:", v16);

    -[SFCardSection collectionStyle](v8, "collectionStyle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCollectionCardSection setCollectionStyle:](v5, "setCollectionStyle:", v17);

    -[SFCardSection titleButtonItem](v8, "titleButtonItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCollectionCardSection setTitleButtonItem:](v5, "setTitleButtonItem:", v18);

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
  v3.super_class = (Class)SFCollectionCardSection;
  -[SFCardSection encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBCollectionCardSection *v2;
  void *v3;

  v2 = -[_SFPBCollectionCardSection initWithFacade:]([_SFPBCollectionCardSection alloc], "initWithFacade:", self);
  -[_SFPBCollectionCardSection dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBCollectionCardSection *v2;
  void *v3;

  v2 = -[_SFPBCollectionCardSection initWithFacade:]([_SFPBCollectionCardSection alloc], "initWithFacade:", self);
  -[_SFPBCollectionCardSection jsonData](v2, "jsonData");
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
  v26.super_class = (Class)SFCollectionCardSection;
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
  -[SFCollectionCardSection type](self, "type");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setType:", v12);

  objc_msgSend(v4, "setSeparatorStyle:", -[SFCardSection separatorStyle](self, "separatorStyle"));
  -[SFCardSection backgroundColor](self, "backgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setBackgroundColor:", v14);

  -[SFCollectionCardSection cardSections](self, "cardSections");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v4, "setCardSections:", v16);

  -[SFCollectionCardSection title](self, "title");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");
  objc_msgSend(v4, "setTitle:", v18);

  -[SFCollectionCardSection buttonItem](self, "buttonItem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");
  objc_msgSend(v4, "setButtonItem:", v20);

  -[SFCollectionCardSection collectionStyle](self, "collectionStyle");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "copy");
  objc_msgSend(v4, "setCollectionStyle:", v22);

  -[SFCollectionCardSection titleButtonItem](self, "titleButtonItem");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v23, "copy");
  objc_msgSend(v4, "setTitleButtonItem:", v24);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  SFCollectionCardSection *v5;
  SFCollectionCardSection *v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  char v16;
  uint64_t v17;
  void *v18;
  void *v19;
  SFCollectionCardSection *v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
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
  uint64_t v87;
  _BYTE v88[12];
  _QWORD v89[4];
  int v90;
  int v91;
  id v92;
  id v93;
  _QWORD v94[4];
  objc_super v95;

  v5 = (SFCollectionCardSection *)a3;
  if (self == v5)
  {
    v16 = 1;
    goto LABEL_82;
  }
  if (!-[SFCollectionCardSection isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class())
    || (v95.receiver = self,
        v95.super_class = (Class)SFCollectionCardSection,
        !-[SFCardSection isEqual:](&v95, sel_isEqual_, v5)))
  {
    v16 = 0;
    goto LABEL_82;
  }
  v6 = v5;
  -[SFCardSection punchoutOptions](self, "punchoutOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCardSection punchoutOptions](v6, "punchoutOptions");
  v92 = (id)objc_claimAutoreleasedReturnValue();
  v93 = v7;
  v90 = v92 != 0;
  v91 = v7 == 0;
  if (v91 == v90)
  {
    memset(v89, 0, sizeof(v89));
    v9 = 0;
    memset(v94, 0, sizeof(v94));
    v87 = 0;
    v10 = 0;
    v11 = 0;
    memset(v88, 0, sizeof(v88));
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
  }
  else
  {
    -[SFCardSection punchoutOptions](self, "punchoutOptions");
    v3 = objc_claimAutoreleasedReturnValue();
    v86 = (void *)v3;
    if (!v3
      || (-[SFCardSection punchoutOptions](self, "punchoutOptions"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          -[SFCardSection punchoutOptions](v6, "punchoutOptions"),
          v82 = (void *)objc_claimAutoreleasedReturnValue(),
          v83 = v8,
          objc_msgSend(v8, "isEqual:")))
    {
      -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCardSection punchoutPickerTitle](v6, "punchoutPickerTitle");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      HIDWORD(v89[3]) = v3 != 0;
      if ((v85 == 0) == (v84 != 0))
      {
        memset(v89, 0, 24);
        v9 = 0;
        memset(v94, 0, sizeof(v94));
        v87 = 0;
        v10 = 0;
        v11 = 0;
        memset(v88, 0, sizeof(v88));
        v12 = 0;
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        LODWORD(v89[3]) = 1;
      }
      else
      {
        -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
        v17 = objc_claimAutoreleasedReturnValue();
        HIDWORD(v94[3]) = v17 != 0;
        v81 = (void *)v17;
        if (!v17
          || (-[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle"),
              v18 = (void *)objc_claimAutoreleasedReturnValue(),
              -[SFCardSection punchoutPickerTitle](v6, "punchoutPickerTitle"),
              v77 = (void *)objc_claimAutoreleasedReturnValue(),
              v78 = v18,
              objc_msgSend(v18, "isEqual:")))
        {
          -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFCardSection punchoutPickerDismissText](v6, "punchoutPickerDismissText");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          if ((v80 == 0) == (v79 != 0))
          {
            v89[0] = 0;
            v9 = 0;
            v89[1] = 0;
            v87 = 0;
            v10 = 0;
            v11 = 0;
            memset(v88, 0, sizeof(v88));
            v12 = 0;
            memset(v94, 0, 28);
            v13 = 0;
            v14 = 0;
            v15 = 0;
            v16 = 0;
            *(_QWORD *)((char *)&v89[2] + 4) = 0x100000001;
            LODWORD(v89[2]) = 1;
          }
          else
          {
            -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v94[3]) = v76 != 0;
            if (!v76
              || (-[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText"),
                  v19 = (void *)objc_claimAutoreleasedReturnValue(),
                  -[SFCardSection punchoutPickerDismissText](v6, "punchoutPickerDismissText"),
                  v74 = (void *)objc_claimAutoreleasedReturnValue(),
                  v75 = v19,
                  objc_msgSend(v19, "isEqual:")))
            {
              v3 = -[SFCardSection canBeHidden](self, "canBeHidden");
              if ((_DWORD)v3 == -[SFCardSection canBeHidden](v6, "canBeHidden")
                && (v3 = -[SFCardSection hasTopPadding](self, "hasTopPadding"),
                    (_DWORD)v3 == -[SFCardSection hasTopPadding](v6, "hasTopPadding"))
                && (v3 = -[SFCardSection hasBottomPadding](self, "hasBottomPadding"),
                    (_DWORD)v3 == -[SFCardSection hasBottomPadding](v6, "hasBottomPadding")))
              {
                -[SFCollectionCardSection type](self, "type");
                v3 = objc_claimAutoreleasedReturnValue();
                -[SFCollectionCardSection type](v6, "type");
                v72 = (void *)objc_claimAutoreleasedReturnValue();
                v73 = (void *)v3;
                if ((v3 == 0) == (v72 != 0))
                {
                  v89[0] = 0;
                  v89[1] = 0;
                  *(_QWORD *)v88 = 0;
                  v87 = 0;
                  v10 = 0;
                  v11 = 0;
                  memset(v94, 0, 24);
                  v12 = 0;
                  v13 = 0;
                  v14 = 0;
                  v15 = 0;
                  v16 = 0;
                  *(_QWORD *)((char *)&v89[2] + 4) = 0x100000001;
                  LODWORD(v89[2]) = 1;
                  *(_DWORD *)&v88[8] = 1;
                  v9 = 1;
                }
                else
                {
                  -[SFCollectionCardSection type](self, "type");
                  v71 = (void *)objc_claimAutoreleasedReturnValue();
                  HIDWORD(v94[2]) = v71 != 0;
                  if (!v71
                    || (-[SFCollectionCardSection type](self, "type"),
                        v28 = (void *)objc_claimAutoreleasedReturnValue(),
                        -[SFCollectionCardSection type](v6, "type"),
                        v69 = (void *)objc_claimAutoreleasedReturnValue(),
                        v70 = v28,
                        objc_msgSend(v28, "isEqual:")))
                  {
                    v3 = -[SFCardSection separatorStyle](self, "separatorStyle");
                    if ((_DWORD)v3 == -[SFCardSection separatorStyle](v6, "separatorStyle"))
                    {
                      -[SFCardSection backgroundColor](self, "backgroundColor");
                      v68 = (void *)objc_claimAutoreleasedReturnValue();
                      -[SFCardSection backgroundColor](v6, "backgroundColor");
                      v67 = (void *)objc_claimAutoreleasedReturnValue();
                      if ((v68 == 0) == (v67 != 0))
                      {
                        *(_QWORD *)v88 = 0;
                        v87 = 0;
                        v10 = 0;
                        v11 = 0;
                        v12 = 0;
                        memset(v94, 0, 20);
                        v13 = 0;
                        v14 = 0;
                        v15 = 0;
                        v16 = 0;
                        *(_QWORD *)((char *)&v89[2] + 4) = 0x100000001;
                        LODWORD(v89[2]) = 1;
                        *(_DWORD *)&v88[8] = 1;
                        v89[0] = 0x100000000;
                        v9 = 1;
                        v89[1] = 0x100000000;
                      }
                      else
                      {
                        -[SFCardSection backgroundColor](self, "backgroundColor");
                        v29 = objc_claimAutoreleasedReturnValue();
                        LODWORD(v94[2]) = v29 != 0;
                        v66 = (void *)v29;
                        if (!v29
                          || (-[SFCardSection backgroundColor](self, "backgroundColor"),
                              v30 = (void *)objc_claimAutoreleasedReturnValue(),
                              -[SFCardSection backgroundColor](v6, "backgroundColor"),
                              v62 = (void *)objc_claimAutoreleasedReturnValue(),
                              v63 = v30,
                              objc_msgSend(v30, "isEqual:")))
                        {
                          -[SFCollectionCardSection cardSections](self, "cardSections");
                          v65 = (void *)objc_claimAutoreleasedReturnValue();
                          -[SFCollectionCardSection cardSections](v6, "cardSections");
                          v64 = (void *)objc_claimAutoreleasedReturnValue();
                          if ((v65 == 0) == (v64 != 0))
                          {
                            v94[0] = 0;
                            v94[1] = 0;
                            v87 = 0;
                            v10 = 0;
                            v11 = 0;
                            v12 = 0;
                            v13 = 0;
                            v14 = 0;
                            v15 = 0;
                            v16 = 0;
                            LODWORD(v89[3]) = 1;
                            v89[2] = 0x100000001;
                            *(_DWORD *)&v88[8] = 1;
                            v89[0] = 0x100000000;
                            v9 = 1;
                            v89[1] = 0x100000001;
                            *(_QWORD *)v88 = 0x100000000;
                          }
                          else
                          {
                            -[SFCollectionCardSection cardSections](self, "cardSections");
                            v31 = objc_claimAutoreleasedReturnValue();
                            HIDWORD(v94[1]) = v31 != 0;
                            v61 = (void *)v31;
                            if (!v31
                              || (-[SFCollectionCardSection cardSections](self, "cardSections"),
                                  v32 = (void *)objc_claimAutoreleasedReturnValue(),
                                  -[SFCollectionCardSection cardSections](v6, "cardSections"),
                                  v57 = (void *)objc_claimAutoreleasedReturnValue(),
                                  v58 = v32,
                                  objc_msgSend(v32, "isEqual:")))
                            {
                              -[SFCollectionCardSection title](self, "title");
                              v60 = (void *)objc_claimAutoreleasedReturnValue();
                              -[SFCollectionCardSection title](v6, "title");
                              v59 = (void *)objc_claimAutoreleasedReturnValue();
                              if ((v60 == 0) == (v59 != 0))
                              {
                                v10 = 0;
                                *(_QWORD *)((char *)v94 + 4) = 0;
                                v87 = 0x100000000;
                                v11 = 0;
                                v12 = 0;
                                LODWORD(v94[0]) = 0;
                                v13 = 0;
                                v14 = 0;
                                v15 = 0;
                                v16 = 0;
                                *(_QWORD *)((char *)&v89[2] + 4) = 0x100000001;
                                LODWORD(v89[2]) = 1;
                                *(_DWORD *)&v88[8] = 1;
                                v89[0] = 0x100000001;
                                v9 = 1;
                                v89[1] = 0x100000001;
                                *(_QWORD *)v88 = 0x100000000;
                              }
                              else
                              {
                                -[SFCollectionCardSection title](self, "title");
                                v33 = objc_claimAutoreleasedReturnValue();
                                LODWORD(v94[1]) = v33 != 0;
                                v56 = (void *)v33;
                                if (!v33
                                  || (-[SFCollectionCardSection title](self, "title"),
                                      v34 = (void *)objc_claimAutoreleasedReturnValue(),
                                      -[SFCollectionCardSection title](v6, "title"),
                                      v52 = (void *)objc_claimAutoreleasedReturnValue(),
                                      v53 = v34,
                                      objc_msgSend(v34, "isEqual:")))
                                {
                                  -[SFCollectionCardSection buttonItem](self, "buttonItem");
                                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                                  -[SFCollectionCardSection buttonItem](v6, "buttonItem");
                                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                                  if ((v55 == 0) == (v54 != 0))
                                  {
                                    v11 = 0;
                                    v94[0] = 0;
                                    v12 = 0;
                                    v13 = 0;
                                    v14 = 0;
                                    v15 = 0;
                                    v16 = 0;
                                    *(_QWORD *)((char *)&v89[2] + 4) = 0x100000001;
                                    LODWORD(v89[2]) = 1;
                                    *(_DWORD *)&v88[8] = 1;
                                    v89[0] = 0x100000001;
                                    v9 = 1;
                                    v89[1] = 0x100000001;
                                    *(_QWORD *)v88 = 0x100000000;
                                    v10 = 1;
                                    v87 = 0x100000001;
                                  }
                                  else
                                  {
                                    -[SFCollectionCardSection buttonItem](self, "buttonItem");
                                    v35 = objc_claimAutoreleasedReturnValue();
                                    HIDWORD(v94[0]) = v35 != 0;
                                    v51 = (void *)v35;
                                    if (!v35
                                      || (-[SFCollectionCardSection buttonItem](self, "buttonItem"),
                                          v36 = (void *)objc_claimAutoreleasedReturnValue(),
                                          -[SFCollectionCardSection buttonItem](v6, "buttonItem"),
                                          v47 = (void *)objc_claimAutoreleasedReturnValue(),
                                          v48 = v36,
                                          objc_msgSend(v36, "isEqual:")))
                                    {
                                      -[SFCollectionCardSection collectionStyle](self, "collectionStyle");
                                      v50 = (void *)objc_claimAutoreleasedReturnValue();
                                      -[SFCollectionCardSection collectionStyle](v6, "collectionStyle");
                                      v49 = (void *)objc_claimAutoreleasedReturnValue();
                                      if ((v50 == 0) == (v49 != 0))
                                      {
                                        v12 = 0;
                                        LODWORD(v94[0]) = 0;
                                        v13 = 0;
                                        v14 = 0;
                                        v15 = 0;
                                        v16 = 0;
                                        *(_QWORD *)((char *)&v89[2] + 4) = 0x100000001;
                                        LODWORD(v89[2]) = 1;
                                        *(_DWORD *)&v88[8] = 1;
                                        v9 = 1;
                                        v89[1] = 0x100000001;
                                        v89[0] = 0x100000001;
                                        v87 = 0x100000001;
                                        v10 = 1;
                                        v11 = 1;
                                        *(_QWORD *)v88 = 0x100000001;
                                      }
                                      else
                                      {
                                        -[SFCollectionCardSection collectionStyle](self, "collectionStyle");
                                        v37 = objc_claimAutoreleasedReturnValue();
                                        LODWORD(v94[0]) = v37 != 0;
                                        v46 = (void *)v37;
                                        if (!v37
                                          || (-[SFCollectionCardSection collectionStyle](self, "collectionStyle"),
                                              v38 = (void *)objc_claimAutoreleasedReturnValue(),
                                              -[SFCollectionCardSection collectionStyle](v6, "collectionStyle"),
                                              v42 = (void *)objc_claimAutoreleasedReturnValue(),
                                              v43 = v38,
                                              objc_msgSend(v38, "isEqual:")))
                                        {
                                          -[SFCollectionCardSection titleButtonItem](self, "titleButtonItem");
                                          v45 = (void *)objc_claimAutoreleasedReturnValue();
                                          -[SFCollectionCardSection titleButtonItem](v6, "titleButtonItem");
                                          v44 = (void *)objc_claimAutoreleasedReturnValue();
                                          if ((v45 == 0) == (v44 != 0))
                                          {
                                            v14 = 0;
                                            v15 = 0;
                                            v16 = 0;
                                            *(_QWORD *)((char *)&v89[2] + 4) = 0x100000001;
                                            LODWORD(v89[2]) = 1;
                                            *(_DWORD *)&v88[8] = 1;
                                            v9 = 1;
                                            v89[1] = 0x100000001;
                                            v89[0] = 0x100000001;
                                            v87 = 0x100000001;
                                            v10 = 1;
                                            v11 = 1;
                                            *(_QWORD *)v88 = 0x100000001;
                                            v12 = 1;
                                            v13 = 1;
                                          }
                                          else
                                          {
                                            -[SFCollectionCardSection titleButtonItem](self, "titleButtonItem");
                                            v41 = (void *)objc_claimAutoreleasedReturnValue();
                                            if (v41)
                                            {
                                              -[SFCollectionCardSection titleButtonItem](self, "titleButtonItem");
                                              v39 = (void *)objc_claimAutoreleasedReturnValue();
                                              -[SFCollectionCardSection titleButtonItem](v6, "titleButtonItem");
                                              v3 = objc_claimAutoreleasedReturnValue();
                                              v40 = v39;
                                              v16 = objc_msgSend(v39, "isEqual:", v3);
                                              v15 = 1;
                                              *(_QWORD *)((char *)&v89[2] + 4) = 0x100000001;
                                              LODWORD(v89[2]) = 1;
                                              *(_DWORD *)&v88[8] = 1;
                                              v9 = 1;
                                              v89[1] = 0x100000001;
                                              v89[0] = 0x100000001;
                                              v87 = 0x100000001;
                                              v10 = 1;
                                              v11 = 1;
                                              *(_QWORD *)v88 = 0x100000001;
                                              v12 = 1;
                                              v13 = 1;
                                              v14 = 1;
                                            }
                                            else
                                            {
                                              v41 = 0;
                                              v15 = 0;
                                              *(_QWORD *)((char *)&v89[2] + 4) = 0x100000001;
                                              LODWORD(v89[2]) = 1;
                                              *(_DWORD *)&v88[8] = 1;
                                              v9 = 1;
                                              v89[1] = 0x100000001;
                                              v89[0] = 0x100000001;
                                              v87 = 0x100000001;
                                              v10 = 1;
                                              v11 = 1;
                                              *(_QWORD *)v88 = 0x100000001;
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
                                          *(_QWORD *)((char *)&v89[2] + 4) = 0x100000001;
                                          LODWORD(v89[2]) = 1;
                                          *(_DWORD *)&v88[8] = 1;
                                          v9 = 1;
                                          v89[1] = 0x100000001;
                                          v89[0] = 0x100000001;
                                          v87 = 0x100000001;
                                          v10 = 1;
                                          v11 = 1;
                                          *(_QWORD *)v88 = 0x100000001;
                                          v12 = 1;
                                          LODWORD(v94[0]) = 1;
                                        }
                                      }
                                    }
                                    else
                                    {
                                      v12 = 0;
                                      v94[0] = 0x100000000;
                                      v13 = 0;
                                      v14 = 0;
                                      v15 = 0;
                                      v16 = 0;
                                      *(_QWORD *)((char *)&v89[2] + 4) = 0x100000001;
                                      LODWORD(v89[2]) = 1;
                                      *(_DWORD *)&v88[8] = 1;
                                      v89[0] = 0x100000001;
                                      v9 = 1;
                                      v89[1] = 0x100000001;
                                      *(_QWORD *)v88 = 0x100000000;
                                      v87 = 0x100000001;
                                      v10 = 1;
                                      v11 = 1;
                                    }
                                  }
                                }
                                else
                                {
                                  v11 = 0;
                                  v94[0] = 0;
                                  v12 = 0;
                                  v13 = 0;
                                  v14 = 0;
                                  v15 = 0;
                                  v16 = 0;
                                  *(_QWORD *)((char *)&v89[2] + 4) = 0x100000001;
                                  LODWORD(v89[2]) = 1;
                                  *(_DWORD *)&v88[8] = 1;
                                  v89[0] = 0x100000001;
                                  v9 = 1;
                                  v89[1] = 0x100000001;
                                  *(_QWORD *)v88 = 0x100000000;
                                  v87 = 0x100000000;
                                  v10 = 1;
                                  LODWORD(v94[1]) = 1;
                                }
                              }
                            }
                            else
                            {
                              v87 = 0;
                              v10 = 0;
                              *(_QWORD *)((char *)v94 + 4) = 0;
                              v11 = 0;
                              v12 = 0;
                              LODWORD(v94[0]) = 0;
                              v13 = 0;
                              v14 = 0;
                              v15 = 0;
                              v16 = 0;
                              LODWORD(v89[3]) = 1;
                              v89[2] = 0x100000001;
                              *(_DWORD *)&v88[8] = 1;
                              v89[0] = 0x100000001;
                              v9 = 1;
                              v89[1] = 0x100000001;
                              *(_QWORD *)v88 = 0x100000000;
                              HIDWORD(v94[1]) = 1;
                            }
                          }
                        }
                        else
                        {
                          *(_QWORD *)v88 = 0;
                          v94[0] = 0;
                          v94[1] = 0;
                          v87 = 0;
                          v10 = 0;
                          v11 = 0;
                          v12 = 0;
                          v13 = 0;
                          v14 = 0;
                          v15 = 0;
                          v16 = 0;
                          LODWORD(v89[3]) = 1;
                          v89[2] = 0x100000001;
                          *(_DWORD *)&v88[8] = 1;
                          v89[0] = 0x100000000;
                          v9 = 1;
                          v89[1] = 0x100000001;
                          LODWORD(v94[2]) = 1;
                        }
                      }
                    }
                    else
                    {
                      *(_QWORD *)((char *)v89 + 4) = 0;
                      *(_QWORD *)v88 = 0;
                      v87 = 0;
                      v10 = 0;
                      v11 = 0;
                      v12 = 0;
                      memset(v94, 0, 20);
                      v13 = 0;
                      v14 = 0;
                      v15 = 0;
                      v16 = 0;
                      *(_QWORD *)((char *)&v89[2] + 4) = 0x100000001;
                      LODWORD(v89[2]) = 1;
                      *(_DWORD *)&v88[8] = 1;
                      LODWORD(v89[0]) = 0;
                      v9 = 1;
                      HIDWORD(v89[1]) = 1;
                    }
                  }
                  else
                  {
                    *(_QWORD *)((char *)v89 + 4) = 0;
                    *(_QWORD *)v88 = 0;
                    v87 = 0;
                    v10 = 0;
                    v11 = 0;
                    v12 = 0;
                    memset(v94, 0, 20);
                    v13 = 0;
                    v14 = 0;
                    v15 = 0;
                    v16 = 0;
                    *(_QWORD *)((char *)&v89[2] + 4) = 0x100000001;
                    HIDWORD(v89[1]) = 1;
                    LODWORD(v89[2]) = 1;
                    *(_DWORD *)&v88[8] = 1;
                    LODWORD(v89[0]) = 0;
                    v9 = 1;
                    HIDWORD(v94[2]) = 1;
                  }
                }
              }
              else
              {
                v9 = 0;
                v89[0] = 0;
                v89[1] = 0;
                *(_QWORD *)v88 = 0;
                v87 = 0;
                v10 = 0;
                v11 = 0;
                memset(v94, 0, 24);
                v12 = 0;
                v13 = 0;
                v14 = 0;
                v15 = 0;
                v16 = 0;
                *(_QWORD *)((char *)&v89[2] + 4) = 0x100000001;
                LODWORD(v89[2]) = 1;
                *(_DWORD *)&v88[8] = 1;
              }
            }
            else
            {
              v9 = 0;
              v89[0] = 0;
              v89[1] = 0;
              *(_QWORD *)v88 = 0;
              v87 = 0;
              v10 = 0;
              v11 = 0;
              memset(v94, 0, 24);
              v12 = 0;
              v13 = 0;
              v14 = 0;
              v15 = 0;
              v16 = 0;
              *(_QWORD *)((char *)&v89[2] + 4) = 0x100000001;
              LODWORD(v89[2]) = 1;
              *(_DWORD *)&v88[8] = 1;
              LODWORD(v94[3]) = 1;
            }
          }
        }
        else
        {
          v9 = 0;
          memset(v89, 0, 20);
          v87 = 0;
          v10 = 0;
          v11 = 0;
          memset(v88, 0, sizeof(v88));
          v12 = 0;
          memset(v94, 0, 28);
          v13 = 0;
          v14 = 0;
          v15 = 0;
          v16 = 0;
          *(_QWORD *)((char *)&v89[2] + 4) = 0x100000001;
          HIDWORD(v94[3]) = 1;
        }
      }
    }
    else
    {
      v9 = 0;
      memset(v89, 0, 28);
      memset(v94, 0, sizeof(v94));
      v87 = 0;
      v10 = 0;
      v11 = 0;
      memset(v88, 0, sizeof(v88));
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      HIDWORD(v89[3]) = 1;
    }
  }
  if (v15)
  {
    v20 = v6;
    v21 = v10;
    v22 = v11;
    v23 = v12;
    v24 = v13;
    v25 = v9;
    v26 = v14;

    v14 = v26;
    v9 = v25;
    v13 = v24;
    v12 = v23;
    v11 = v22;
    v10 = v21;
    v6 = v20;
  }
  if (v14)

  if (v13)
  {

  }
  if (LODWORD(v94[0]))
  {

  }
  if (v12)

  if (*(_DWORD *)v88)
  {

  }
  if (HIDWORD(v94[0]))
  {

  }
  if (v11)

  if ((_DWORD)v87)
  {

  }
  if (LODWORD(v94[1]))
  {

  }
  if (v10)

  if (HIDWORD(v87))
  {

  }
  if (HIDWORD(v94[1]))
  {

  }
  if (LODWORD(v89[0]))

  if (*(_DWORD *)&v88[4])
  {

  }
  if (LODWORD(v94[2]))
  {

  }
  if (LODWORD(v89[1]))

  if (HIDWORD(v89[0]))
  {

  }
  if (HIDWORD(v94[2]))
  {

  }
  if (!HIDWORD(v89[1]))
  {
    if (!v9)
      goto LABEL_65;
LABEL_84:

    if (!LODWORD(v94[3]))
      goto LABEL_67;
    goto LABEL_66;
  }

  if (v9)
    goto LABEL_84;
LABEL_65:
  if (LODWORD(v94[3]))
  {
LABEL_66:

  }
LABEL_67:
  if (*(_DWORD *)&v88[8])

  if (LODWORD(v89[2]))
  {

  }
  if (HIDWORD(v94[3]))
  {

  }
  if (HIDWORD(v89[2]))

  if (LODWORD(v89[3]))
  {

  }
  if (HIDWORD(v89[3]))
  {

  }
  if (v91 != v90)

LABEL_82:
  return v16;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  unint64_t v25;
  void *v27;
  void *v28;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)SFCollectionCardSection;
  v3 = -[SFCardSection hash](&v29, sel_hash);
  -[SFCardSection punchoutOptions](self, "punchoutOptions");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v28, "hash");
  -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 ^ objc_msgSend(v27, "hash");
  -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");
  v8 = v7 ^ -[SFCardSection canBeHidden](self, "canBeHidden");
  v9 = v8 ^ -[SFCardSection hasTopPadding](self, "hasTopPadding") ^ v3;
  v10 = -[SFCardSection hasBottomPadding](self, "hasBottomPadding");
  -[SFCollectionCardSection type](self, "type");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10 ^ objc_msgSend(v11, "hash");
  v13 = v12 ^ -[SFCardSection separatorStyle](self, "separatorStyle");
  -[SFCardSection backgroundColor](self, "backgroundColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v13 ^ objc_msgSend(v14, "hash");
  -[SFCollectionCardSection cardSections](self, "cardSections");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v9 ^ v15 ^ objc_msgSend(v16, "hash");
  -[SFCollectionCardSection title](self, "title");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "hash");
  -[SFCollectionCardSection buttonItem](self, "buttonItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v19 ^ objc_msgSend(v20, "hash");
  -[SFCollectionCardSection collectionStyle](self, "collectionStyle");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v21 ^ objc_msgSend(v22, "hash");
  -[SFCollectionCardSection titleButtonItem](self, "titleButtonItem");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v17 ^ v23 ^ objc_msgSend(v24, "hash");

  return v25;
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSArray)cardSections
{
  return self->_cardSections;
}

- (void)setCardSections:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (SFRichText)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (SFCommandButtonItem)buttonItem
{
  return self->_buttonItem;
}

- (void)setButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_buttonItem, a3);
}

- (SFCollectionStyle)collectionStyle
{
  return self->_collectionStyle;
}

- (void)setCollectionStyle:(id)a3
{
  objc_storeStrong((id *)&self->_collectionStyle, a3);
}

- (SFCommandButtonItem)titleButtonItem
{
  return self->_titleButtonItem;
}

- (void)setTitleButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_titleButtonItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleButtonItem, 0);
  objc_storeStrong((id *)&self->_collectionStyle, 0);
  objc_storeStrong((id *)&self->_buttonItem, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_cardSections, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFCollectionCardSection)initWithProtobuf:(id)a3
{
  id v4;
  SFCollectionCardSection *v5;
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
  SFCardSection *v31;
  void *v32;
  SFRichText *v33;
  void *v34;
  SFRichText *v35;
  void *v36;
  SFCommandButtonItem *v37;
  void *v38;
  SFCommandButtonItem *v39;
  void *v40;
  SFCollectionStyle *v41;
  void *v42;
  SFCollectionStyle *v43;
  void *v44;
  SFCommandButtonItem *v45;
  void *v46;
  SFCommandButtonItem *v47;
  SFCollectionCardSection *v48;
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
  v58.super_class = (Class)SFCollectionCardSection;
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
      -[SFCollectionCardSection setType:](v5, "setType:", v19);

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
    objc_msgSend(v4, "cardSections");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
      v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v25 = 0;

    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    objc_msgSend(v4, "cardSections", 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v51;
      do
      {
        for (j = 0; j != v28; ++j)
        {
          if (*(_QWORD *)v51 != v29)
            objc_enumerationMutation(v26);
          v31 = -[SFCardSection initWithProtobuf:]([SFCardSection alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * j));
          if (v31)
            objc_msgSend(v25, "addObject:", v31);

        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
      }
      while (v28);
    }

    -[SFCollectionCardSection setCardSections:](v5, "setCardSections:", v25);
    objc_msgSend(v4, "title");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      v33 = [SFRichText alloc];
      objc_msgSend(v4, "title");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = -[SFRichText initWithProtobuf:](v33, "initWithProtobuf:", v34);
      -[SFCollectionCardSection setTitle:](v5, "setTitle:", v35);

    }
    objc_msgSend(v4, "buttonItem");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      v37 = [SFCommandButtonItem alloc];
      objc_msgSend(v4, "buttonItem");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = -[SFCommandButtonItem initWithProtobuf:](v37, "initWithProtobuf:", v38);
      -[SFCollectionCardSection setButtonItem:](v5, "setButtonItem:", v39);

    }
    objc_msgSend(v4, "collectionStyle");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (v40)
    {
      v41 = [SFCollectionStyle alloc];
      objc_msgSend(v4, "collectionStyle");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = -[SFCollectionStyle initWithProtobuf:](v41, "initWithProtobuf:", v42);
      -[SFCollectionCardSection setCollectionStyle:](v5, "setCollectionStyle:", v43);

    }
    objc_msgSend(v4, "titleButtonItem");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v44)
    {
      v45 = [SFCommandButtonItem alloc];
      objc_msgSend(v4, "titleButtonItem");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = -[SFCommandButtonItem initWithProtobuf:](v45, "initWithProtobuf:", v46);
      -[SFCollectionCardSection setTitleButtonItem:](v5, "setTitleButtonItem:", v47);

    }
    v48 = v5;

  }
  return v5;
}

- (void)addCardsFromButtonsTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFCollectionCardSection;
  -[SFCardSection addCardsFromButtonsTo:](&v9, sel_addCardsFromButtonsTo_, v4);
  -[SFCollectionCardSection buttonItem](self, "buttonItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SFCollectionCardSection buttonItem](self, "buttonItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "command");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "embeddedCards");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v8);

  }
}

@end
