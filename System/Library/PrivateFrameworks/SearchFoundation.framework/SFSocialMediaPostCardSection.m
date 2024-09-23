@implementation SFSocialMediaPostCardSection

- (void)setNameNoWrap:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_nameNoWrap = a3;
}

- (BOOL)hasNameNoWrap
{
  return *(_BYTE *)&self->_has & 1;
}

- (SFSocialMediaPostCardSection)initWithCoder:(id)a3
{
  id v4;
  SFSocialMediaPostCardSection *v5;
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
    -[SFSocialMediaPostCardSection setType:](v5, "setType:", v12);

    -[SFCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", -[SFCardSection separatorStyle](v8, "separatorStyle"));
    -[SFCardSection backgroundColor](v8, "backgroundColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setBackgroundColor:](v5, "setBackgroundColor:", v13);

    -[SFCardSection name](v8, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSocialMediaPostCardSection setName:](v5, "setName:", v14);

    -[SFSocialMediaPostCardSection setNameNoWrap:](v5, "setNameNoWrap:", -[SFCardSection nameNoWrap](v8, "nameNoWrap"));
    -[SFCardSection nameMaxLines](v8, "nameMaxLines");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSocialMediaPostCardSection setNameMaxLines:](v5, "setNameMaxLines:", v15);

    -[SFCardSection handle](v8, "handle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSocialMediaPostCardSection setHandle:](v5, "setHandle:", v16);

    -[SFCardSection verifiedGlyph](v8, "verifiedGlyph");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSocialMediaPostCardSection setVerifiedGlyph:](v5, "setVerifiedGlyph:", v17);

    -[SFCardSection profilePicture](v8, "profilePicture");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSocialMediaPostCardSection setProfilePicture:](v5, "setProfilePicture:", v18);

    -[SFCardSection post](v8, "post");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSocialMediaPostCardSection setPost:](v5, "setPost:", v19);

    -[SFCardSection picture](v8, "picture");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSocialMediaPostCardSection setPicture:](v5, "setPicture:", v20);

    -[SFCardSection timestamp](v8, "timestamp");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSocialMediaPostCardSection setTimestamp:](v5, "setTimestamp:", v21);

    -[SFCardSection footnote](v8, "footnote");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSocialMediaPostCardSection setFootnote:](v5, "setFootnote:", v22);

    -[SFCardSection nextCard](v8, "nextCard");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setNextCard:](v5, "setNextCard:", v23);

    -[SFCardSection commands](v8, "commands");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCommands:](v5, "setCommands:", v24);

    -[SFCardSection parameterKeyPaths](v8, "parameterKeyPaths");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setParameterKeyPaths:](v5, "setParameterKeyPaths:", v25);

    -[SFCardSection cardSectionId](v8, "cardSectionId");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCardSectionId:](v5, "setCardSectionId:", v26);

    -[SFCardSection resultIdentifier](v8, "resultIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setResultIdentifier:](v5, "setResultIdentifier:", v27);

    -[SFCardSection userReportRequest](v8, "userReportRequest");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setUserReportRequest:](v5, "setUserReportRequest:", v28);

    -[SFCardSection command](v8, "command");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCommand:](v5, "setCommand:", v29);

    -[SFCardSection previewCommand](v8, "previewCommand");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewCommand:](v5, "setPreviewCommand:", v30);

    -[SFCardSection previewButtonItems](v8, "previewButtonItems");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewButtonItems:](v5, "setPreviewButtonItems:", v31);

    -[SFCardSection cardSectionDetail](v8, "cardSectionDetail");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCardSectionDetail:](v5, "setCardSectionDetail:", v32);

    -[SFCardSection previewButtonItemsTitle](v8, "previewButtonItemsTitle");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewButtonItemsTitle:](v5, "setPreviewButtonItemsTitle:", v33);

    -[SFCardSection backgroundColor](v8, "backgroundColor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setBackgroundColor:](v5, "setBackgroundColor:", v34);

    -[SFCardSection setShouldHideInAmbientMode:](v5, "setShouldHideInAmbientMode:", -[SFCardSection shouldHideInAmbientMode](v8, "shouldHideInAmbientMode"));
    -[SFCardSection leadingSwipeButtonItems](v8, "leadingSwipeButtonItems");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setLeadingSwipeButtonItems:](v5, "setLeadingSwipeButtonItems:", v35);

    -[SFCardSection trailingSwipeButtonItems](v8, "trailingSwipeButtonItems");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setTrailingSwipeButtonItems:](v5, "setTrailingSwipeButtonItems:", v36);

    -[SFCardSection punchoutOptions](v8, "punchoutOptions");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutOptions:](v5, "setPunchoutOptions:", v37);

    -[SFCardSection punchoutPickerTitle](v8, "punchoutPickerTitle");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerTitle:](v5, "setPunchoutPickerTitle:", v38);

    -[SFCardSection punchoutPickerDismissText](v8, "punchoutPickerDismissText");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerDismissText:](v5, "setPunchoutPickerDismissText:", v39);

    -[SFCardSection setCanBeHidden:](v5, "setCanBeHidden:", -[SFCardSection canBeHidden](v8, "canBeHidden"));
    -[SFCardSection setHasTopPadding:](v5, "setHasTopPadding:", -[SFCardSection hasTopPadding](v8, "hasTopPadding"));
    -[SFCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", -[SFCardSection hasBottomPadding](v8, "hasBottomPadding"));
    -[SFCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", -[SFCardSection separatorStyle](v8, "separatorStyle"));
    -[SFCardSection referencedCommands](v8, "referencedCommands");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setReferencedCommands:](v5, "setReferencedCommands:", v40);

    -[SFCardSection setForceEnable3DTouch:](v5, "setForceEnable3DTouch:", -[SFCardSection forceEnable3DTouch](v8, "forceEnable3DTouch"));
    -[SFCardSection setShouldShowInSmartDialog:](v5, "setShouldShowInSmartDialog:", -[SFCardSection shouldShowInSmartDialog](v8, "shouldShowInSmartDialog"));
    -[SFCardSection appEntityAnnotation](v8, "appEntityAnnotation");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setAppEntityAnnotation:](v5, "setAppEntityAnnotation:", v41);

    -[SFCardSection emphasisSubjectId](v8, "emphasisSubjectId");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setEmphasisSubjectId:](v5, "setEmphasisSubjectId:", v42);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFSocialMediaPostCardSection;
  -[SFCardSection encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBSocialMediaPostCardSection *v2;
  void *v3;

  v2 = -[_SFPBSocialMediaPostCardSection initWithFacade:]([_SFPBSocialMediaPostCardSection alloc], "initWithFacade:", self);
  -[_SFPBSocialMediaPostCardSection dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBSocialMediaPostCardSection *v2;
  void *v3;

  v2 = -[_SFPBSocialMediaPostCardSection initWithFacade:]([_SFPBSocialMediaPostCardSection alloc], "initWithFacade:", self);
  -[_SFPBSocialMediaPostCardSection jsonData](v2, "jsonData");
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
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)SFSocialMediaPostCardSection;
  v4 = -[SFCardSection copyWithZone:](&v34, sel_copyWithZone_, a3);
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
  -[SFSocialMediaPostCardSection type](self, "type");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setType:", v12);

  objc_msgSend(v4, "setSeparatorStyle:", -[SFCardSection separatorStyle](self, "separatorStyle"));
  -[SFCardSection backgroundColor](self, "backgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setBackgroundColor:", v14);

  -[SFSocialMediaPostCardSection name](self, "name");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v4, "setName:", v16);

  objc_msgSend(v4, "setNameNoWrap:", -[SFSocialMediaPostCardSection nameNoWrap](self, "nameNoWrap"));
  -[SFSocialMediaPostCardSection nameMaxLines](self, "nameMaxLines");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");
  objc_msgSend(v4, "setNameMaxLines:", v18);

  -[SFSocialMediaPostCardSection handle](self, "handle");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");
  objc_msgSend(v4, "setHandle:", v20);

  -[SFSocialMediaPostCardSection verifiedGlyph](self, "verifiedGlyph");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "copy");
  objc_msgSend(v4, "setVerifiedGlyph:", v22);

  -[SFSocialMediaPostCardSection profilePicture](self, "profilePicture");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v23, "copy");
  objc_msgSend(v4, "setProfilePicture:", v24);

  -[SFSocialMediaPostCardSection post](self, "post");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v25, "copy");
  objc_msgSend(v4, "setPost:", v26);

  -[SFSocialMediaPostCardSection picture](self, "picture");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v27, "copy");
  objc_msgSend(v4, "setPicture:", v28);

  -[SFSocialMediaPostCardSection timestamp](self, "timestamp");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v29, "copy");
  objc_msgSend(v4, "setTimestamp:", v30);

  -[SFSocialMediaPostCardSection footnote](self, "footnote");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v31, "copy");
  objc_msgSend(v4, "setFootnote:", v32);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  SFSocialMediaPostCardSection *v6;
  SFSocialMediaPostCardSection *v7;
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
  SFSocialMediaPostCardSection *v27;
  void *v28;
  uint64_t v29;
  _BOOL4 v30;
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
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  SFSocialMediaPostCardSection *v49;
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
  int v114;
  int v115;
  int v116;
  int v117;
  int v118;
  int v119;
  int v120;
  int v121;
  int v122;
  int v123;
  _BYTE v124[12];
  int v125;
  int v126;
  uint64_t v127;
  __int128 v128;
  uint64_t v129;
  uint64_t v130;
  _BYTE v131[12];
  int v132;
  int v133;
  id v134;
  id v135;
  _BOOL4 v136;
  _BOOL4 v137;
  _BOOL4 v138;
  _BOOL4 v139;
  __int128 v140;
  objc_super v141;

  v6 = (SFSocialMediaPostCardSection *)a3;
  if (self == v6)
  {
    v17 = 1;
    goto LABEL_99;
  }
  if (!-[SFSocialMediaPostCardSection isMemberOfClass:](v6, "isMemberOfClass:", objc_opt_class())
    || (v141.receiver = self,
        v141.super_class = (Class)SFSocialMediaPostCardSection,
        !-[SFCardSection isEqual:](&v141, sel_isEqual_, v6)))
  {
    v17 = 0;
    goto LABEL_99;
  }
  v7 = v6;
  -[SFCardSection punchoutOptions](self, "punchoutOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8 == 0;
  -[SFCardSection punchoutOptions](v7, "punchoutOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10 != 0;
  v134 = v10;
  v135 = v8;
  v132 = v11;
  v133 = v9;
  if ((_DWORD)v9 == (_DWORD)v11)
  {
    v130 = 0;
    v140 = 0uLL;
    v127 = 0;
    v128 = 0uLL;
    memset(v131, 0, sizeof(v131));
    memset(v124, 0, sizeof(v124));
    v121 = 0;
    v125 = 0;
    v117 = 0;
    v123 = 0;
    v139 = 0;
    v115 = 0;
    v119 = 0;
    v138 = 0;
    v114 = 0;
    v118 = 0;
    v137 = 0;
    v116 = 0;
    v122 = 0;
    v136 = 0;
    v120 = 0;
    v129 = 0;
    v126 = 0;
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
    v113 = (void *)v3;
    if (!v3
      || (-[SFCardSection punchoutOptions](self, "punchoutOptions"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          -[SFCardSection punchoutOptions](v7, "punchoutOptions"),
          v109 = (void *)objc_claimAutoreleasedReturnValue(),
          v110 = v12,
          objc_msgSend(v12, "isEqual:")))
    {
      -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCardSection punchoutPickerTitle](v7, "punchoutPickerTitle");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)&v131[8] = v3 != 0;
      if ((v112 == 0) == (v111 != 0))
      {
        v130 = 0x100000000;
        v140 = 0uLL;
        v127 = 0;
        *(_QWORD *)v131 = 0;
        v128 = 0uLL;
        memset(v124, 0, sizeof(v124));
        v121 = 0;
        v125 = 0;
        v117 = 0;
        v123 = 0;
        v139 = 0;
        v115 = 0;
        v119 = 0;
        v138 = 0;
        v114 = 0;
        v118 = 0;
        v137 = 0;
        v116 = 0;
        v122 = 0;
        v136 = 0;
        v120 = 0;
        v129 = 0;
        v126 = 0;
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v17 = 0;
      }
      else
      {
        -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
        v18 = objc_claimAutoreleasedReturnValue();
        HIDWORD(v140) = v18 != 0;
        v108 = (void *)v18;
        if (!v18
          || (-[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle"),
              v19 = (void *)objc_claimAutoreleasedReturnValue(),
              -[SFCardSection punchoutPickerTitle](v7, "punchoutPickerTitle"),
              v104 = (void *)objc_claimAutoreleasedReturnValue(),
              v105 = v19,
              objc_msgSend(v19, "isEqual:")))
        {
          -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFCardSection punchoutPickerDismissText](v7, "punchoutPickerDismissText");
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          if ((v107 == 0) != (v106 != 0))
          {
            -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
            v24 = objc_claimAutoreleasedReturnValue();
            v25 = v24 != 0;
            v103 = (void *)v24;
            if (v24)
            {
              -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
              v26 = objc_claimAutoreleasedReturnValue();
              v27 = v7;
              v28 = (void *)v26;
              v49 = v27;
              -[SFCardSection punchoutPickerDismissText](v27, "punchoutPickerDismissText");
              v101 = (void *)objc_claimAutoreleasedReturnValue();
              v102 = v28;
              if (!objc_msgSend(v28, "isEqual:"))
              {
                *(_QWORD *)((char *)&v128 + 4) = 0;
                *(_QWORD *)v131 = 0x100000000;
                v127 = 0x100000000;
                LODWORD(v128) = 0;
                *(_QWORD *)((char *)&v140 + 4) = 0;
                memset(v124, 0, sizeof(v124));
                v121 = 0;
                v125 = 0;
                LODWORD(v140) = 0;
                v117 = 0;
                v123 = 0;
                v139 = 0;
                v115 = 0;
                v119 = 0;
                v138 = 0;
                v114 = 0;
                v118 = 0;
                v137 = 0;
                v116 = 0;
                v122 = 0;
                v136 = 0;
                v120 = 0;
                v129 = 0;
                v126 = 0;
                v13 = 0;
                v14 = 0;
                v15 = 0;
                v16 = 0;
                v17 = 0;
                v130 = 0x100000001;
                HIDWORD(v128) = 1;
                v7 = v49;
                goto LABEL_16;
              }
              v7 = v49;
            }
            v3 = -[SFCardSection canBeHidden](self, "canBeHidden");
            *(_DWORD *)&v131[4] = v25;
            if ((_DWORD)v3 == -[SFCardSection canBeHidden](v7, "canBeHidden")
              && (v3 = -[SFCardSection hasTopPadding](self, "hasTopPadding"),
                  (_DWORD)v3 == -[SFCardSection hasTopPadding](v7, "hasTopPadding"))
              && (v3 = -[SFCardSection hasBottomPadding](self, "hasBottomPadding"),
                  (_DWORD)v3 == -[SFCardSection hasBottomPadding](v7, "hasBottomPadding")))
            {
              -[SFSocialMediaPostCardSection type](self, "type");
              v100 = (void *)objc_claimAutoreleasedReturnValue();
              -[SFSocialMediaPostCardSection type](v7, "type");
              v99 = (void *)objc_claimAutoreleasedReturnValue();
              if ((v100 == 0) == (v99 != 0))
              {
                *(_QWORD *)&v128 = 0;
                *(_DWORD *)v131 = 0;
                v127 = 0x100000000;
                *(_QWORD *)((char *)&v140 + 4) = 0;
                memset(v124, 0, sizeof(v124));
                v121 = 0;
                v125 = 0;
                LODWORD(v140) = 0;
                v117 = 0;
                v123 = 0;
                v139 = 0;
                v115 = 0;
                v119 = 0;
                v138 = 0;
                v114 = 0;
                v118 = 0;
                v137 = 0;
                v116 = 0;
                v122 = 0;
                v136 = 0;
                v120 = 0;
                v129 = 0;
                v126 = 0;
                v13 = 0;
                v14 = 0;
                v15 = 0;
                v16 = 0;
                v17 = 0;
                v130 = 0x100000001;
                *((_QWORD *)&v128 + 1) = 0x100000001;
              }
              else
              {
                -[SFSocialMediaPostCardSection type](self, "type");
                v29 = objc_claimAutoreleasedReturnValue();
                v30 = v29 != 0;
                v98 = (void *)v29;
                if (!v29
                  || (-[SFSocialMediaPostCardSection type](self, "type"),
                      v3 = objc_claimAutoreleasedReturnValue(),
                      -[SFSocialMediaPostCardSection type](v7, "type"),
                      v96 = (void *)objc_claimAutoreleasedReturnValue(),
                      v97 = (void *)v3,
                      objc_msgSend((id)v3, "isEqual:")))
                {
                  *(_DWORD *)v131 = v30;
                  v3 = -[SFCardSection separatorStyle](self, "separatorStyle");
                  if ((_DWORD)v3 == -[SFCardSection separatorStyle](v7, "separatorStyle"))
                  {
                    -[SFCardSection backgroundColor](self, "backgroundColor");
                    v95 = (void *)objc_claimAutoreleasedReturnValue();
                    -[SFCardSection backgroundColor](v7, "backgroundColor");
                    v94 = (void *)objc_claimAutoreleasedReturnValue();
                    if ((v95 == 0) == (v94 != 0))
                    {
                      *(_QWORD *)&v128 = 0x100000000;
                      *(_QWORD *)((char *)&v140 + 4) = 0;
                      memset(v124, 0, sizeof(v124));
                      v121 = 0;
                      v125 = 0;
                      LODWORD(v140) = 0;
                      v117 = 0;
                      v123 = 0;
                      v139 = 0;
                      v115 = 0;
                      v119 = 0;
                      v138 = 0;
                      v114 = 0;
                      v118 = 0;
                      v137 = 0;
                      v116 = 0;
                      v122 = 0;
                      v136 = 0;
                      v120 = 0;
                      v129 = 0;
                      v13 = 0;
                      v14 = 0;
                      v15 = 0;
                      v16 = 0;
                      v17 = 0;
                      v130 = 0x100000001;
                      *((_QWORD *)&v128 + 1) = 0x100000001;
                      v126 = 0;
                      v127 = 0x100000001;
                    }
                    else
                    {
                      -[SFCardSection backgroundColor](self, "backgroundColor");
                      v31 = objc_claimAutoreleasedReturnValue();
                      DWORD2(v140) = v31 != 0;
                      v93 = (void *)v31;
                      if (!v31
                        || (-[SFCardSection backgroundColor](self, "backgroundColor"),
                            v32 = (void *)objc_claimAutoreleasedReturnValue(),
                            -[SFCardSection backgroundColor](v7, "backgroundColor"),
                            v89 = (void *)objc_claimAutoreleasedReturnValue(),
                            v90 = v32,
                            objc_msgSend(v32, "isEqual:")))
                      {
                        -[SFSocialMediaPostCardSection name](self, "name");
                        v92 = (void *)objc_claimAutoreleasedReturnValue();
                        -[SFSocialMediaPostCardSection name](v7, "name");
                        v91 = (void *)objc_claimAutoreleasedReturnValue();
                        if ((v92 == 0) == (v91 != 0))
                        {
                          *(_DWORD *)v124 = 0;
                          *(_QWORD *)&v140 = 0;
                          v121 = 0;
                          v125 = 0;
                          v117 = 0;
                          v123 = 0;
                          v139 = 0;
                          v115 = 0;
                          v119 = 0;
                          v138 = 0;
                          v114 = 0;
                          v118 = 0;
                          v137 = 0;
                          v116 = 0;
                          v122 = 0;
                          v136 = 0;
                          v120 = 0;
                          v129 = 0;
                          v13 = 0;
                          v14 = 0;
                          v15 = 0;
                          v16 = 0;
                          v17 = 0;
                          v130 = 0x100000001;
                          *((_QWORD *)&v128 + 1) = 0x100000001;
                          *(_QWORD *)&v128 = 0x100000001;
                          v126 = 0;
                          v127 = 0x100000001;
                          *(_QWORD *)&v124[4] = 1;
                        }
                        else
                        {
                          -[SFSocialMediaPostCardSection name](self, "name");
                          v33 = objc_claimAutoreleasedReturnValue();
                          DWORD1(v140) = v33 != 0;
                          v88 = (void *)v33;
                          if (!v33
                            || (-[SFSocialMediaPostCardSection name](self, "name"),
                                v34 = (void *)objc_claimAutoreleasedReturnValue(),
                                -[SFSocialMediaPostCardSection name](v7, "name"),
                                v86 = (void *)objc_claimAutoreleasedReturnValue(),
                                v87 = v34,
                                objc_msgSend(v34, "isEqual:")))
                          {
                            v3 = -[SFSocialMediaPostCardSection nameNoWrap](self, "nameNoWrap");
                            if ((_DWORD)v3 == -[SFSocialMediaPostCardSection nameNoWrap](v7, "nameNoWrap"))
                            {
                              -[SFSocialMediaPostCardSection nameMaxLines](self, "nameMaxLines");
                              v85 = (void *)objc_claimAutoreleasedReturnValue();
                              -[SFSocialMediaPostCardSection nameMaxLines](v7, "nameMaxLines");
                              v84 = (void *)objc_claimAutoreleasedReturnValue();
                              if ((v85 == 0) == (v84 != 0))
                              {
                                v125 = 0;
                                LODWORD(v140) = 0;
                                v117 = 0;
                                v123 = 0;
                                v139 = 0;
                                v115 = 0;
                                v119 = 0;
                                v138 = 0;
                                v114 = 0;
                                v118 = 0;
                                v137 = 0;
                                v116 = 0;
                                v122 = 0;
                                v136 = 0;
                                v120 = 0;
                                v129 = 0;
                                v13 = 0;
                                v14 = 0;
                                v15 = 0;
                                v16 = 0;
                                v17 = 0;
                                v130 = 0x100000001;
                                *((_QWORD *)&v128 + 1) = 0x100000001;
                                *(_QWORD *)&v128 = 0x100000001;
                                v126 = 0;
                                v127 = 0x100000001;
                                *(_DWORD *)&v124[8] = 0;
                                *(_QWORD *)v124 = 0x100000001;
                                v121 = 1;
                              }
                              else
                              {
                                -[SFSocialMediaPostCardSection nameMaxLines](self, "nameMaxLines");
                                v35 = objc_claimAutoreleasedReturnValue();
                                LODWORD(v140) = v35 != 0;
                                v83 = (void *)v35;
                                if (!v35
                                  || (-[SFSocialMediaPostCardSection nameMaxLines](self, "nameMaxLines"),
                                      v36 = (void *)objc_claimAutoreleasedReturnValue(),
                                      -[SFSocialMediaPostCardSection nameMaxLines](v7, "nameMaxLines"),
                                      v79 = (void *)objc_claimAutoreleasedReturnValue(),
                                      v80 = v36,
                                      objc_msgSend(v36, "isEqual:")))
                                {
                                  -[SFSocialMediaPostCardSection handle](self, "handle");
                                  v82 = (void *)objc_claimAutoreleasedReturnValue();
                                  -[SFSocialMediaPostCardSection handle](v7, "handle");
                                  v81 = (void *)objc_claimAutoreleasedReturnValue();
                                  if ((v82 == 0) == (v81 != 0))
                                  {
                                    v123 = 0;
                                    v139 = 0;
                                    v115 = 0;
                                    v119 = 0;
                                    v138 = 0;
                                    v114 = 0;
                                    v118 = 0;
                                    v137 = 0;
                                    v116 = 0;
                                    v122 = 0;
                                    v136 = 0;
                                    v129 = 0;
                                    v13 = 0;
                                    v14 = 0;
                                    v15 = 0;
                                    v16 = 0;
                                    v17 = 0;
                                    v130 = 0x100000001;
                                    *((_QWORD *)&v128 + 1) = 0x100000001;
                                    *(_QWORD *)&v128 = 0x100000001;
                                    v126 = 0;
                                    v127 = 0x100000001;
                                    *(_DWORD *)&v124[8] = 0;
                                    *(_QWORD *)v124 = 0x100000001;
                                    v120 = 0;
                                    v121 = 1;
                                    v125 = 1;
                                    v117 = 1;
                                  }
                                  else
                                  {
                                    -[SFSocialMediaPostCardSection handle](self, "handle");
                                    v37 = objc_claimAutoreleasedReturnValue();
                                    v139 = v37 != 0;
                                    v78 = (void *)v37;
                                    if (!v37
                                      || (-[SFSocialMediaPostCardSection handle](self, "handle"),
                                          v38 = (void *)objc_claimAutoreleasedReturnValue(),
                                          -[SFSocialMediaPostCardSection handle](v7, "handle"),
                                          v74 = (void *)objc_claimAutoreleasedReturnValue(),
                                          v75 = v38,
                                          objc_msgSend(v38, "isEqual:")))
                                    {
                                      -[SFSocialMediaPostCardSection verifiedGlyph](self, "verifiedGlyph");
                                      v77 = (void *)objc_claimAutoreleasedReturnValue();
                                      -[SFSocialMediaPostCardSection verifiedGlyph](v7, "verifiedGlyph");
                                      v76 = (void *)objc_claimAutoreleasedReturnValue();
                                      if ((v77 == 0) == (v76 != 0))
                                      {
                                        v119 = 0;
                                        v138 = 0;
                                        v114 = 0;
                                        v118 = 0;
                                        v137 = 0;
                                        v116 = 0;
                                        v122 = 0;
                                        v136 = 0;
                                        v129 = 0;
                                        v13 = 0;
                                        v14 = 0;
                                        v15 = 0;
                                        v16 = 0;
                                        v17 = 0;
                                        v130 = 0x100000001;
                                        *((_QWORD *)&v128 + 1) = 0x100000001;
                                        *(_QWORD *)&v128 = 0x100000001;
                                        v126 = 0;
                                        v127 = 0x100000001;
                                        *(_DWORD *)&v124[8] = 0;
                                        *(_QWORD *)v124 = 0x100000001;
                                        v120 = 0;
                                        v121 = 1;
                                        v125 = 1;
                                        v117 = 1;
                                        v123 = 1;
                                        v115 = 1;
                                      }
                                      else
                                      {
                                        -[SFSocialMediaPostCardSection verifiedGlyph](self, "verifiedGlyph");
                                        v39 = objc_claimAutoreleasedReturnValue();
                                        v138 = v39 != 0;
                                        v73 = (void *)v39;
                                        if (!v39
                                          || (-[SFSocialMediaPostCardSection verifiedGlyph](self, "verifiedGlyph"),
                                              v40 = (void *)objc_claimAutoreleasedReturnValue(),
                                              -[SFSocialMediaPostCardSection verifiedGlyph](v7, "verifiedGlyph"),
                                              v69 = (void *)objc_claimAutoreleasedReturnValue(),
                                              v70 = v40,
                                              objc_msgSend(v40, "isEqual:")))
                                        {
                                          -[SFSocialMediaPostCardSection profilePicture](self, "profilePicture");
                                          v72 = (void *)objc_claimAutoreleasedReturnValue();
                                          -[SFSocialMediaPostCardSection profilePicture](v7, "profilePicture");
                                          v71 = (void *)objc_claimAutoreleasedReturnValue();
                                          if ((v72 == 0) == (v71 != 0))
                                          {
                                            v118 = 0;
                                            v137 = 0;
                                            v116 = 0;
                                            v122 = 0;
                                            v136 = 0;
                                            v129 = 0;
                                            v13 = 0;
                                            v14 = 0;
                                            v15 = 0;
                                            v16 = 0;
                                            v17 = 0;
                                            v130 = 0x100000001;
                                            *((_QWORD *)&v128 + 1) = 0x100000001;
                                            *(_QWORD *)&v128 = 0x100000001;
                                            v126 = 0;
                                            v127 = 0x100000001;
                                            *(_DWORD *)&v124[8] = 0;
                                            *(_QWORD *)v124 = 0x100000001;
                                            v120 = 0;
                                            v121 = 1;
                                            v125 = 1;
                                            v117 = 1;
                                            v123 = 1;
                                            v115 = 1;
                                            v119 = 1;
                                            v114 = 1;
                                          }
                                          else
                                          {
                                            -[SFSocialMediaPostCardSection profilePicture](self, "profilePicture");
                                            v41 = objc_claimAutoreleasedReturnValue();
                                            v137 = v41 != 0;
                                            v68 = (void *)v41;
                                            if (!v41
                                              || (-[SFSocialMediaPostCardSection profilePicture](self, "profilePicture"),
                                                  v42 = (void *)objc_claimAutoreleasedReturnValue(),
                                                  -[SFSocialMediaPostCardSection profilePicture](v7, "profilePicture"),
                                                  v64 = (void *)objc_claimAutoreleasedReturnValue(),
                                                  v65 = v42,
                                                  objc_msgSend(v42, "isEqual:")))
                                            {
                                              -[SFSocialMediaPostCardSection post](self, "post");
                                              v67 = (void *)objc_claimAutoreleasedReturnValue();
                                              -[SFSocialMediaPostCardSection post](v7, "post");
                                              v66 = (void *)objc_claimAutoreleasedReturnValue();
                                              if ((v67 == 0) == (v66 != 0))
                                              {
                                                v122 = 0;
                                                v136 = 0;
                                                v129 = 0;
                                                v13 = 0;
                                                v14 = 0;
                                                v15 = 0;
                                                v16 = 0;
                                                v17 = 0;
                                                v130 = 0x100000001;
                                                *((_QWORD *)&v128 + 1) = 0x100000001;
                                                *(_QWORD *)&v128 = 0x100000001;
                                                v126 = 0;
                                                v127 = 0x100000001;
                                                *(_DWORD *)&v124[8] = 0;
                                                *(_QWORD *)v124 = 0x100000001;
                                                v120 = 0;
                                                v121 = 1;
                                                v125 = 1;
                                                v117 = 1;
                                                v123 = 1;
                                                v115 = 1;
                                                v119 = 1;
                                                v114 = 1;
                                                v118 = 1;
                                                v116 = 1;
                                              }
                                              else
                                              {
                                                -[SFSocialMediaPostCardSection post](self, "post");
                                                v43 = objc_claimAutoreleasedReturnValue();
                                                v136 = v43 != 0;
                                                v63 = (void *)v43;
                                                if (!v43
                                                  || (-[SFSocialMediaPostCardSection post](self, "post"),
                                                      v44 = (void *)objc_claimAutoreleasedReturnValue(),
                                                      -[SFSocialMediaPostCardSection post](v7, "post"),
                                                      v61 = (void *)objc_claimAutoreleasedReturnValue(),
                                                      v62 = v44,
                                                      objc_msgSend(v44, "isEqual:")))
                                                {
                                                  -[SFSocialMediaPostCardSection picture](self, "picture");
                                                  v60 = (void *)objc_claimAutoreleasedReturnValue();
                                                  -[SFSocialMediaPostCardSection picture](v7, "picture");
                                                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                                                  if ((v60 == 0) == (v59 != 0))
                                                  {
                                                    v129 = 0;
                                                    v13 = 0;
                                                    v14 = 0;
                                                    v15 = 0;
                                                    v16 = 0;
                                                    v17 = 0;
                                                    v130 = 0x100000001;
                                                    *((_QWORD *)&v128 + 1) = 0x100000001;
                                                    *(_QWORD *)&v128 = 0x100000001;
                                                    v126 = 0;
                                                    v127 = 0x100000001;
                                                    *(_DWORD *)&v124[8] = 0;
                                                    *(_QWORD *)v124 = 0x100000001;
                                                    v121 = 1;
                                                    v125 = 1;
                                                    v117 = 1;
                                                    v123 = 1;
                                                    v115 = 1;
                                                    v119 = 1;
                                                    v114 = 1;
                                                    v118 = 1;
                                                    v116 = 1;
                                                    v122 = 1;
                                                    v120 = 1;
                                                  }
                                                  else
                                                  {
                                                    -[SFSocialMediaPostCardSection picture](self, "picture");
                                                    v45 = objc_claimAutoreleasedReturnValue();
                                                    HIDWORD(v129) = v45 != 0;
                                                    v58 = (void *)v45;
                                                    if (!v45
                                                      || (-[SFSocialMediaPostCardSection picture](self, "picture"),
                                                          v46 = (void *)objc_claimAutoreleasedReturnValue(),
                                                          -[SFSocialMediaPostCardSection picture](v7, "picture"),
                                                          v56 = (void *)objc_claimAutoreleasedReturnValue(),
                                                          v57 = v46,
                                                          objc_msgSend(v46, "isEqual:")))
                                                    {
                                                      -[SFSocialMediaPostCardSection timestamp](self, "timestamp");
                                                      v55 = (void *)objc_claimAutoreleasedReturnValue();
                                                      -[SFSocialMediaPostCardSection timestamp](v7, "timestamp");
                                                      v54 = (void *)objc_claimAutoreleasedReturnValue();
                                                      if ((v55 == 0) == (v54 != 0))
                                                      {
                                                        v13 = 0;
                                                        v14 = 0;
                                                        v15 = 0;
                                                        v16 = 0;
                                                        v17 = 0;
                                                        v130 = 0x100000001;
                                                        HIDWORD(v128) = 1;
                                                        LODWORD(v129) = 0;
                                                        v127 = 0x100000001;
                                                        *(_QWORD *)((char *)&v128 + 4) = 0x100000001;
                                                        LODWORD(v128) = 1;
                                                        *(_QWORD *)v124 = 0x100000001;
                                                        v121 = 1;
                                                        v125 = 1;
                                                        v117 = 1;
                                                        v123 = 1;
                                                        v115 = 1;
                                                        v119 = 1;
                                                        v114 = 1;
                                                        v118 = 1;
                                                        v116 = 1;
                                                        v122 = 1;
                                                        v120 = 1;
                                                        *(_DWORD *)&v124[8] = 1;
                                                        v126 = 1;
                                                      }
                                                      else
                                                      {
                                                        -[SFSocialMediaPostCardSection timestamp](self, "timestamp");
                                                        v47 = objc_claimAutoreleasedReturnValue();
                                                        LODWORD(v129) = v47 != 0;
                                                        v51 = (void *)v47;
                                                        if (!v47
                                                          || (-[SFSocialMediaPostCardSection timestamp](self, "timestamp"), v48 = (void *)objc_claimAutoreleasedReturnValue(), -[SFSocialMediaPostCardSection timestamp](v7, "timestamp"), v52 = (void *)objc_claimAutoreleasedReturnValue(), v53 = v48, objc_msgSend(v48, "isEqual:")))
                                                        {
                                                          -[SFSocialMediaPostCardSection footnote](self, "footnote");
                                                          v50 = (void *)objc_claimAutoreleasedReturnValue();
                                                          -[SFSocialMediaPostCardSection footnote](v7, "footnote");
                                                          v9 = objc_claimAutoreleasedReturnValue();
                                                          if ((v50 == 0) == (v9 != 0))
                                                          {
                                                            v15 = 0;
                                                            v16 = 0;
                                                            v17 = 0;
                                                            v130 = 0x100000001;
                                                            *((_QWORD *)&v128 + 1) = 0x100000001;
                                                            v127 = 0x100000001;
                                                            *(_QWORD *)&v128 = 0x100000001;
                                                            *(_QWORD *)v124 = 0x100000001;
                                                            v121 = 1;
                                                            v125 = 1;
                                                            v117 = 1;
                                                            v123 = 1;
                                                            v115 = 1;
                                                            v119 = 1;
                                                            v114 = 1;
                                                            v118 = 1;
                                                            v116 = 1;
                                                            v122 = 1;
                                                            v120 = 1;
                                                            *(_DWORD *)&v124[8] = 1;
                                                            v126 = 1;
                                                            v13 = 1;
                                                            v14 = 1;
                                                          }
                                                          else
                                                          {
                                                            -[SFSocialMediaPostCardSection footnote](self, "footnote");
                                                            v11 = objc_claimAutoreleasedReturnValue();
                                                            if (v11)
                                                            {
                                                              -[SFSocialMediaPostCardSection footnote](self, "footnote");
                                                              v4 = objc_claimAutoreleasedReturnValue();
                                                              -[SFSocialMediaPostCardSection footnote](v7, "footnote");
                                                              v3 = objc_claimAutoreleasedReturnValue();
                                                              v17 = objc_msgSend((id)v4, "isEqual:", v3);
                                                              v16 = 1;
                                                              v130 = 0x100000001;
                                                              *((_QWORD *)&v128 + 1) = 0x100000001;
                                                              v127 = 0x100000001;
                                                              *(_QWORD *)&v128 = 0x100000001;
                                                              *(_QWORD *)v124 = 0x100000001;
                                                              v121 = 1;
                                                              v125 = 1;
                                                              v117 = 1;
                                                              v123 = 1;
                                                              v115 = 1;
                                                              v119 = 1;
                                                              v114 = 1;
                                                              v118 = 1;
                                                              v116 = 1;
                                                              v122 = 1;
                                                              v120 = 1;
                                                              *(_DWORD *)&v124[8] = 1;
                                                              v126 = 1;
                                                              v13 = 1;
                                                              v14 = 1;
                                                              v15 = 1;
                                                            }
                                                            else
                                                            {
                                                              v16 = 0;
                                                              v130 = 0x100000001;
                                                              *((_QWORD *)&v128 + 1) = 0x100000001;
                                                              v127 = 0x100000001;
                                                              *(_QWORD *)&v128 = 0x100000001;
                                                              *(_QWORD *)v124 = 0x100000001;
                                                              v121 = 1;
                                                              v125 = 1;
                                                              v117 = 1;
                                                              v123 = 1;
                                                              v115 = 1;
                                                              v119 = 1;
                                                              v114 = 1;
                                                              v118 = 1;
                                                              v116 = 1;
                                                              v122 = 1;
                                                              v120 = 1;
                                                              *(_DWORD *)&v124[8] = 1;
                                                              v126 = 1;
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
                                                          v130 = 0x100000001;
                                                          *((_QWORD *)&v128 + 1) = 0x100000001;
                                                          v127 = 0x100000001;
                                                          *(_QWORD *)&v128 = 0x100000001;
                                                          *(_QWORD *)v124 = 0x100000001;
                                                          v121 = 1;
                                                          v125 = 1;
                                                          v117 = 1;
                                                          v123 = 1;
                                                          v115 = 1;
                                                          v119 = 1;
                                                          v114 = 1;
                                                          v118 = 1;
                                                          v116 = 1;
                                                          v122 = 1;
                                                          v120 = 1;
                                                          *(_DWORD *)&v124[8] = 1;
                                                          v126 = 1;
                                                          v13 = 1;
                                                          LODWORD(v129) = 1;
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
                                                      v130 = 0x100000001;
                                                      HIDWORD(v128) = 1;
                                                      v129 = 0x100000000;
                                                      LODWORD(v128) = 1;
                                                      *(_QWORD *)((char *)&v128 + 4) = 0x100000001;
                                                      v126 = 0;
                                                      v127 = 0x100000001;
                                                      *(_QWORD *)v124 = 0x100000001;
                                                      v121 = 1;
                                                      v125 = 1;
                                                      v117 = 1;
                                                      v123 = 1;
                                                      v115 = 1;
                                                      v119 = 1;
                                                      v114 = 1;
                                                      v118 = 1;
                                                      v116 = 1;
                                                      v122 = 1;
                                                      v120 = 1;
                                                      *(_DWORD *)&v124[8] = 1;
                                                    }
                                                  }
                                                }
                                                else
                                                {
                                                  v129 = 0;
                                                  v13 = 0;
                                                  v14 = 0;
                                                  v15 = 0;
                                                  v16 = 0;
                                                  v17 = 0;
                                                  v130 = 0x100000001;
                                                  *((_QWORD *)&v128 + 1) = 0x100000001;
                                                  *(_QWORD *)&v128 = 0x100000001;
                                                  v126 = 0;
                                                  v127 = 0x100000001;
                                                  *(_DWORD *)&v124[8] = 0;
                                                  *(_QWORD *)v124 = 0x100000001;
                                                  v120 = 0;
                                                  v121 = 1;
                                                  v125 = 1;
                                                  v117 = 1;
                                                  v123 = 1;
                                                  v115 = 1;
                                                  v119 = 1;
                                                  v114 = 1;
                                                  v118 = 1;
                                                  v116 = 1;
                                                  v122 = 1;
                                                  v136 = 1;
                                                }
                                              }
                                            }
                                            else
                                            {
                                              v116 = 0;
                                              v122 = 0;
                                              v136 = 0;
                                              v129 = 0;
                                              v13 = 0;
                                              v14 = 0;
                                              v15 = 0;
                                              v16 = 0;
                                              v17 = 0;
                                              v130 = 0x100000001;
                                              *((_QWORD *)&v128 + 1) = 0x100000001;
                                              *(_QWORD *)&v128 = 0x100000001;
                                              v126 = 0;
                                              v127 = 0x100000001;
                                              *(_DWORD *)&v124[8] = 0;
                                              *(_QWORD *)v124 = 0x100000001;
                                              v120 = 0;
                                              v121 = 1;
                                              v125 = 1;
                                              v117 = 1;
                                              v123 = 1;
                                              v115 = 1;
                                              v119 = 1;
                                              v114 = 1;
                                              v118 = 1;
                                              v137 = 1;
                                            }
                                          }
                                        }
                                        else
                                        {
                                          v114 = 0;
                                          v118 = 0;
                                          v137 = 0;
                                          v116 = 0;
                                          v122 = 0;
                                          v136 = 0;
                                          v129 = 0;
                                          v13 = 0;
                                          v14 = 0;
                                          v15 = 0;
                                          v16 = 0;
                                          v17 = 0;
                                          v130 = 0x100000001;
                                          *((_QWORD *)&v128 + 1) = 0x100000001;
                                          *(_QWORD *)&v128 = 0x100000001;
                                          v126 = 0;
                                          v127 = 0x100000001;
                                          *(_DWORD *)&v124[8] = 0;
                                          *(_QWORD *)v124 = 0x100000001;
                                          v120 = 0;
                                          v121 = 1;
                                          v125 = 1;
                                          v117 = 1;
                                          v123 = 1;
                                          v115 = 1;
                                          v119 = 1;
                                          v138 = 1;
                                        }
                                      }
                                    }
                                    else
                                    {
                                      v115 = 0;
                                      v119 = 0;
                                      v138 = 0;
                                      v114 = 0;
                                      v118 = 0;
                                      v137 = 0;
                                      v116 = 0;
                                      v122 = 0;
                                      v136 = 0;
                                      v129 = 0;
                                      v13 = 0;
                                      v14 = 0;
                                      v15 = 0;
                                      v16 = 0;
                                      v17 = 0;
                                      v130 = 0x100000001;
                                      *((_QWORD *)&v128 + 1) = 0x100000001;
                                      *(_QWORD *)&v128 = 0x100000001;
                                      v126 = 0;
                                      v127 = 0x100000001;
                                      *(_DWORD *)&v124[8] = 0;
                                      *(_QWORD *)v124 = 0x100000001;
                                      v120 = 0;
                                      v121 = 1;
                                      v125 = 1;
                                      v117 = 1;
                                      v123 = 1;
                                      v139 = 1;
                                    }
                                  }
                                }
                                else
                                {
                                  v117 = 0;
                                  v123 = 0;
                                  v139 = 0;
                                  v115 = 0;
                                  v119 = 0;
                                  v138 = 0;
                                  v114 = 0;
                                  v118 = 0;
                                  v137 = 0;
                                  v116 = 0;
                                  v122 = 0;
                                  v136 = 0;
                                  v129 = 0;
                                  v13 = 0;
                                  v14 = 0;
                                  v15 = 0;
                                  v16 = 0;
                                  v17 = 0;
                                  v130 = 0x100000001;
                                  *((_QWORD *)&v128 + 1) = 0x100000001;
                                  *(_QWORD *)&v128 = 0x100000001;
                                  v126 = 0;
                                  v127 = 0x100000001;
                                  *(_DWORD *)&v124[8] = 0;
                                  *(_QWORD *)v124 = 0x100000001;
                                  v120 = 0;
                                  v121 = 1;
                                  v125 = 1;
                                  LODWORD(v140) = 1;
                                }
                              }
                            }
                            else
                            {
                              v121 = 0;
                              v125 = 0;
                              LODWORD(v140) = 0;
                              v117 = 0;
                              v123 = 0;
                              v139 = 0;
                              v115 = 0;
                              v119 = 0;
                              v138 = 0;
                              v114 = 0;
                              v118 = 0;
                              v137 = 0;
                              v116 = 0;
                              v122 = 0;
                              v136 = 0;
                              v120 = 0;
                              v129 = 0;
                              v13 = 0;
                              v14 = 0;
                              v15 = 0;
                              v16 = 0;
                              v17 = 0;
                              v130 = 0x100000001;
                              *((_QWORD *)&v128 + 1) = 0x100000001;
                              *(_QWORD *)&v128 = 0x100000001;
                              v126 = 0;
                              v127 = 0x100000001;
                              *(_DWORD *)&v124[8] = 0;
                              *(_QWORD *)v124 = 0x100000001;
                            }
                          }
                          else
                          {
                            v121 = 0;
                            v125 = 0;
                            *(_QWORD *)&v140 = 0x100000000;
                            v117 = 0;
                            v123 = 0;
                            v139 = 0;
                            v115 = 0;
                            v119 = 0;
                            v138 = 0;
                            v114 = 0;
                            v118 = 0;
                            v137 = 0;
                            v116 = 0;
                            v122 = 0;
                            v136 = 0;
                            v120 = 0;
                            v129 = 0;
                            v13 = 0;
                            v14 = 0;
                            v15 = 0;
                            v16 = 0;
                            v17 = 0;
                            v130 = 0x100000001;
                            *((_QWORD *)&v128 + 1) = 0x100000001;
                            *(_QWORD *)&v128 = 0x100000001;
                            v126 = 0;
                            v127 = 0x100000001;
                            *(_DWORD *)&v124[8] = 0;
                            *(_QWORD *)v124 = 0x100000001;
                          }
                        }
                      }
                      else
                      {
                        memset(v124, 0, sizeof(v124));
                        *(_QWORD *)&v140 = 0;
                        v121 = 0;
                        v125 = 0;
                        v117 = 0;
                        v123 = 0;
                        v139 = 0;
                        v115 = 0;
                        v119 = 0;
                        v138 = 0;
                        v114 = 0;
                        v118 = 0;
                        v137 = 0;
                        v116 = 0;
                        v122 = 0;
                        v136 = 0;
                        v120 = 0;
                        v129 = 0;
                        v13 = 0;
                        v14 = 0;
                        v15 = 0;
                        v16 = 0;
                        v17 = 0;
                        v130 = 0x100000001;
                        *((_QWORD *)&v128 + 1) = 0x100000001;
                        *(_QWORD *)&v128 = 0x100000001;
                        v126 = 0;
                        v127 = 0x100000001;
                        DWORD2(v140) = 1;
                      }
                    }
                  }
                  else
                  {
                    v127 = 0x100000000;
                    *(_QWORD *)&v128 = 0x100000000;
                    *(_QWORD *)((char *)&v140 + 4) = 0;
                    memset(v124, 0, sizeof(v124));
                    v121 = 0;
                    v125 = 0;
                    LODWORD(v140) = 0;
                    v117 = 0;
                    v123 = 0;
                    v139 = 0;
                    v115 = 0;
                    v119 = 0;
                    v138 = 0;
                    v114 = 0;
                    v118 = 0;
                    v137 = 0;
                    v116 = 0;
                    v122 = 0;
                    v136 = 0;
                    v120 = 0;
                    v129 = 0;
                    v126 = 0;
                    v13 = 0;
                    v14 = 0;
                    v15 = 0;
                    v16 = 0;
                    v17 = 0;
                    v130 = 0x100000001;
                    *((_QWORD *)&v128 + 1) = 0x100000001;
                  }
                }
                else
                {
                  v127 = 0x100000000;
                  *(_QWORD *)&v128 = 0x100000000;
                  *(_QWORD *)((char *)&v140 + 4) = 0;
                  memset(v124, 0, sizeof(v124));
                  v121 = 0;
                  v125 = 0;
                  LODWORD(v140) = 0;
                  v117 = 0;
                  v123 = 0;
                  v139 = 0;
                  v115 = 0;
                  v119 = 0;
                  v138 = 0;
                  v114 = 0;
                  v118 = 0;
                  v137 = 0;
                  v116 = 0;
                  v122 = 0;
                  v136 = 0;
                  v120 = 0;
                  v129 = 0;
                  v126 = 0;
                  v13 = 0;
                  v14 = 0;
                  v15 = 0;
                  v16 = 0;
                  v17 = 0;
                  v130 = 0x100000001;
                  *((_QWORD *)&v128 + 1) = 0x100000001;
                  *(_DWORD *)v131 = 1;
                }
              }
            }
            else
            {
              *(_QWORD *)((char *)&v128 + 4) = 0;
              *(_DWORD *)v131 = 0;
              v127 = 0x100000000;
              LODWORD(v128) = 0;
              *(_QWORD *)((char *)&v140 + 4) = 0;
              memset(v124, 0, sizeof(v124));
              v121 = 0;
              v125 = 0;
              LODWORD(v140) = 0;
              v117 = 0;
              v123 = 0;
              v139 = 0;
              v115 = 0;
              v119 = 0;
              v138 = 0;
              v114 = 0;
              v118 = 0;
              v137 = 0;
              v116 = 0;
              v122 = 0;
              v136 = 0;
              v120 = 0;
              v129 = 0;
              v126 = 0;
              v13 = 0;
              v14 = 0;
              v15 = 0;
              v16 = 0;
              v17 = 0;
              v130 = 0x100000001;
              HIDWORD(v128) = 1;
            }
            goto LABEL_16;
          }
          v127 = 0;
          *(_QWORD *)v131 = 0;
          *(_QWORD *)((char *)&v128 + 4) = 0;
          LODWORD(v128) = 0;
          *(_QWORD *)((char *)&v140 + 4) = 0;
          memset(v124, 0, sizeof(v124));
          v121 = 0;
          v125 = 0;
          LODWORD(v140) = 0;
          v117 = 0;
          v123 = 0;
          v139 = 0;
          v115 = 0;
          v119 = 0;
          v138 = 0;
          v114 = 0;
          v118 = 0;
          v137 = 0;
          v116 = 0;
          v122 = 0;
          v136 = 0;
          v120 = 0;
          v129 = 0;
          v126 = 0;
          v13 = 0;
          v14 = 0;
          v15 = 0;
          v16 = 0;
          v17 = 0;
          v130 = 0x100000001;
          HIDWORD(v128) = 1;
        }
        else
        {
          v127 = 0;
          *(_QWORD *)v131 = 0;
          v128 = 0uLL;
          *(_QWORD *)((char *)&v140 + 4) = 0;
          memset(v124, 0, sizeof(v124));
          v121 = 0;
          v125 = 0;
          LODWORD(v140) = 0;
          v117 = 0;
          v123 = 0;
          v139 = 0;
          v115 = 0;
          v119 = 0;
          v138 = 0;
          v114 = 0;
          v118 = 0;
          v137 = 0;
          v116 = 0;
          v122 = 0;
          v136 = 0;
          v120 = 0;
          v129 = 0;
          v126 = 0;
          v13 = 0;
          v14 = 0;
          v15 = 0;
          v16 = 0;
          v17 = 0;
          v130 = 0x100000001;
          HIDWORD(v140) = 1;
        }
      }
    }
    else
    {
      v130 = 0;
      v140 = 0uLL;
      v127 = 0;
      *(_QWORD *)v131 = 0;
      v128 = 0uLL;
      memset(v124, 0, sizeof(v124));
      v121 = 0;
      v125 = 0;
      v117 = 0;
      v123 = 0;
      v139 = 0;
      v115 = 0;
      v119 = 0;
      v138 = 0;
      v114 = 0;
      v118 = 0;
      v137 = 0;
      v116 = 0;
      v122 = 0;
      v136 = 0;
      v120 = 0;
      v129 = 0;
      v126 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      *(_DWORD *)&v131[8] = 1;
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
  if ((_DWORD)v129)
  {

  }
  if (v13)

  if (v126)
  {

  }
  if (HIDWORD(v129))
  {

  }
  if (*(_DWORD *)&v124[8])

  if (v120)
  {

  }
  if (v136)
  {

  }
  if (v122)

  if (v116)
  {

  }
  if (v137)
  {

  }
  if (v118)

  if (v114)
  {

  }
  if (v138)
  {

  }
  if (v119)

  if (v115)
  {

  }
  if (v139)
  {

  }
  if (v123)

  if (v117)
  {

  }
  if ((_DWORD)v140)
  {

  }
  if (v125)

  if (v121)
  {

  }
  if (DWORD1(v140))
  {

  }
  if (*(_DWORD *)v124)

  if (*(_DWORD *)&v124[4])
  {

  }
  if (DWORD2(v140))
  {

  }
  if ((_DWORD)v128)

  if ((_DWORD)v127)
  {

  }
  if (*(_DWORD *)v131)
  {

  }
  if (DWORD1(v128))

  if (DWORD2(v128))
  {

  }
  if (*(_DWORD *)&v131[4])
  {

  }
  if (HIDWORD(v127))

  if (HIDWORD(v128))
  {

  }
  if (HIDWORD(v140))
  {

  }
  if ((_DWORD)v130)

  if (HIDWORD(v130))
  {

  }
  if (*(_DWORD *)&v131[8])
  {

  }
  if (v133 != v132)

LABEL_99:
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
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  unint64_t v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  objc_super v38;

  v38.receiver = self;
  v38.super_class = (Class)SFSocialMediaPostCardSection;
  v3 = -[SFCardSection hash](&v38, sel_hash);
  -[SFCardSection punchoutOptions](self, "punchoutOptions");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v37, "hash");
  -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 ^ objc_msgSend(v36, "hash");
  -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 ^ objc_msgSend(v35, "hash");
  v7 = v6 ^ -[SFCardSection canBeHidden](self, "canBeHidden");
  v8 = v7 ^ -[SFCardSection hasTopPadding](self, "hasTopPadding") ^ v3;
  v9 = -[SFCardSection hasBottomPadding](self, "hasBottomPadding");
  -[SFSocialMediaPostCardSection type](self, "type");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9 ^ objc_msgSend(v34, "hash");
  v11 = v10 ^ -[SFCardSection separatorStyle](self, "separatorStyle");
  -[SFCardSection backgroundColor](self, "backgroundColor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11 ^ objc_msgSend(v33, "hash");
  -[SFSocialMediaPostCardSection name](self, "name");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v8 ^ v12 ^ objc_msgSend(v32, "hash");
  v14 = -[SFSocialMediaPostCardSection nameNoWrap](self, "nameNoWrap");
  -[SFSocialMediaPostCardSection nameMaxLines](self, "nameMaxLines");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v14 ^ objc_msgSend(v15, "hash");
  -[SFSocialMediaPostCardSection handle](self, "handle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v16 ^ objc_msgSend(v17, "hash");
  -[SFSocialMediaPostCardSection verifiedGlyph](self, "verifiedGlyph");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v18 ^ objc_msgSend(v19, "hash");
  -[SFSocialMediaPostCardSection profilePicture](self, "profilePicture");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v20 ^ objc_msgSend(v21, "hash");
  -[SFSocialMediaPostCardSection post](self, "post");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v13 ^ v22 ^ objc_msgSend(v23, "hash");
  -[SFSocialMediaPostCardSection picture](self, "picture");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "hash");
  -[SFSocialMediaPostCardSection timestamp](self, "timestamp");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v26 ^ objc_msgSend(v27, "hash");
  -[SFSocialMediaPostCardSection footnote](self, "footnote");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v24 ^ v28 ^ objc_msgSend(v29, "hash");

  return v30;
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (BOOL)nameNoWrap
{
  return self->_nameNoWrap;
}

- (NSNumber)nameMaxLines
{
  return self->_nameMaxLines;
}

- (void)setNameMaxLines:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (NSString)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (SFImage)verifiedGlyph
{
  return self->_verifiedGlyph;
}

- (void)setVerifiedGlyph:(id)a3
{
  objc_storeStrong((id *)&self->_verifiedGlyph, a3);
}

- (SFImage)profilePicture
{
  return self->_profilePicture;
}

- (void)setProfilePicture:(id)a3
{
  objc_storeStrong((id *)&self->_profilePicture, a3);
}

- (SFRichText)post
{
  return self->_post;
}

- (void)setPost:(id)a3
{
  objc_storeStrong((id *)&self->_post, a3);
}

- (SFImage)picture
{
  return self->_picture;
}

- (void)setPicture:(id)a3
{
  objc_storeStrong((id *)&self->_picture, a3);
}

- (NSString)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (NSString)footnote
{
  return self->_footnote;
}

- (void)setFootnote:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footnote, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_picture, 0);
  objc_storeStrong((id *)&self->_post, 0);
  objc_storeStrong((id *)&self->_profilePicture, 0);
  objc_storeStrong((id *)&self->_verifiedGlyph, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_nameMaxLines, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFSocialMediaPostCardSection)initWithProtobuf:(id)a3
{
  id v4;
  SFSocialMediaPostCardSection *v5;
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
  SFImage *v30;
  void *v31;
  SFImage *v32;
  void *v33;
  SFImage *v34;
  void *v35;
  SFImage *v36;
  void *v37;
  SFRichText *v38;
  void *v39;
  SFRichText *v40;
  void *v41;
  SFImage *v42;
  void *v43;
  SFImage *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  SFSocialMediaPostCardSection *v49;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  objc_super v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v55.receiver = self;
  v55.super_class = (Class)SFSocialMediaPostCardSection;
  v5 = -[SFCardSection init](&v55, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "punchoutOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v7 = 0;

    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    objc_msgSend(v4, "punchoutOptions", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v52 != v11)
            objc_enumerationMutation(v8);
          v13 = -[SFPunchout initWithProtobuf:]([SFPunchout alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i));
          if (v13)
            objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
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
      -[SFSocialMediaPostCardSection setType:](v5, "setType:", v19);

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
    objc_msgSend(v4, "name");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v4, "name");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFSocialMediaPostCardSection setName:](v5, "setName:", v25);

    }
    if (objc_msgSend(v4, "nameNoWrap"))
      -[SFSocialMediaPostCardSection setNameNoWrap:](v5, "setNameNoWrap:", objc_msgSend(v4, "nameNoWrap"));
    if (objc_msgSend(v4, "nameMaxLines"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "nameMaxLines"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFSocialMediaPostCardSection setNameMaxLines:](v5, "setNameMaxLines:", v26);

    }
    objc_msgSend(v4, "handle");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      objc_msgSend(v4, "handle");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFSocialMediaPostCardSection setHandle:](v5, "setHandle:", v28);

    }
    objc_msgSend(v4, "verifiedGlyph");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      v30 = [SFImage alloc];
      objc_msgSend(v4, "verifiedGlyph");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = -[SFImage initWithProtobuf:](v30, "initWithProtobuf:", v31);
      -[SFSocialMediaPostCardSection setVerifiedGlyph:](v5, "setVerifiedGlyph:", v32);

    }
    objc_msgSend(v4, "profilePicture");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      v34 = [SFImage alloc];
      objc_msgSend(v4, "profilePicture");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = -[SFImage initWithProtobuf:](v34, "initWithProtobuf:", v35);
      -[SFSocialMediaPostCardSection setProfilePicture:](v5, "setProfilePicture:", v36);

    }
    objc_msgSend(v4, "post");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
    {
      v38 = [SFRichText alloc];
      objc_msgSend(v4, "post");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = -[SFRichText initWithProtobuf:](v38, "initWithProtobuf:", v39);
      -[SFSocialMediaPostCardSection setPost:](v5, "setPost:", v40);

    }
    objc_msgSend(v4, "picture");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (v41)
    {
      v42 = [SFImage alloc];
      objc_msgSend(v4, "picture");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = -[SFImage initWithProtobuf:](v42, "initWithProtobuf:", v43);
      -[SFSocialMediaPostCardSection setPicture:](v5, "setPicture:", v44);

    }
    objc_msgSend(v4, "timestamp");
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    if (v45)
    {
      objc_msgSend(v4, "timestamp");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFSocialMediaPostCardSection setTimestamp:](v5, "setTimestamp:", v46);

    }
    objc_msgSend(v4, "footnote");
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    if (v47)
    {
      objc_msgSend(v4, "footnote");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFSocialMediaPostCardSection setFootnote:](v5, "setFootnote:", v48);

    }
    v49 = v5;

  }
  return v5;
}

@end
