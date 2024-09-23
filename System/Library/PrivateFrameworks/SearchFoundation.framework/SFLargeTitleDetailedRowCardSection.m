@implementation SFLargeTitleDetailedRowCardSection

- (SFLargeTitleDetailedRowCardSection)initWithProtobuf:(id)a3
{
  id v4;
  SFLargeTitleDetailedRowCardSection *v5;
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
  SFRichText *v25;
  void *v26;
  SFRichText *v27;
  void *v28;
  SFButtonItem *v29;
  void *v30;
  SFButtonItem *v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  SFButtonItem *v39;
  SFLargeTitleDetailedRowCardSection *v40;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  objc_super v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)SFLargeTitleDetailedRowCardSection;
  v5 = -[SFCardSection init](&v50, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "punchoutOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v7 = 0;

    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    objc_msgSend(v4, "punchoutOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v47;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v47 != v11)
            objc_enumerationMutation(v8);
          v13 = -[SFPunchout initWithProtobuf:]([SFPunchout alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i));
          if (v13)
            objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
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
      -[SFLargeTitleDetailedRowCardSection setType:](v5, "setType:", v19);

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
      v25 = [SFRichText alloc];
      objc_msgSend(v4, "title");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[SFRichText initWithProtobuf:](v25, "initWithProtobuf:", v26);
      -[SFLargeTitleDetailedRowCardSection setTitle:](v5, "setTitle:", v27);

    }
    objc_msgSend(v4, "subtitleButtonItem");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      v29 = [SFButtonItem alloc];
      objc_msgSend(v4, "subtitleButtonItem");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = -[SFButtonItem initWithProtobuf:](v29, "initWithProtobuf:", v30);
      -[SFLargeTitleDetailedRowCardSection setSubtitleButtonItem:](v5, "setSubtitleButtonItem:", v31);

    }
    objc_msgSend(v4, "trailingButtonItems");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
      v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v33 = 0;

    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    objc_msgSend(v4, "trailingButtonItems", 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v43;
      do
      {
        for (j = 0; j != v36; ++j)
        {
          if (*(_QWORD *)v43 != v37)
            objc_enumerationMutation(v34);
          v39 = -[SFButtonItem initWithProtobuf:]([SFButtonItem alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * j));
          if (v39)
            objc_msgSend(v33, "addObject:", v39);

        }
        v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
      }
      while (v36);
    }

    -[SFLargeTitleDetailedRowCardSection setTrailingButtonItems:](v5, "setTrailingButtonItems:", v33);
    v40 = v5;

  }
  return v5;
}

- (SFLargeTitleDetailedRowCardSection)initWithCoder:(id)a3
{
  id v4;
  SFLargeTitleDetailedRowCardSection *v5;
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
    -[SFLargeTitleDetailedRowCardSection setType:](v5, "setType:", v12);

    -[SFCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", -[SFCardSection separatorStyle](v8, "separatorStyle"));
    -[SFCardSection backgroundColor](v8, "backgroundColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setBackgroundColor:](v5, "setBackgroundColor:", v13);

    -[SFCardSection title](v8, "title");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFLargeTitleDetailedRowCardSection setTitle:](v5, "setTitle:", v14);

    -[SFCardSection subtitleButtonItem](v8, "subtitleButtonItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFLargeTitleDetailedRowCardSection setSubtitleButtonItem:](v5, "setSubtitleButtonItem:", v15);

    -[SFCardSection trailingButtonItems](v8, "trailingButtonItems");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFLargeTitleDetailedRowCardSection setTrailingButtonItems:](v5, "setTrailingButtonItems:", v16);

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
  v3.super_class = (Class)SFLargeTitleDetailedRowCardSection;
  -[SFCardSection encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBLargeTitleDetailedRowCardSection *v2;
  void *v3;

  v2 = -[_SFPBLargeTitleDetailedRowCardSection initWithFacade:]([_SFPBLargeTitleDetailedRowCardSection alloc], "initWithFacade:", self);
  -[_SFPBLargeTitleDetailedRowCardSection dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBLargeTitleDetailedRowCardSection *v2;
  void *v3;

  v2 = -[_SFPBLargeTitleDetailedRowCardSection initWithFacade:]([_SFPBLargeTitleDetailedRowCardSection alloc], "initWithFacade:", self);
  -[_SFPBLargeTitleDetailedRowCardSection jsonData](v2, "jsonData");
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
  v22.super_class = (Class)SFLargeTitleDetailedRowCardSection;
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
  -[SFLargeTitleDetailedRowCardSection type](self, "type");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setType:", v12);

  objc_msgSend(v4, "setSeparatorStyle:", -[SFCardSection separatorStyle](self, "separatorStyle"));
  -[SFCardSection backgroundColor](self, "backgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setBackgroundColor:", v14);

  -[SFLargeTitleDetailedRowCardSection title](self, "title");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v4, "setTitle:", v16);

  -[SFLargeTitleDetailedRowCardSection subtitleButtonItem](self, "subtitleButtonItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");
  objc_msgSend(v4, "setSubtitleButtonItem:", v18);

  -[SFLargeTitleDetailedRowCardSection trailingButtonItems](self, "trailingButtonItems");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");
  objc_msgSend(v4, "setTrailingButtonItems:", v20);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SFLargeTitleDetailedRowCardSection *v4;
  SFLargeTitleDetailedRowCardSection *v5;
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
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  objc_super v67;

  v4 = (SFLargeTitleDetailedRowCardSection *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    if (-[SFLargeTitleDetailedRowCardSection isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
    {
      v67.receiver = self;
      v67.super_class = (Class)SFLargeTitleDetailedRowCardSection;
      if (-[SFCardSection isEqual:](&v67, sel_isEqual_, v4))
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
          v65 = v10;
          v66 = v9;
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
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = v15;
          if (!objc_msgSend(v15, "isEqual:", v62))
            goto LABEL_21;
        }
        v64 = v14;
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
        v59 = v16;
        v60 = v17;
        -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        if (v61)
        {
          -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
          v18 = objc_claimAutoreleasedReturnValue();
          -[SFCardSection punchoutPickerDismissText](v5, "punchoutPickerDismissText");
          v19 = objc_claimAutoreleasedReturnValue();
          v58 = (void *)v18;
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
              -[SFLargeTitleDetailedRowCardSection type](self, "type");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              -[SFLargeTitleDetailedRowCardSection type](v5, "type");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              if ((v25 == 0) != (v26 != 0))
              {
                v55 = v26;
                v56 = v25;
                -[SFLargeTitleDetailedRowCardSection type](self, "type");
                v14 = v64;
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                if (v57)
                {
                  -[SFLargeTitleDetailedRowCardSection type](self, "type");
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SFLargeTitleDetailedRowCardSection type](v5, "type");
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!objc_msgSend(v54, "isEqual:"))
                    goto LABEL_50;
                }
                v27 = -[SFCardSection separatorStyle](self, "separatorStyle");
                if (v27 == -[SFCardSection separatorStyle](v5, "separatorStyle"))
                {
                  -[SFCardSection backgroundColor](self, "backgroundColor");
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SFCardSection backgroundColor](v5, "backgroundColor");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  if ((v52 == 0) != (v28 != 0))
                  {
                    v50 = v16;
                    v51 = v28;
                    -[SFCardSection backgroundColor](self, "backgroundColor");
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v29)
                    {
                      -[SFCardSection backgroundColor](self, "backgroundColor");
                      v30 = (void *)objc_claimAutoreleasedReturnValue();
                      -[SFCardSection backgroundColor](v5, "backgroundColor");
                      v46 = (void *)objc_claimAutoreleasedReturnValue();
                      v47 = v30;
                      if (!objc_msgSend(v30, "isEqual:"))
                        goto LABEL_57;
                    }
                    -[SFLargeTitleDetailedRowCardSection title](self, "title");
                    v49 = (void *)objc_claimAutoreleasedReturnValue();
                    -[SFLargeTitleDetailedRowCardSection title](v5, "title");
                    v48 = (void *)objc_claimAutoreleasedReturnValue();
                    if ((v49 == 0) == (v48 != 0))
                    {

                      if (!v29)
                      {
LABEL_58:

                        v14 = v64;
                        v16 = v50;
LABEL_49:
                        if (!v57)
                        {
LABEL_51:

LABEL_38:
                          if (!v61)
                            goto LABEL_40;
                          goto LABEL_39;
                        }
LABEL_50:

                        goto LABEL_51;
                      }
LABEL_57:

                      goto LABEL_58;
                    }
                    -[SFLargeTitleDetailedRowCardSection title](self, "title");
                    v45 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v45)
                    {
                      -[SFLargeTitleDetailedRowCardSection title](self, "title");
                      v31 = (void *)objc_claimAutoreleasedReturnValue();
                      -[SFLargeTitleDetailedRowCardSection title](v5, "title");
                      v41 = (void *)objc_claimAutoreleasedReturnValue();
                      v42 = v31;
                      if (!objc_msgSend(v31, "isEqual:"))
                      {
                        v11 = 0;
LABEL_73:

LABEL_74:
                        if (v29)
                        {

                        }
                        if (v57)
                        {

                        }
                        if (v61)
                        {

                        }
                        if (v64)
                        {

                        }
                        if (!v8)
                          goto LABEL_26;
LABEL_24:
                        v10 = v65;
                        v9 = v66;
                        goto LABEL_25;
                      }
                    }
                    -[SFLargeTitleDetailedRowCardSection subtitleButtonItem](self, "subtitleButtonItem");
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    -[SFLargeTitleDetailedRowCardSection subtitleButtonItem](v5, "subtitleButtonItem");
                    v43 = (void *)objc_claimAutoreleasedReturnValue();
                    if ((v44 == 0) == (v43 != 0))
                    {

                      v11 = 0;
                      goto LABEL_72;
                    }
                    -[SFLargeTitleDetailedRowCardSection subtitleButtonItem](self, "subtitleButtonItem");
                    v40 = (void *)objc_claimAutoreleasedReturnValue();
                    if (!v40
                      || (-[SFLargeTitleDetailedRowCardSection subtitleButtonItem](self, "subtitleButtonItem"),
                          v32 = (void *)objc_claimAutoreleasedReturnValue(),
                          -[SFLargeTitleDetailedRowCardSection subtitleButtonItem](v5, "subtitleButtonItem"),
                          v38 = (void *)objc_claimAutoreleasedReturnValue(),
                          v39 = v32,
                          objc_msgSend(v32, "isEqual:")))
                    {
                      -[SFLargeTitleDetailedRowCardSection trailingButtonItems](self, "trailingButtonItems");
                      v37 = (void *)objc_claimAutoreleasedReturnValue();
                      -[SFLargeTitleDetailedRowCardSection trailingButtonItems](v5, "trailingButtonItems");
                      v36 = (void *)objc_claimAutoreleasedReturnValue();
                      if ((v37 == 0) == (v36 != 0))
                      {

                        v11 = 0;
                      }
                      else
                      {
                        -[SFLargeTitleDetailedRowCardSection trailingButtonItems](self, "trailingButtonItems");
                        v35 = (void *)objc_claimAutoreleasedReturnValue();
                        if (v35)
                        {
                          -[SFLargeTitleDetailedRowCardSection trailingButtonItems](self, "trailingButtonItems");
                          v34 = (void *)objc_claimAutoreleasedReturnValue();
                          -[SFLargeTitleDetailedRowCardSection trailingButtonItems](v5, "trailingButtonItems");
                          v33 = (void *)objc_claimAutoreleasedReturnValue();
                          v11 = objc_msgSend(v34, "isEqual:", v33);

                        }
                        else
                        {

                          v11 = 1;
                        }
                      }
                      if (!v40)
                        goto LABEL_71;
                    }
                    else
                    {
                      v11 = 0;
                    }

LABEL_71:
LABEL_72:
                    if (!v45)
                      goto LABEL_74;
                    goto LABEL_73;
                  }

                }
                v14 = v64;
                goto LABEL_49;
              }

            }
          }
        }
        v14 = v64;
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
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  unint64_t v23;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)SFLargeTitleDetailedRowCardSection;
  v3 = -[SFCardSection hash](&v25, sel_hash);
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
  -[SFLargeTitleDetailedRowCardSection type](self, "type");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 ^ objc_msgSend(v13, "hash");
  v15 = v14 ^ -[SFCardSection separatorStyle](self, "separatorStyle");
  -[SFCardSection backgroundColor](self, "backgroundColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v15 ^ objc_msgSend(v16, "hash");
  -[SFLargeTitleDetailedRowCardSection title](self, "title");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v11 ^ v17 ^ objc_msgSend(v18, "hash");
  -[SFLargeTitleDetailedRowCardSection subtitleButtonItem](self, "subtitleButtonItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "hash");
  -[SFLargeTitleDetailedRowCardSection trailingButtonItems](self, "trailingButtonItems");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v19 ^ v21 ^ objc_msgSend(v22, "hash");

  return v23;
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (SFRichText)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (SFButtonItem)subtitleButtonItem
{
  return self->_subtitleButtonItem;
}

- (void)setSubtitleButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleButtonItem, a3);
}

- (NSArray)trailingButtonItems
{
  return self->_trailingButtonItems;
}

- (void)setTrailingButtonItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingButtonItems, 0);
  objc_storeStrong((id *)&self->_subtitleButtonItem, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
