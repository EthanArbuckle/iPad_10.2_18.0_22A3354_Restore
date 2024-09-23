@implementation RFFactItemButtonCardSection

- (void)setButtonItemsAreBottom:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_buttonItemsAreBottom = a3;
}

- (BOOL)hasButtonItemsAreBottom
{
  return *(_BYTE *)&self->_has & 1;
}

- (RFFactItemButtonCardSection)initWithCoder:(id)a3
{
  id v4;
  RFFactItemButtonCardSection *v5;
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
    -[SFCardSection text](v8, "text");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFFactItemButtonCardSection setText_1:](v5, "setText_1:", v9);

    -[SFCardSection button](v8, "button");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFFactItemButtonCardSection setButton_1:](v5, "setButton_1:", v10);

    -[SFCardSection button](v8, "button");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFFactItemButtonCardSection setButton_2:](v5, "setButton_2:", v11);

    -[SFCardSection button](v8, "button");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFFactItemButtonCardSection setButton_3:](v5, "setButton_3:", v12);

    -[SFCardSection text](v8, "text");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFFactItemButtonCardSection setText_2:](v5, "setText_2:", v13);

    -[SFCardSection text](v8, "text");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFFactItemButtonCardSection setText_3:](v5, "setText_3:", v14);

    -[SFCardSection text](v8, "text");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFFactItemButtonCardSection setText_4:](v5, "setText_4:", v15);

    -[SFCardSection text](v8, "text");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFFactItemButtonCardSection setText_5:](v5, "setText_5:", v16);

    -[SFCardSection thumbnail](v8, "thumbnail");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFFactItemButtonCardSection setThumbnail:](v5, "setThumbnail:", v17);

    -[SFCardSection thumbnail2](v8, "thumbnail2");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFFactItemButtonCardSection setThumbnail2:](v5, "setThumbnail2:", v18);

    -[RFFactItemButtonCardSection setButtonItemsAreBottom:](v5, "setButtonItemsAreBottom:", -[SFCardSection buttonItemsAreBottom](v8, "buttonItemsAreBottom"));
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
  v3.super_class = (Class)RFFactItemButtonCardSection;
  -[SFCardSection encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBRFFactItemButtonCardSection *v2;
  void *v3;

  v2 = -[_SFPBRFFactItemButtonCardSection initWithFacade:]([_SFPBRFFactItemButtonCardSection alloc], "initWithFacade:", self);
  -[_SFPBRFFactItemButtonCardSection dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBRFFactItemButtonCardSection *v2;
  void *v3;

  v2 = -[_SFPBRFFactItemButtonCardSection initWithFacade:]([_SFPBRFFactItemButtonCardSection alloc], "initWithFacade:", self);
  -[_SFPBRFFactItemButtonCardSection jsonData](v2, "jsonData");
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
  v26.super_class = (Class)RFFactItemButtonCardSection;
  v4 = -[SFCardSection copyWithZone:](&v26, sel_copyWithZone_, a3);
  -[RFFactItemButtonCardSection text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setText_1:", v6);

  -[RFFactItemButtonCardSection button](self, "button");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setButton_1:", v8);

  -[RFFactItemButtonCardSection button](self, "button");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setButton_2:", v10);

  -[RFFactItemButtonCardSection button](self, "button");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setButton_3:", v12);

  -[RFFactItemButtonCardSection text](self, "text");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setText_2:", v14);

  -[RFFactItemButtonCardSection text](self, "text");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v4, "setText_3:", v16);

  -[RFFactItemButtonCardSection text](self, "text");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");
  objc_msgSend(v4, "setText_4:", v18);

  -[RFFactItemButtonCardSection text](self, "text");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");
  objc_msgSend(v4, "setText_5:", v20);

  -[RFFactItemButtonCardSection thumbnail](self, "thumbnail");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "copy");
  objc_msgSend(v4, "setThumbnail:", v22);

  -[RFFactItemButtonCardSection thumbnail2](self, "thumbnail2");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v23, "copy");
  objc_msgSend(v4, "setThumbnail2:", v24);

  objc_msgSend(v4, "setButtonItemsAreBottom:", -[RFFactItemButtonCardSection buttonItemsAreBottom](self, "buttonItemsAreBottom"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  RFFactItemButtonCardSection *v4;
  RFFactItemButtonCardSection *v5;
  void *v6;
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
  int v17;
  int v18;
  int v19;
  _BOOL4 v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  _BOOL4 v24;
  uint64_t v25;
  RFFactItemButtonCardSection *v26;
  void *v27;
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
  _BOOL4 v40;
  int v41;
  RFFactItemButtonCardSection *v43;
  _BOOL4 v44;
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
  uint64_t v92;
  _BYTE v93[44];
  int v94;
  int v95;
  id v96;
  id v97;
  _BYTE v98[28];
  objc_super v99;

  v4 = (RFFactItemButtonCardSection *)a3;
  if (self == v4)
  {
    LOBYTE(v20) = 1;
    goto LABEL_119;
  }
  if (!-[RFFactItemButtonCardSection isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class())
    || (v99.receiver = self,
        v99.super_class = (Class)RFFactItemButtonCardSection,
        !-[SFCardSection isEqual:](&v99, sel_isEqual_, v4)))
  {
    LOBYTE(v20) = 0;
    goto LABEL_119;
  }
  v5 = v4;
  -[RFFactItemButtonCardSection text](self, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RFFactItemButtonCardSection text](v5, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = v8;
  v97 = v6;
  v94 = v8 != 0;
  v95 = v6 == 0;
  if (v95 == v94)
  {
    v92 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    memset(v93, 0, sizeof(v93));
    memset(v98, 0, sizeof(v98));
    v18 = 0;
    v19 = 0;
    LOBYTE(v20) = 0;
  }
  else
  {
    -[RFFactItemButtonCardSection text](self, "text");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9 != 0;
    v91 = (void *)v9;
    if (!v9
      || (-[RFFactItemButtonCardSection text](self, "text"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          -[RFFactItemButtonCardSection text](v5, "text"),
          v87 = (void *)objc_claimAutoreleasedReturnValue(),
          v88 = v11,
          objc_msgSend(v11, "isEqual:")))
    {
      -[RFFactItemButtonCardSection button](self, "button");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFFactItemButtonCardSection button](v5, "button");
      *(_DWORD *)&v93[40] = v10;
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v90 == 0) == (v89 != 0))
      {
        v92 = 0;
        v12 = 0;
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v17 = 0;
        memset(v93, 0, 32);
        memset(v98, 0, sizeof(v98));
        v18 = 0;
        v19 = 0;
        LOBYTE(v20) = 0;
        *(_QWORD *)&v93[32] = 1;
      }
      else
      {
        -[RFFactItemButtonCardSection button](self, "button");
        v21 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)&v98[24] = v21 != 0;
        v86 = (void *)v21;
        if (!v21
          || (-[RFFactItemButtonCardSection button](self, "button"),
              v22 = (void *)objc_claimAutoreleasedReturnValue(),
              -[RFFactItemButtonCardSection button](v5, "button"),
              v82 = (void *)objc_claimAutoreleasedReturnValue(),
              v83 = v22,
              objc_msgSend(v22, "isEqual:")))
        {
          -[RFFactItemButtonCardSection button](self, "button");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          -[RFFactItemButtonCardSection button](v5, "button");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          if ((v85 == 0) != (v84 != 0))
          {
            -[RFFactItemButtonCardSection button](self, "button");
            v23 = objc_claimAutoreleasedReturnValue();
            v24 = v23 != 0;
            v81 = (void *)v23;
            if (v23)
            {
              -[RFFactItemButtonCardSection button](self, "button");
              v25 = objc_claimAutoreleasedReturnValue();
              v26 = v5;
              v27 = (void *)v25;
              v43 = v26;
              -[RFFactItemButtonCardSection button](v26, "button");
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              v78 = v27;
              if (!objc_msgSend(v27, "isEqual:"))
              {
                v92 = 0;
                v12 = 0;
                v13 = 0;
                v14 = 0;
                v15 = 0;
                v16 = 0;
                memset(v98, 0, 24);
                v17 = 0;
                memset(v93, 0, 20);
                v18 = 0;
                v19 = 0;
                LOBYTE(v20) = 0;
                *(_QWORD *)&v93[28] = 0x100000001;
                *(_QWORD *)&v93[20] = 0x100000001;
                *(_DWORD *)&v93[36] = 1;
                v5 = v43;
                goto LABEL_60;
              }
              *(_DWORD *)&v93[36] = v24;
              v5 = v43;
            }
            else
            {
              *(_DWORD *)&v93[36] = 0;
            }
            -[RFFactItemButtonCardSection button](self, "button");
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            -[RFFactItemButtonCardSection button](v5, "button");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            if ((v80 == 0) == (v79 != 0))
            {
              v92 = 0;
              *(_QWORD *)&v93[4] = 0;
              v12 = 0;
              v13 = 0;
              v14 = 0;
              v15 = 0;
              v16 = 0;
              memset(v98, 0, 24);
              v17 = 0;
              *(_DWORD *)v93 = 0;
              v18 = 0;
              v19 = 0;
              LOBYTE(v20) = 0;
              *(_QWORD *)&v93[28] = 0x100000001;
              *(_QWORD *)&v93[20] = 0x100000001;
              *(_QWORD *)&v93[12] = 1;
            }
            else
            {
              -[RFFactItemButtonCardSection button](self, "button");
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)&v98[20] = v76 != 0;
              if (!v76
                || (-[RFFactItemButtonCardSection button](self, "button"),
                    v28 = (void *)objc_claimAutoreleasedReturnValue(),
                    -[RFFactItemButtonCardSection button](v5, "button"),
                    v72 = (void *)objc_claimAutoreleasedReturnValue(),
                    v73 = v28,
                    objc_msgSend(v28, "isEqual:")))
              {
                -[RFFactItemButtonCardSection text](self, "text");
                v75 = (void *)objc_claimAutoreleasedReturnValue();
                -[RFFactItemButtonCardSection text](v5, "text");
                v74 = (void *)objc_claimAutoreleasedReturnValue();
                if ((v75 == 0) == (v74 != 0))
                {
                  *(_QWORD *)&v93[4] = 0;
                  v12 = 0;
                  v13 = 0;
                  v14 = 0;
                  v15 = 0;
                  v16 = 0;
                  v17 = 0;
                  *(_DWORD *)v93 = 0;
                  memset(v98, 0, 20);
                  v18 = 0;
                  v19 = 0;
                  LOBYTE(v20) = 0;
                  *(_QWORD *)&v93[28] = 0x100000001;
                  *(_QWORD *)&v93[20] = 0x100000001;
                  *(_QWORD *)&v93[12] = 0x100000001;
                  v92 = 0x100000000;
                }
                else
                {
                  -[RFFactItemButtonCardSection text](self, "text");
                  v71 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)&v98[16] = v71 != 0;
                  if (!v71
                    || (-[RFFactItemButtonCardSection text](self, "text"),
                        v29 = (void *)objc_claimAutoreleasedReturnValue(),
                        -[RFFactItemButtonCardSection text](v5, "text"),
                        v67 = (void *)objc_claimAutoreleasedReturnValue(),
                        v68 = v29,
                        objc_msgSend(v29, "isEqual:")))
                  {
                    -[RFFactItemButtonCardSection text](self, "text");
                    v70 = (void *)objc_claimAutoreleasedReturnValue();
                    -[RFFactItemButtonCardSection text](v5, "text");
                    v69 = (void *)objc_claimAutoreleasedReturnValue();
                    if ((v70 == 0) == (v69 != 0))
                    {
                      *(_QWORD *)&v98[8] = 0;
                      v13 = 0;
                      v14 = 0;
                      v15 = 0;
                      v16 = 0;
                      *(_QWORD *)v98 = 0;
                      v17 = 0;
                      *(_QWORD *)v93 = 0;
                      v18 = 0;
                      v19 = 0;
                      LOBYTE(v20) = 0;
                      *(_QWORD *)&v93[28] = 0x100000001;
                      *(_QWORD *)&v93[20] = 0x100000001;
                      *(_QWORD *)&v93[12] = 0x100000001;
                      v92 = 0x100000000;
                      *(_DWORD *)&v93[8] = 1;
                      v12 = 1;
                    }
                    else
                    {
                      -[RFFactItemButtonCardSection text](self, "text");
                      v30 = objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)&v98[12] = v30 != 0;
                      v66 = (void *)v30;
                      if (!v30
                        || (-[RFFactItemButtonCardSection text](self, "text"),
                            v31 = (void *)objc_claimAutoreleasedReturnValue(),
                            -[RFFactItemButtonCardSection text](v5, "text"),
                            v62 = (void *)objc_claimAutoreleasedReturnValue(),
                            v63 = v31,
                            objc_msgSend(v31, "isEqual:")))
                      {
                        -[RFFactItemButtonCardSection text](self, "text");
                        v65 = (void *)objc_claimAutoreleasedReturnValue();
                        -[RFFactItemButtonCardSection text](v5, "text");
                        v64 = (void *)objc_claimAutoreleasedReturnValue();
                        if ((v65 == 0) == (v64 != 0))
                        {
                          v14 = 0;
                          *(_QWORD *)&v98[4] = 0;
                          v15 = 0;
                          v16 = 0;
                          v17 = 0;
                          *(_QWORD *)v93 = 0;
                          *(_DWORD *)v98 = 0;
                          v18 = 0;
                          v19 = 0;
                          LOBYTE(v20) = 0;
                          *(_QWORD *)&v93[28] = 0x100000001;
                          *(_QWORD *)&v93[20] = 0x100000001;
                          *(_QWORD *)&v93[12] = 0x100000001;
                          v92 = 0x100000001;
                          *(_DWORD *)&v93[8] = 1;
                          v12 = 1;
                          v13 = 1;
                        }
                        else
                        {
                          -[RFFactItemButtonCardSection text](self, "text");
                          v32 = objc_claimAutoreleasedReturnValue();
                          *(_DWORD *)&v98[8] = v32 != 0;
                          v61 = (void *)v32;
                          if (!v32
                            || (-[RFFactItemButtonCardSection text](self, "text"),
                                v33 = (void *)objc_claimAutoreleasedReturnValue(),
                                -[RFFactItemButtonCardSection text](v5, "text"),
                                v57 = (void *)objc_claimAutoreleasedReturnValue(),
                                v58 = v33,
                                objc_msgSend(v33, "isEqual:")))
                          {
                            -[RFFactItemButtonCardSection text](self, "text");
                            v60 = (void *)objc_claimAutoreleasedReturnValue();
                            -[RFFactItemButtonCardSection text](v5, "text");
                            v59 = (void *)objc_claimAutoreleasedReturnValue();
                            if ((v60 == 0) == (v59 != 0))
                            {
                              v16 = 0;
                              *(_QWORD *)v98 = 0;
                              v17 = 0;
                              *(_QWORD *)v93 = 0;
                              v18 = 0;
                              v19 = 0;
                              LOBYTE(v20) = 0;
                              *(_QWORD *)&v93[28] = 0x100000001;
                              *(_QWORD *)&v93[20] = 0x100000001;
                              *(_QWORD *)&v93[12] = 0x100000001;
                              v92 = 0x100000001;
                              *(_DWORD *)&v93[8] = 1;
                              v12 = 1;
                              v13 = 1;
                              v14 = 1;
                              v15 = 1;
                            }
                            else
                            {
                              -[RFFactItemButtonCardSection text](self, "text");
                              v34 = objc_claimAutoreleasedReturnValue();
                              *(_DWORD *)&v98[4] = v34 != 0;
                              v56 = (void *)v34;
                              if (!v34
                                || (-[RFFactItemButtonCardSection text](self, "text"),
                                    v35 = (void *)objc_claimAutoreleasedReturnValue(),
                                    -[RFFactItemButtonCardSection text](v5, "text"),
                                    v52 = (void *)objc_claimAutoreleasedReturnValue(),
                                    v53 = v35,
                                    objc_msgSend(v35, "isEqual:")))
                              {
                                -[RFFactItemButtonCardSection thumbnail](self, "thumbnail");
                                v55 = (void *)objc_claimAutoreleasedReturnValue();
                                -[RFFactItemButtonCardSection thumbnail](v5, "thumbnail");
                                v54 = (void *)objc_claimAutoreleasedReturnValue();
                                if ((v55 == 0) == (v54 != 0))
                                {
                                  *(_QWORD *)v93 = 0;
                                  *(_DWORD *)v98 = 0;
                                  v18 = 0;
                                  v19 = 0;
                                  LOBYTE(v20) = 0;
                                  *(_QWORD *)&v93[28] = 0x100000001;
                                  *(_QWORD *)&v93[20] = 0x100000001;
                                  *(_QWORD *)&v93[12] = 0x100000001;
                                  v92 = 0x100000001;
                                  *(_DWORD *)&v93[8] = 1;
                                  v12 = 1;
                                  v13 = 1;
                                  v14 = 1;
                                  v15 = 1;
                                  v16 = 1;
                                  v17 = 1;
                                }
                                else
                                {
                                  -[RFFactItemButtonCardSection thumbnail](self, "thumbnail");
                                  v36 = objc_claimAutoreleasedReturnValue();
                                  *(_DWORD *)v98 = v36 != 0;
                                  v51 = (void *)v36;
                                  if (!v36
                                    || (-[RFFactItemButtonCardSection thumbnail](self, "thumbnail"),
                                        v37 = (void *)objc_claimAutoreleasedReturnValue(),
                                        -[RFFactItemButtonCardSection thumbnail](v5, "thumbnail"),
                                        v47 = (void *)objc_claimAutoreleasedReturnValue(),
                                        v48 = v37,
                                        objc_msgSend(v37, "isEqual:")))
                                  {
                                    -[RFFactItemButtonCardSection thumbnail2](self, "thumbnail2");
                                    v50 = (void *)objc_claimAutoreleasedReturnValue();
                                    -[RFFactItemButtonCardSection thumbnail2](v5, "thumbnail2");
                                    v49 = (void *)objc_claimAutoreleasedReturnValue();
                                    if ((v50 == 0) == (v49 != 0))
                                    {
                                      v18 = 0;
                                      v19 = 0;
                                      LOBYTE(v20) = 0;
                                      *(_QWORD *)&v93[28] = 0x100000001;
                                      *(_QWORD *)&v93[20] = 0x100000001;
                                      *(_QWORD *)&v93[12] = 0x100000001;
                                      v92 = 0x100000001;
                                      *(_DWORD *)&v93[8] = 1;
                                      v12 = 1;
                                      v13 = 1;
                                      v14 = 1;
                                      v15 = 1;
                                      v16 = 1;
                                      v17 = 1;
                                      *(_QWORD *)v93 = 0x100000001;
                                    }
                                    else
                                    {
                                      -[RFFactItemButtonCardSection thumbnail2](self, "thumbnail2");
                                      v38 = objc_claimAutoreleasedReturnValue();
                                      v44 = v38 != 0;
                                      v46 = (void *)v38;
                                      if (!v38
                                        || (-[RFFactItemButtonCardSection thumbnail2](self, "thumbnail2"),
                                            v39 = (void *)objc_claimAutoreleasedReturnValue(),
                                            -[RFFactItemButtonCardSection thumbnail2](v5, "thumbnail2"),
                                            v45 = v39,
                                            v8 = (void *)objc_claimAutoreleasedReturnValue(),
                                            objc_msgSend(v39, "isEqual:")))
                                      {
                                        v40 = -[RFFactItemButtonCardSection buttonItemsAreBottom](self, "buttonItemsAreBottom");
                                        v20 = v40 ^ -[RFFactItemButtonCardSection buttonItemsAreBottom](v5, "buttonItemsAreBottom") ^ 1;
                                        *(_QWORD *)&v93[28] = 0x100000001;
                                        *(_QWORD *)&v93[20] = 0x100000001;
                                        *(_QWORD *)&v93[12] = 0x100000001;
                                        v92 = 0x100000001;
                                        *(_DWORD *)&v93[8] = 1;
                                        v12 = 1;
                                        v13 = 1;
                                        v14 = 1;
                                        v15 = 1;
                                        v16 = 1;
                                        v17 = 1;
                                        *(_QWORD *)v93 = 0x100000001;
                                        v18 = 1;
                                        v19 = v44;
                                      }
                                      else
                                      {
                                        LOBYTE(v20) = 0;
                                        *(_QWORD *)&v93[28] = 0x100000001;
                                        *(_QWORD *)&v93[20] = 0x100000001;
                                        *(_QWORD *)&v93[12] = 0x100000001;
                                        v92 = 0x100000001;
                                        *(_DWORD *)&v93[8] = 1;
                                        v12 = 1;
                                        v13 = 1;
                                        v14 = 1;
                                        v15 = 1;
                                        v16 = 1;
                                        v17 = 1;
                                        *(_QWORD *)v93 = 0x100000001;
                                        v18 = 1;
                                        v19 = 1;
                                      }
                                      v7 = v8;
                                    }
                                  }
                                  else
                                  {
                                    v18 = 0;
                                    v19 = 0;
                                    LOBYTE(v20) = 0;
                                    *(_QWORD *)&v93[28] = 0x100000001;
                                    *(_QWORD *)&v93[20] = 0x100000001;
                                    *(_QWORD *)&v93[12] = 0x100000001;
                                    v92 = 0x100000001;
                                    *(_DWORD *)&v93[8] = 1;
                                    v12 = 1;
                                    v13 = 1;
                                    v14 = 1;
                                    v15 = 1;
                                    v16 = 1;
                                    v17 = 1;
                                    *(_QWORD *)v93 = 1;
                                    *(_DWORD *)v98 = 1;
                                  }
                                }
                              }
                              else
                              {
                                v17 = 0;
                                *(_QWORD *)v93 = 0;
                                v18 = 0;
                                v19 = 0;
                                LOBYTE(v20) = 0;
                                *(_QWORD *)&v93[28] = 0x100000001;
                                *(_QWORD *)&v93[20] = 0x100000001;
                                *(_QWORD *)&v93[12] = 0x100000001;
                                v92 = 0x100000001;
                                *(_DWORD *)&v93[8] = 1;
                                v12 = 1;
                                v13 = 1;
                                v14 = 1;
                                v15 = 1;
                                v16 = 1;
                                *(_QWORD *)v98 = 0x100000000;
                              }
                            }
                          }
                          else
                          {
                            v15 = 0;
                            v16 = 0;
                            *(_QWORD *)v98 = 0;
                            v17 = 0;
                            *(_QWORD *)v93 = 0;
                            v18 = 0;
                            v19 = 0;
                            LOBYTE(v20) = 0;
                            *(_QWORD *)&v93[28] = 0x100000001;
                            *(_QWORD *)&v93[20] = 0x100000001;
                            *(_QWORD *)&v93[12] = 0x100000001;
                            v92 = 0x100000001;
                            *(_DWORD *)&v93[8] = 1;
                            v12 = 1;
                            v13 = 1;
                            v14 = 1;
                            *(_DWORD *)&v98[8] = 1;
                          }
                        }
                      }
                      else
                      {
                        v13 = 0;
                        v14 = 0;
                        *(_QWORD *)&v98[4] = 0;
                        v15 = 0;
                        v16 = 0;
                        v17 = 0;
                        *(_QWORD *)v93 = 0;
                        *(_DWORD *)v98 = 0;
                        v18 = 0;
                        v19 = 0;
                        LOBYTE(v20) = 0;
                        *(_QWORD *)&v93[28] = 0x100000001;
                        *(_QWORD *)&v93[20] = 0x100000001;
                        *(_QWORD *)&v93[12] = 0x100000001;
                        v92 = 0x100000001;
                        *(_DWORD *)&v93[8] = 1;
                        v12 = 1;
                        *(_DWORD *)&v98[12] = 1;
                      }
                    }
                  }
                  else
                  {
                    v12 = 0;
                    *(_QWORD *)&v98[8] = 0;
                    v13 = 0;
                    v14 = 0;
                    v15 = 0;
                    v16 = 0;
                    *(_QWORD *)v98 = 0;
                    v17 = 0;
                    *(_QWORD *)v93 = 0;
                    v18 = 0;
                    v19 = 0;
                    LOBYTE(v20) = 0;
                    *(_QWORD *)&v93[28] = 0x100000001;
                    *(_QWORD *)&v93[20] = 0x100000001;
                    *(_QWORD *)&v93[12] = 0x100000001;
                    v92 = 0x100000000;
                    *(_DWORD *)&v93[8] = 1;
                    *(_DWORD *)&v98[16] = 1;
                  }
                }
              }
              else
              {
                v92 = 0;
                *(_QWORD *)&v93[4] = 0;
                v12 = 0;
                v13 = 0;
                v14 = 0;
                v15 = 0;
                v16 = 0;
                v17 = 0;
                *(_DWORD *)v93 = 0;
                memset(v98, 0, 20);
                v18 = 0;
                v19 = 0;
                LOBYTE(v20) = 0;
                *(_QWORD *)&v93[28] = 0x100000001;
                *(_QWORD *)&v93[20] = 0x100000001;
                *(_QWORD *)&v93[12] = 0x100000001;
                *(_DWORD *)&v98[20] = 1;
              }
            }
            goto LABEL_60;
          }
          v92 = 0;
          v12 = 0;
          v13 = 0;
          v14 = 0;
          v15 = 0;
          v16 = 0;
          memset(v98, 0, 24);
          v17 = 0;
          memset(v93, 0, 20);
          v18 = 0;
          v19 = 0;
          LOBYTE(v20) = 0;
          *(_DWORD *)&v93[36] = 0;
          *(_QWORD *)&v93[28] = 0x100000001;
          *(_QWORD *)&v93[20] = 1;
        }
        else
        {
          v92 = 0;
          v12 = 0;
          v13 = 0;
          v14 = 0;
          v15 = 0;
          v16 = 0;
          memset(v98, 0, 24);
          v17 = 0;
          memset(v93, 0, 28);
          v18 = 0;
          v19 = 0;
          LOBYTE(v20) = 0;
          *(_DWORD *)&v93[36] = 0;
          *(_QWORD *)&v93[28] = 0x100000001;
          *(_DWORD *)&v98[24] = 1;
        }
      }
    }
    else
    {
      v92 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      memset(v93, 0, 40);
      memset(v98, 0, sizeof(v98));
      v18 = 0;
      v19 = 0;
      LOBYTE(v20) = 0;
      *(_DWORD *)&v93[40] = 1;
    }
  }
LABEL_60:
  if (v19)
  {
    v41 = v18;

    v18 = v41;
  }
  if (v18)

  if (*(_DWORD *)&v93[4])
  {

  }
  if (*(_DWORD *)v98)
  {

  }
  if (*(_DWORD *)v93)

  if (v17)
  {

  }
  if (*(_DWORD *)&v98[4])
  {

  }
  if (v16)

  if (v15)
  {

  }
  if (*(_DWORD *)&v98[8])
  {

  }
  if (v14)

  if (v13)
  {

  }
  if (*(_DWORD *)&v98[12])
  {

  }
  if ((_DWORD)v92)

  if (v12)
  {

  }
  if (*(_DWORD *)&v98[16])
  {

  }
  if (*(_DWORD *)&v93[8])

  if (HIDWORD(v92))
  {

  }
  if (*(_DWORD *)&v98[20])
  {

  }
  if (*(_DWORD *)&v93[16])

  if (*(_DWORD *)&v93[12])
  {

  }
  if (*(_DWORD *)&v93[36])
  {

  }
  if (*(_DWORD *)&v93[24])

  if (*(_DWORD *)&v93[20])
  {

  }
  if (*(_DWORD *)&v98[24])
  {

  }
  if (*(_DWORD *)&v93[28])

  if (*(_DWORD *)&v93[32])
  {

  }
  if (*(_DWORD *)&v93[40])
  {

  }
  if (v95 != v94)

LABEL_119:
  return v20;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  unint64_t v21;
  void *v23;
  void *v24;
  void *v25;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)RFFactItemButtonCardSection;
  v3 = -[SFCardSection hash](&v26, sel_hash);
  -[RFFactItemButtonCardSection text](self, "text");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v25, "hash");
  -[RFFactItemButtonCardSection button](self, "button");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 ^ objc_msgSend(v24, "hash");
  -[RFFactItemButtonCardSection button](self, "button");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 ^ objc_msgSend(v23, "hash");
  -[RFFactItemButtonCardSection button](self, "button");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");
  -[RFFactItemButtonCardSection text](self, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8 ^ objc_msgSend(v9, "hash") ^ v3;
  -[RFFactItemButtonCardSection text](self, "text");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  -[RFFactItemButtonCardSection text](self, "text");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 ^ objc_msgSend(v13, "hash");
  -[RFFactItemButtonCardSection text](self, "text");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v14 ^ objc_msgSend(v15, "hash");
  -[RFFactItemButtonCardSection thumbnail](self, "thumbnail");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v16 ^ objc_msgSend(v17, "hash");
  -[RFFactItemButtonCardSection thumbnail2](self, "thumbnail2");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v18 ^ objc_msgSend(v19, "hash");
  v21 = v10 ^ v20 ^ -[RFFactItemButtonCardSection buttonItemsAreBottom](self, "buttonItemsAreBottom");

  return v21;
}

- (RFTextProperty)text_1
{
  return self->_text_1;
}

- (void)setText_1:(id)a3
{
  objc_storeStrong((id *)&self->_text_1, a3);
}

- (SFButtonItem)button_1
{
  return self->_button_1;
}

- (void)setButton_1:(id)a3
{
  objc_storeStrong((id *)&self->_button_1, a3);
}

- (SFButtonItem)button_2
{
  return self->_button_2;
}

- (void)setButton_2:(id)a3
{
  objc_storeStrong((id *)&self->_button_2, a3);
}

- (SFButtonItem)button_3
{
  return self->_button_3;
}

- (void)setButton_3:(id)a3
{
  objc_storeStrong((id *)&self->_button_3, a3);
}

- (RFTextProperty)text_2
{
  return self->_text_2;
}

- (void)setText_2:(id)a3
{
  objc_storeStrong((id *)&self->_text_2, a3);
}

- (RFTextProperty)text_3
{
  return self->_text_3;
}

- (void)setText_3:(id)a3
{
  objc_storeStrong((id *)&self->_text_3, a3);
}

- (NSArray)text_4
{
  return self->_text_4;
}

- (void)setText_4:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (RFTextProperty)text_5
{
  return self->_text_5;
}

- (void)setText_5:(id)a3
{
  objc_storeStrong((id *)&self->_text_5, a3);
}

- (RFVisualProperty)thumbnail
{
  return self->_thumbnail;
}

- (void)setThumbnail:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnail, a3);
}

- (RFVisualProperty)thumbnail2
{
  return self->_thumbnail2;
}

- (void)setThumbnail2:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnail2, a3);
}

- (BOOL)buttonItemsAreBottom
{
  return self->_buttonItemsAreBottom;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnail2, 0);
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_text_5, 0);
  objc_storeStrong((id *)&self->_text_4, 0);
  objc_storeStrong((id *)&self->_text_3, 0);
  objc_storeStrong((id *)&self->_text_2, 0);
  objc_storeStrong((id *)&self->_button_3, 0);
  objc_storeStrong((id *)&self->_button_2, 0);
  objc_storeStrong((id *)&self->_button_1, 0);
  objc_storeStrong((id *)&self->_text_1, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RFFactItemButtonCardSection)initWithProtobuf:(id)a3
{
  id v4;
  RFFactItemButtonCardSection *v5;
  void *v6;
  RFTextProperty *v7;
  void *v8;
  RFTextProperty *v9;
  void *v10;
  SFButtonItem *v11;
  void *v12;
  SFButtonItem *v13;
  void *v14;
  SFButtonItem *v15;
  void *v16;
  SFButtonItem *v17;
  void *v18;
  SFButtonItem *v19;
  void *v20;
  SFButtonItem *v21;
  void *v22;
  RFTextProperty *v23;
  void *v24;
  RFTextProperty *v25;
  void *v26;
  RFTextProperty *v27;
  void *v28;
  RFTextProperty *v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  RFTextProperty *v37;
  void *v38;
  RFTextProperty *v39;
  void *v40;
  RFTextProperty *v41;
  void *v42;
  RFVisualProperty *v43;
  void *v44;
  RFVisualProperty *v45;
  void *v46;
  RFVisualProperty *v47;
  void *v48;
  RFVisualProperty *v49;
  RFFactItemButtonCardSection *v50;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  objc_super v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v56.receiver = self;
  v56.super_class = (Class)RFFactItemButtonCardSection;
  v5 = -[SFCardSection init](&v56, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [RFTextProperty alloc];
      objc_msgSend(v4, "text");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[RFTextProperty initWithProtobuf:](v7, "initWithProtobuf:", v8);
      -[RFFactItemButtonCardSection setText_1:](v5, "setText_1:", v9);

    }
    objc_msgSend(v4, "button");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [SFButtonItem alloc];
      objc_msgSend(v4, "button");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[SFButtonItem initWithProtobuf:](v11, "initWithProtobuf:", v12);
      -[RFFactItemButtonCardSection setButton_1:](v5, "setButton_1:", v13);

    }
    objc_msgSend(v4, "button");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = [SFButtonItem alloc];
      objc_msgSend(v4, "button");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[SFButtonItem initWithProtobuf:](v15, "initWithProtobuf:", v16);
      -[RFFactItemButtonCardSection setButton_2:](v5, "setButton_2:", v17);

    }
    objc_msgSend(v4, "button");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v19 = [SFButtonItem alloc];
      objc_msgSend(v4, "button");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[SFButtonItem initWithProtobuf:](v19, "initWithProtobuf:", v20);
      -[RFFactItemButtonCardSection setButton_3:](v5, "setButton_3:", v21);

    }
    objc_msgSend(v4, "text");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      v23 = [RFTextProperty alloc];
      objc_msgSend(v4, "text");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[RFTextProperty initWithProtobuf:](v23, "initWithProtobuf:", v24);
      -[RFFactItemButtonCardSection setText_2:](v5, "setText_2:", v25);

    }
    objc_msgSend(v4, "text");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      v27 = [RFTextProperty alloc];
      objc_msgSend(v4, "text");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = -[RFTextProperty initWithProtobuf:](v27, "initWithProtobuf:", v28);
      -[RFFactItemButtonCardSection setText_3:](v5, "setText_3:", v29);

    }
    objc_msgSend(v4, "text_4s");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
      v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v31 = 0;

    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    objc_msgSend(v4, "text_4s", 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v34; ++i)
        {
          if (*(_QWORD *)v53 != v35)
            objc_enumerationMutation(v32);
          v37 = -[RFTextProperty initWithProtobuf:]([RFTextProperty alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i));
          if (v37)
            objc_msgSend(v31, "addObject:", v37);

        }
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
      }
      while (v34);
    }

    -[RFFactItemButtonCardSection setText_4:](v5, "setText_4:", v31);
    objc_msgSend(v4, "text");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      v39 = [RFTextProperty alloc];
      objc_msgSend(v4, "text");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = -[RFTextProperty initWithProtobuf:](v39, "initWithProtobuf:", v40);
      -[RFFactItemButtonCardSection setText_5:](v5, "setText_5:", v41);

    }
    objc_msgSend(v4, "thumbnail");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42)
    {
      v43 = [RFVisualProperty alloc];
      objc_msgSend(v4, "thumbnail");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = -[RFVisualProperty initWithProtobuf:](v43, "initWithProtobuf:", v44);
      -[RFFactItemButtonCardSection setThumbnail:](v5, "setThumbnail:", v45);

    }
    objc_msgSend(v4, "thumbnail2");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (v46)
    {
      v47 = [RFVisualProperty alloc];
      objc_msgSend(v4, "thumbnail2");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = -[RFVisualProperty initWithProtobuf:](v47, "initWithProtobuf:", v48);
      -[RFFactItemButtonCardSection setThumbnail2:](v5, "setThumbnail2:", v49);

    }
    if (objc_msgSend(v4, "buttonItemsAreBottom"))
      -[RFFactItemButtonCardSection setButtonItemsAreBottom:](v5, "setButtonItemsAreBottom:", objc_msgSend(v4, "buttonItemsAreBottom"));
    v50 = v5;

  }
  return v5;
}

@end
