@implementation SFMetaInfoCardSection

- (SFMetaInfoCardSection)initWithProtobuf:(id)a3
{
  id v4;
  SFMetaInfoCardSection *v5;
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
  SFMetaInfoCardSection *v34;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  objc_super v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)SFMetaInfoCardSection;
  v5 = -[SFCardSection init](&v40, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "punchoutOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v7 = 0;

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    objc_msgSend(v4, "punchoutOptions", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v37 != v11)
            objc_enumerationMutation(v8);
          v13 = -[SFPunchout initWithProtobuf:]([SFPunchout alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i));
          if (v13)
            objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
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
      -[SFMetaInfoCardSection setType:](v5, "setType:", v19);

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
    if (objc_msgSend(v4, "trending"))
      -[SFMetaInfoCardSection setTrending:](v5, "setTrending:", objc_msgSend(v4, "trending"));
    objc_msgSend(v4, "contentURL");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v4, "contentURL");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      _SFPBURLHandwrittenTranslator(v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFMetaInfoCardSection setContentURL:](v5, "setContentURL:", v26);

    }
    objc_msgSend(v4, "hostPageURL");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      objc_msgSend(v4, "hostPageURL");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      _SFPBURLHandwrittenTranslator(v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFMetaInfoCardSection setHostPageURL:](v5, "setHostPageURL:", v29);

    }
    objc_msgSend(v4, "badge");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      v31 = [SFImage alloc];
      objc_msgSend(v4, "badge");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = -[SFImage initWithProtobuf:](v31, "initWithProtobuf:", v32);
      -[SFMetaInfoCardSection setBadge:](v5, "setBadge:", v33);

    }
    v34 = v5;

  }
  return v5;
}

- (void)setTrending:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_trending = a3;
}

- (BOOL)hasTrending
{
  return *(_BYTE *)&self->_has & 1;
}

- (SFMetaInfoCardSection)initWithCoder:(id)a3
{
  id v4;
  SFMetaInfoCardSection *v5;
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
    -[SFMetaInfoCardSection setType:](v5, "setType:", v12);

    -[SFCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", -[SFCardSection separatorStyle](v8, "separatorStyle"));
    -[SFCardSection backgroundColor](v8, "backgroundColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setBackgroundColor:](v5, "setBackgroundColor:", v13);

    -[SFMetaInfoCardSection setTrending:](v5, "setTrending:", -[SFCardSection trending](v8, "trending"));
    -[SFCardSection contentURL](v8, "contentURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFMetaInfoCardSection setContentURL:](v5, "setContentURL:", v14);

    -[SFCardSection hostPageURL](v8, "hostPageURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFMetaInfoCardSection setHostPageURL:](v5, "setHostPageURL:", v15);

    -[SFCardSection badge](v8, "badge");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFMetaInfoCardSection setBadge:](v5, "setBadge:", v16);

    -[SFCardSection nextCard](v8, "nextCard");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setNextCard:](v5, "setNextCard:", v17);

    -[SFCardSection commands](v8, "commands");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCommands:](v5, "setCommands:", v18);

    -[SFCardSection parameterKeyPaths](v8, "parameterKeyPaths");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setParameterKeyPaths:](v5, "setParameterKeyPaths:", v19);

    -[SFCardSection cardSectionId](v8, "cardSectionId");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCardSectionId:](v5, "setCardSectionId:", v20);

    -[SFCardSection resultIdentifier](v8, "resultIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setResultIdentifier:](v5, "setResultIdentifier:", v21);

    -[SFCardSection userReportRequest](v8, "userReportRequest");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setUserReportRequest:](v5, "setUserReportRequest:", v22);

    -[SFCardSection command](v8, "command");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCommand:](v5, "setCommand:", v23);

    -[SFCardSection previewCommand](v8, "previewCommand");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewCommand:](v5, "setPreviewCommand:", v24);

    -[SFCardSection previewButtonItems](v8, "previewButtonItems");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewButtonItems:](v5, "setPreviewButtonItems:", v25);

    -[SFCardSection cardSectionDetail](v8, "cardSectionDetail");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCardSectionDetail:](v5, "setCardSectionDetail:", v26);

    -[SFCardSection previewButtonItemsTitle](v8, "previewButtonItemsTitle");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewButtonItemsTitle:](v5, "setPreviewButtonItemsTitle:", v27);

    -[SFCardSection backgroundColor](v8, "backgroundColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setBackgroundColor:](v5, "setBackgroundColor:", v28);

    -[SFCardSection setShouldHideInAmbientMode:](v5, "setShouldHideInAmbientMode:", -[SFCardSection shouldHideInAmbientMode](v8, "shouldHideInAmbientMode"));
    -[SFCardSection leadingSwipeButtonItems](v8, "leadingSwipeButtonItems");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setLeadingSwipeButtonItems:](v5, "setLeadingSwipeButtonItems:", v29);

    -[SFCardSection trailingSwipeButtonItems](v8, "trailingSwipeButtonItems");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setTrailingSwipeButtonItems:](v5, "setTrailingSwipeButtonItems:", v30);

    -[SFCardSection punchoutOptions](v8, "punchoutOptions");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutOptions:](v5, "setPunchoutOptions:", v31);

    -[SFCardSection punchoutPickerTitle](v8, "punchoutPickerTitle");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerTitle:](v5, "setPunchoutPickerTitle:", v32);

    -[SFCardSection punchoutPickerDismissText](v8, "punchoutPickerDismissText");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerDismissText:](v5, "setPunchoutPickerDismissText:", v33);

    -[SFCardSection setCanBeHidden:](v5, "setCanBeHidden:", -[SFCardSection canBeHidden](v8, "canBeHidden"));
    -[SFCardSection setHasTopPadding:](v5, "setHasTopPadding:", -[SFCardSection hasTopPadding](v8, "hasTopPadding"));
    -[SFCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", -[SFCardSection hasBottomPadding](v8, "hasBottomPadding"));
    -[SFCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", -[SFCardSection separatorStyle](v8, "separatorStyle"));
    -[SFCardSection referencedCommands](v8, "referencedCommands");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setReferencedCommands:](v5, "setReferencedCommands:", v34);

    -[SFCardSection setForceEnable3DTouch:](v5, "setForceEnable3DTouch:", -[SFCardSection forceEnable3DTouch](v8, "forceEnable3DTouch"));
    -[SFCardSection setShouldShowInSmartDialog:](v5, "setShouldShowInSmartDialog:", -[SFCardSection shouldShowInSmartDialog](v8, "shouldShowInSmartDialog"));
    -[SFCardSection appEntityAnnotation](v8, "appEntityAnnotation");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setAppEntityAnnotation:](v5, "setAppEntityAnnotation:", v35);

    -[SFCardSection emphasisSubjectId](v8, "emphasisSubjectId");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setEmphasisSubjectId:](v5, "setEmphasisSubjectId:", v36);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFMetaInfoCardSection;
  -[SFCardSection encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBMetaInfoCardSection *v2;
  void *v3;

  v2 = -[_SFPBMetaInfoCardSection initWithFacade:]([_SFPBMetaInfoCardSection alloc], "initWithFacade:", self);
  -[_SFPBMetaInfoCardSection dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBMetaInfoCardSection *v2;
  void *v3;

  v2 = -[_SFPBMetaInfoCardSection initWithFacade:]([_SFPBMetaInfoCardSection alloc], "initWithFacade:", self);
  -[_SFPBMetaInfoCardSection jsonData](v2, "jsonData");
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
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)SFMetaInfoCardSection;
  v4 = -[SFCardSection copyWithZone:](&v22, sel_copyWithZone_, a3);
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
  -[SFMetaInfoCardSection type](self, "type");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setType:", v12);

  objc_msgSend(v4, "setSeparatorStyle:", -[SFCardSection separatorStyle](self, "separatorStyle"));
  -[SFCardSection backgroundColor](self, "backgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setBackgroundColor:", v14);

  objc_msgSend(v4, "setTrending:", -[SFMetaInfoCardSection trending](self, "trending"));
  -[SFMetaInfoCardSection contentURL](self, "contentURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v4, "setContentURL:", v16);

  -[SFMetaInfoCardSection hostPageURL](self, "hostPageURL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");
  objc_msgSend(v4, "setHostPageURL:", v18);

  -[SFMetaInfoCardSection badge](self, "badge");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");
  objc_msgSend(v4, "setBadge:", v20);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SFMetaInfoCardSection *v4;
  SFMetaInfoCardSection *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _BOOL4 v22;
  _BOOL4 v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  _BOOL4 v31;
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
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  objc_super v68;

  v4 = (SFMetaInfoCardSection *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    if (-[SFMetaInfoCardSection isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
    {
      v68.receiver = self;
      v68.super_class = (Class)SFMetaInfoCardSection;
      if (-[SFCardSection isEqual:](&v68, sel_isEqual_, v4))
      {
        v5 = v4;
        -[SFCardSection punchoutOptions](self, "punchoutOptions");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFCardSection punchoutOptions](v5, "punchoutOptions");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v6 == 0) == (v7 != 0))
        {
          v11 = 0;
LABEL_27:

          goto LABEL_28;
        }
        -[SFCardSection punchoutOptions](self, "punchoutOptions");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          -[SFCardSection punchoutOptions](self, "punchoutOptions");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFCardSection punchoutOptions](v5, "punchoutOptions");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v9, "isEqual:", v10))
          {
            v11 = 0;
LABEL_25:

            goto LABEL_26;
          }
          v66 = v10;
          v67 = v9;
        }
        -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFCardSection punchoutPickerTitle](v5, "punchoutPickerTitle");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v12 == 0) == (v13 != 0))
          goto LABEL_23;
        -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFCardSection punchoutPickerTitle](v5, "punchoutPickerTitle");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = v15;
          if (!objc_msgSend(v15, "isEqual:", v63))
            goto LABEL_21;
        }
        v65 = v14;
        -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFCardSection punchoutPickerDismissText](v5, "punchoutPickerDismissText");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v16 == 0) == (v17 != 0))
        {

          if (!v14)
          {
LABEL_22:

LABEL_23:
            v11 = 0;
            if (!v8)
            {
LABEL_26:

              goto LABEL_27;
            }
            goto LABEL_24;
          }
LABEL_21:

          goto LABEL_22;
        }
        v60 = v16;
        v61 = v17;
        -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        if (v62)
        {
          -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
          v18 = objc_claimAutoreleasedReturnValue();
          -[SFCardSection punchoutPickerDismissText](v5, "punchoutPickerDismissText");
          v19 = objc_claimAutoreleasedReturnValue();
          v59 = (void *)v18;
          v20 = (void *)v18;
          v16 = (void *)v19;
          if (!objc_msgSend(v20, "isEqual:", v19))
          {
LABEL_39:

LABEL_40:
            if (!v14)
              goto LABEL_22;
            goto LABEL_21;
          }
        }
        v22 = -[SFCardSection canBeHidden](self, "canBeHidden");
        if (v22 == -[SFCardSection canBeHidden](v5, "canBeHidden"))
        {
          v23 = -[SFCardSection hasTopPadding](self, "hasTopPadding");
          if (v23 == -[SFCardSection hasTopPadding](v5, "hasTopPadding"))
          {
            v24 = -[SFCardSection hasBottomPadding](self, "hasBottomPadding");
            if (v24 == -[SFCardSection hasBottomPadding](v5, "hasBottomPadding"))
            {
              -[SFMetaInfoCardSection type](self, "type");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              -[SFMetaInfoCardSection type](v5, "type");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              if ((v25 == 0) != (v26 != 0))
              {
                v56 = v26;
                v57 = v25;
                -[SFMetaInfoCardSection type](self, "type");
                v14 = v65;
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                if (v58)
                {
                  -[SFMetaInfoCardSection type](self, "type");
                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SFMetaInfoCardSection type](v5, "type");
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!objc_msgSend(v55, "isEqual:"))
                    goto LABEL_59;
                }
                v27 = -[SFCardSection separatorStyle](self, "separatorStyle");
                if (v27 == -[SFCardSection separatorStyle](v5, "separatorStyle"))
                {
                  -[SFCardSection backgroundColor](self, "backgroundColor");
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SFCardSection backgroundColor](v5, "backgroundColor");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  if ((v53 == 0) != (v28 != 0))
                  {
                    v51 = v16;
                    v52 = v28;
                    -[SFCardSection backgroundColor](self, "backgroundColor");
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v29)
                    {
                      -[SFCardSection backgroundColor](self, "backgroundColor");
                      v30 = (void *)objc_claimAutoreleasedReturnValue();
                      -[SFCardSection backgroundColor](v5, "backgroundColor");
                      v49 = (void *)objc_claimAutoreleasedReturnValue();
                      v50 = v30;
                      if (!objc_msgSend(v30, "isEqual:"))
                        goto LABEL_56;
                    }
                    v31 = -[SFMetaInfoCardSection trending](self, "trending");
                    if (v31 == -[SFMetaInfoCardSection trending](v5, "trending"))
                    {
                      -[SFMetaInfoCardSection contentURL](self, "contentURL");
                      v48 = (void *)objc_claimAutoreleasedReturnValue();
                      -[SFMetaInfoCardSection contentURL](v5, "contentURL");
                      v47 = (void *)objc_claimAutoreleasedReturnValue();
                      if ((v48 == 0) != (v47 != 0))
                      {
                        -[SFMetaInfoCardSection contentURL](self, "contentURL");
                        v46 = (void *)objc_claimAutoreleasedReturnValue();
                        if (v46)
                        {
                          -[SFMetaInfoCardSection contentURL](self, "contentURL");
                          v32 = (void *)objc_claimAutoreleasedReturnValue();
                          -[SFMetaInfoCardSection contentURL](v5, "contentURL");
                          v42 = (void *)objc_claimAutoreleasedReturnValue();
                          v43 = v32;
                          if (!objc_msgSend(v32, "isEqual:"))
                          {
                            v11 = 0;
LABEL_75:

LABEL_76:
                            if (v29)
                            {

                            }
                            if (v58)
                            {

                            }
                            if (v62)
                            {

                            }
                            if (v65)
                            {

                            }
                            if (!v8)
                              goto LABEL_26;
LABEL_24:
                            v10 = v66;
                            v9 = v67;
                            goto LABEL_25;
                          }
                        }
                        -[SFMetaInfoCardSection hostPageURL](self, "hostPageURL");
                        v45 = (void *)objc_claimAutoreleasedReturnValue();
                        -[SFMetaInfoCardSection hostPageURL](v5, "hostPageURL");
                        v44 = (void *)objc_claimAutoreleasedReturnValue();
                        if ((v45 == 0) == (v44 != 0))
                        {

                          v11 = 0;
                          goto LABEL_74;
                        }
                        -[SFMetaInfoCardSection hostPageURL](self, "hostPageURL");
                        v41 = (void *)objc_claimAutoreleasedReturnValue();
                        if (!v41
                          || (-[SFMetaInfoCardSection hostPageURL](self, "hostPageURL"),
                              v33 = (void *)objc_claimAutoreleasedReturnValue(),
                              -[SFMetaInfoCardSection hostPageURL](v5, "hostPageURL"),
                              v39 = (void *)objc_claimAutoreleasedReturnValue(),
                              v40 = v33,
                              objc_msgSend(v33, "isEqual:")))
                        {
                          -[SFMetaInfoCardSection badge](self, "badge");
                          v38 = (void *)objc_claimAutoreleasedReturnValue();
                          -[SFMetaInfoCardSection badge](v5, "badge");
                          v37 = (void *)objc_claimAutoreleasedReturnValue();
                          if ((v38 == 0) == (v37 != 0))
                          {

                            v11 = 0;
                          }
                          else
                          {
                            -[SFMetaInfoCardSection badge](self, "badge");
                            v36 = (void *)objc_claimAutoreleasedReturnValue();
                            if (v36)
                            {
                              -[SFMetaInfoCardSection badge](self, "badge");
                              v35 = (void *)objc_claimAutoreleasedReturnValue();
                              -[SFMetaInfoCardSection badge](v5, "badge");
                              v34 = (void *)objc_claimAutoreleasedReturnValue();
                              v11 = objc_msgSend(v35, "isEqual:", v34);

                            }
                            else
                            {

                              v11 = 1;
                            }
                          }
                          if (!v41)
                            goto LABEL_73;
                        }
                        else
                        {
                          v11 = 0;
                        }

LABEL_73:
LABEL_74:
                        if (!v46)
                          goto LABEL_76;
                        goto LABEL_75;
                      }

                    }
                    if (!v29)
                    {
LABEL_57:

                      v14 = v65;
                      v16 = v51;
LABEL_58:
                      if (!v58)
                      {
LABEL_60:

LABEL_38:
                        if (!v62)
                          goto LABEL_40;
                        goto LABEL_39;
                      }
LABEL_59:

                      goto LABEL_60;
                    }
LABEL_56:

                    goto LABEL_57;
                  }

                }
                v14 = v65;
                goto LABEL_58;
              }

            }
          }
        }
        v14 = v65;
        goto LABEL_38;
      }
    }
    v11 = 0;
  }
LABEL_28:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  unint64_t v24;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)SFMetaInfoCardSection;
  v3 = -[SFCardSection hash](&v26, sel_hash);
  -[SFCardSection punchoutOptions](self, "punchoutOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");
  -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 ^ objc_msgSend(v8, "hash");
  v10 = v9 ^ -[SFCardSection canBeHidden](self, "canBeHidden");
  v11 = v10 ^ -[SFCardSection hasTopPadding](self, "hasTopPadding") ^ v3;
  v12 = -[SFCardSection hasBottomPadding](self, "hasBottomPadding");
  -[SFMetaInfoCardSection type](self, "type");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 ^ objc_msgSend(v13, "hash");
  v15 = v14 ^ -[SFCardSection separatorStyle](self, "separatorStyle");
  -[SFCardSection backgroundColor](self, "backgroundColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v15 ^ objc_msgSend(v16, "hash");
  v18 = v11 ^ v17 ^ -[SFMetaInfoCardSection trending](self, "trending");
  -[SFMetaInfoCardSection contentURL](self, "contentURL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "hash");
  -[SFMetaInfoCardSection hostPageURL](self, "hostPageURL");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v20 ^ objc_msgSend(v21, "hash");
  -[SFMetaInfoCardSection badge](self, "badge");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v18 ^ v22 ^ objc_msgSend(v23, "hash");

  return v24;
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (BOOL)trending
{
  return self->_trending;
}

- (NSURL)contentURL
{
  return self->_contentURL;
}

- (void)setContentURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSURL)hostPageURL
{
  return self->_hostPageURL;
}

- (void)setHostPageURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (SFImage)badge
{
  return self->_badge;
}

- (void)setBadge:(id)a3
{
  objc_storeStrong((id *)&self->_badge, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badge, 0);
  objc_storeStrong((id *)&self->_hostPageURL, 0);
  objc_storeStrong((id *)&self->_contentURL, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
