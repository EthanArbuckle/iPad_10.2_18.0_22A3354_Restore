@implementation SFScoreboardCardSection

- (SFScoreboardCardSection)initWithProtobuf:(id)a3
{
  id v4;
  SFScoreboardCardSection *v5;
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
  SFSportsTeam *v29;
  void *v30;
  SFSportsTeam *v31;
  void *v32;
  SFSportsTeam *v33;
  void *v34;
  SFSportsTeam *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  SFScoreboardCardSection *v40;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  objc_super v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)SFScoreboardCardSection;
  v5 = -[SFCardSection init](&v46, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "punchoutOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v7 = 0;

    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    objc_msgSend(v4, "punchoutOptions", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v43 != v11)
            objc_enumerationMutation(v8);
          v13 = -[SFPunchout initWithProtobuf:]([SFPunchout alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i));
          if (v13)
            objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
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
    objc_msgSend(v4, "team1");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      v29 = [SFSportsTeam alloc];
      objc_msgSend(v4, "team1");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = -[SFSportsTeam initWithProtobuf:](v29, "initWithProtobuf:", v30);
      -[SFScoreboardCardSection setTeam1:](v5, "setTeam1:", v31);

    }
    objc_msgSend(v4, "team2");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      v33 = [SFSportsTeam alloc];
      objc_msgSend(v4, "team2");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = -[SFSportsTeam initWithProtobuf:](v33, "initWithProtobuf:", v34);
      -[SFScoreboardCardSection setTeam2:](v5, "setTeam2:", v35);

    }
    objc_msgSend(v4, "accessibilityDescription");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      objc_msgSend(v4, "accessibilityDescription");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFScoreboardCardSection setAccessibilityDescription:](v5, "setAccessibilityDescription:", v37);

    }
    objc_msgSend(v4, "eventStatus");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      objc_msgSend(v4, "eventStatus");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFScoreboardCardSection setEventStatus:](v5, "setEventStatus:", v39);

    }
    v40 = v5;

  }
  return v5;
}

- (SFScoreboardCardSection)initWithCoder:(id)a3
{
  id v4;
  SFScoreboardCardSection *v5;
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

    -[SFCardSection team1](v8, "team1");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFScoreboardCardSection setTeam1:](v5, "setTeam1:", v16);

    -[SFCardSection team2](v8, "team2");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFScoreboardCardSection setTeam2:](v5, "setTeam2:", v17);

    -[SFCardSection accessibilityDescription](v8, "accessibilityDescription");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFScoreboardCardSection setAccessibilityDescription:](v5, "setAccessibilityDescription:", v18);

    -[SFCardSection eventStatus](v8, "eventStatus");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFScoreboardCardSection setEventStatus:](v5, "setEventStatus:", v19);

    -[SFCardSection punchoutOptions](v8, "punchoutOptions");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutOptions:](v5, "setPunchoutOptions:", v20);

    -[SFCardSection punchoutPickerTitle](v8, "punchoutPickerTitle");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerTitle:](v5, "setPunchoutPickerTitle:", v21);

    -[SFCardSection punchoutPickerDismissText](v8, "punchoutPickerDismissText");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerDismissText:](v5, "setPunchoutPickerDismissText:", v22);

    -[SFCardSection setCanBeHidden:](v5, "setCanBeHidden:", -[SFCardSection canBeHidden](v8, "canBeHidden"));
    -[SFCardSection setHasTopPadding:](v5, "setHasTopPadding:", -[SFCardSection hasTopPadding](v8, "hasTopPadding"));
    -[SFCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", -[SFCardSection hasBottomPadding](v8, "hasBottomPadding"));
    -[SFCardSection type](v8, "type");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFTitleCardSection setType:](v5, "setType:", v23);

    -[SFCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", -[SFCardSection separatorStyle](v8, "separatorStyle"));
    -[SFCardSection backgroundColor](v8, "backgroundColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setBackgroundColor:](v5, "setBackgroundColor:", v24);

    -[SFCardSection title](v8, "title");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFTitleCardSection setTitle:](v5, "setTitle:", v25);

    -[SFCardSection subtitle](v8, "subtitle");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFTitleCardSection setSubtitle:](v5, "setSubtitle:", v26);

    -[SFTitleCardSection setIsCentered:](v5, "setIsCentered:", -[SFCardSection isCentered](v8, "isCentered"));
    -[SFCardSection nextCard](v8, "nextCard");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setNextCard:](v5, "setNextCard:", v27);

    -[SFCardSection commands](v8, "commands");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCommands:](v5, "setCommands:", v28);

    -[SFCardSection parameterKeyPaths](v8, "parameterKeyPaths");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setParameterKeyPaths:](v5, "setParameterKeyPaths:", v29);

    -[SFCardSection cardSectionId](v8, "cardSectionId");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCardSectionId:](v5, "setCardSectionId:", v30);

    -[SFCardSection resultIdentifier](v8, "resultIdentifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setResultIdentifier:](v5, "setResultIdentifier:", v31);

    -[SFCardSection userReportRequest](v8, "userReportRequest");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setUserReportRequest:](v5, "setUserReportRequest:", v32);

    -[SFCardSection command](v8, "command");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCommand:](v5, "setCommand:", v33);

    -[SFCardSection previewCommand](v8, "previewCommand");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewCommand:](v5, "setPreviewCommand:", v34);

    -[SFCardSection previewButtonItems](v8, "previewButtonItems");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewButtonItems:](v5, "setPreviewButtonItems:", v35);

    -[SFCardSection cardSectionDetail](v8, "cardSectionDetail");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCardSectionDetail:](v5, "setCardSectionDetail:", v36);

    -[SFCardSection previewButtonItemsTitle](v8, "previewButtonItemsTitle");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewButtonItemsTitle:](v5, "setPreviewButtonItemsTitle:", v37);

    -[SFCardSection backgroundColor](v8, "backgroundColor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setBackgroundColor:](v5, "setBackgroundColor:", v38);

    -[SFCardSection setShouldHideInAmbientMode:](v5, "setShouldHideInAmbientMode:", -[SFCardSection shouldHideInAmbientMode](v8, "shouldHideInAmbientMode"));
    -[SFCardSection leadingSwipeButtonItems](v8, "leadingSwipeButtonItems");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setLeadingSwipeButtonItems:](v5, "setLeadingSwipeButtonItems:", v39);

    -[SFCardSection trailingSwipeButtonItems](v8, "trailingSwipeButtonItems");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setTrailingSwipeButtonItems:](v5, "setTrailingSwipeButtonItems:", v40);

    -[SFCardSection punchoutOptions](v8, "punchoutOptions");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutOptions:](v5, "setPunchoutOptions:", v41);

    -[SFCardSection punchoutPickerTitle](v8, "punchoutPickerTitle");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerTitle:](v5, "setPunchoutPickerTitle:", v42);

    -[SFCardSection punchoutPickerDismissText](v8, "punchoutPickerDismissText");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerDismissText:](v5, "setPunchoutPickerDismissText:", v43);

    -[SFCardSection setCanBeHidden:](v5, "setCanBeHidden:", -[SFCardSection canBeHidden](v8, "canBeHidden"));
    -[SFCardSection setHasTopPadding:](v5, "setHasTopPadding:", -[SFCardSection hasTopPadding](v8, "hasTopPadding"));
    -[SFCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", -[SFCardSection hasBottomPadding](v8, "hasBottomPadding"));
    -[SFCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", -[SFCardSection separatorStyle](v8, "separatorStyle"));
    -[SFCardSection referencedCommands](v8, "referencedCommands");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setReferencedCommands:](v5, "setReferencedCommands:", v44);

    -[SFCardSection setForceEnable3DTouch:](v5, "setForceEnable3DTouch:", -[SFCardSection forceEnable3DTouch](v8, "forceEnable3DTouch"));
    -[SFCardSection setShouldShowInSmartDialog:](v5, "setShouldShowInSmartDialog:", -[SFCardSection shouldShowInSmartDialog](v8, "shouldShowInSmartDialog"));
    -[SFCardSection appEntityAnnotation](v8, "appEntityAnnotation");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setAppEntityAnnotation:](v5, "setAppEntityAnnotation:", v45);

    -[SFCardSection emphasisSubjectId](v8, "emphasisSubjectId");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setEmphasisSubjectId:](v5, "setEmphasisSubjectId:", v46);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFScoreboardCardSection;
  -[SFTitleCardSection encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBScoreboardCardSection *v2;
  void *v3;

  v2 = -[_SFPBScoreboardCardSection initWithFacade:]([_SFPBScoreboardCardSection alloc], "initWithFacade:", self);
  -[_SFPBScoreboardCardSection dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBScoreboardCardSection *v2;
  void *v3;

  v2 = -[_SFPBScoreboardCardSection initWithFacade:]([_SFPBScoreboardCardSection alloc], "initWithFacade:", self);
  -[_SFPBScoreboardCardSection jsonData](v2, "jsonData");
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
  v28.super_class = (Class)SFScoreboardCardSection;
  v4 = -[SFTitleCardSection copyWithZone:](&v28, sel_copyWithZone_, a3);
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

  -[SFScoreboardCardSection team1](self, "team1");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");
  objc_msgSend(v4, "setTeam1:", v20);

  -[SFScoreboardCardSection team2](self, "team2");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "copy");
  objc_msgSend(v4, "setTeam2:", v22);

  -[SFScoreboardCardSection accessibilityDescription](self, "accessibilityDescription");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v23, "copy");
  objc_msgSend(v4, "setAccessibilityDescription:", v24);

  -[SFScoreboardCardSection eventStatus](self, "eventStatus");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v25, "copy");
  objc_msgSend(v4, "setEventStatus:", v26);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  SFScoreboardCardSection *v5;
  SFScoreboardCardSection *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  SFScoreboardCardSection *v21;
  void *v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  uint64_t v31;
  uint64_t v32;
  SFScoreboardCardSection *v33;
  void *v34;
  _BOOL4 v35;
  _BOOL4 v36;
  _BOOL4 v37;
  uint64_t v38;
  uint64_t v39;
  _BOOL4 v40;
  void *v41;
  int v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
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
  _OWORD v108[2];
  _BYTE v109[28];
  int v110;
  int v111;
  id v112;
  id v113;
  _QWORD v114[4];
  SFScoreboardCardSection *v115;
  objc_super v116;

  v5 = (SFScoreboardCardSection *)a3;
  if (self == v5)
  {
    v18 = 1;
    goto LABEL_79;
  }
  if (!-[SFScoreboardCardSection isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class())
    || (v116.receiver = self,
        v116.super_class = (Class)SFScoreboardCardSection,
        !-[SFTitleCardSection isEqual:](&v116, sel_isEqual_, v5)))
  {
    v18 = 0;
    goto LABEL_79;
  }
  v6 = v5;
  -[SFCardSection punchoutOptions](self, "punchoutOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCardSection punchoutOptions](v6, "punchoutOptions");
  v112 = (id)objc_claimAutoreleasedReturnValue();
  v113 = v7;
  v110 = v112 != 0;
  v111 = v7 == 0;
  v115 = v6;
  if (v111 == v110)
  {
    memset(v109, 0, sizeof(v109));
    v10 = 0;
    v11 = 0;
    v12 = 0;
    memset(v114, 0, sizeof(v114));
    memset(v108, 0, sizeof(v108));
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    goto LABEL_16;
  }
  -[SFCardSection punchoutOptions](self, "punchoutOptions");
  v8 = objc_claimAutoreleasedReturnValue();
  v3 = v8 != 0;
  v107 = (void *)v8;
  if (v8)
  {
    -[SFCardSection punchoutOptions](self, "punchoutOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection punchoutOptions](v6, "punchoutOptions");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = v9;
    if (!objc_msgSend(v9, "isEqual:"))
    {
      memset(v109, 0, 24);
      v10 = 0;
      v11 = 0;
      v12 = 0;
      memset(v114, 0, sizeof(v114));
      memset(v108, 0, sizeof(v108));
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      *(_DWORD *)&v109[24] = 1;
      goto LABEL_16;
    }
  }
  -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCardSection punchoutPickerTitle](v6, "punchoutPickerTitle");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)&v109[24] = v3;
  if ((v106 == 0) == (v105 != 0))
  {
    memset(v109, 0, 20);
    v10 = 0;
    v11 = 0;
    v12 = 0;
    memset(v114, 0, sizeof(v114));
    memset(v108, 0, sizeof(v108));
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    *(_DWORD *)&v109[20] = 1;
    goto LABEL_16;
  }
  -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v19 = objc_claimAutoreleasedReturnValue();
  HIDWORD(v114[3]) = v19 != 0;
  v102 = (void *)v19;
  if (v19)
  {
    -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v6;
    v22 = (void *)v20;
    -[SFCardSection punchoutPickerTitle](v21, "punchoutPickerTitle");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v99 = v22;
    if (!objc_msgSend(v22, "isEqual:"))
    {
      *(_QWORD *)&v109[8] = 0;
      *(_QWORD *)v109 = 0;
      v10 = 0;
      v11 = 0;
      v12 = 0;
      memset(v108, 0, sizeof(v108));
      v13 = 0;
      v14 = 0;
      memset(v114, 0, 28);
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      *(_QWORD *)&v109[16] = 0x100000001;
      HIDWORD(v114[3]) = 1;
      goto LABEL_16;
    }
    v6 = v115;
  }
  -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCardSection punchoutPickerDismissText](v6, "punchoutPickerDismissText");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v101 == 0) == (v100 != 0))
  {
    *(_QWORD *)v109 = 0;
    *(_QWORD *)&v109[8] = 0x100000000;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    memset(v108, 0, sizeof(v108));
    v13 = 0;
    v14 = 0;
    memset(v114, 0, 28);
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    *(_QWORD *)&v109[16] = 0x100000001;
    goto LABEL_16;
  }
  -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v31 = objc_claimAutoreleasedReturnValue();
  LODWORD(v114[3]) = v31 != 0;
  v97 = (void *)v31;
  if (v31)
  {
    -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = v6;
    v34 = (void *)v32;
    -[SFCardSection punchoutPickerDismissText](v33, "punchoutPickerDismissText");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = v34;
    if (!objc_msgSend(v34, "isEqual:", v95))
    {
      *(_QWORD *)&v109[4] = 0;
      v10 = 0;
      v11 = 0;
      v12 = 0;
      memset(v108, 0, sizeof(v108));
      v13 = 0;
      memset(v114, 0, 24);
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      *(_QWORD *)&v109[16] = 0x100000001;
      *(_DWORD *)&v109[12] = 1;
      *(_DWORD *)v109 = 1;
      LODWORD(v114[3]) = 1;
      goto LABEL_16;
    }
    v6 = v115;
  }
  v35 = -[SFCardSection canBeHidden](self, "canBeHidden");
  if (v35 == -[SFCardSection canBeHidden](v6, "canBeHidden")
    && (v36 = -[SFCardSection hasTopPadding](self, "hasTopPadding"),
        v36 == -[SFCardSection hasTopPadding](v6, "hasTopPadding"))
    && (v37 = -[SFCardSection hasBottomPadding](self, "hasBottomPadding"),
        v37 == -[SFCardSection hasBottomPadding](v6, "hasBottomPadding")))
  {
    -[SFTitleCardSection type](self, "type");
    v38 = objc_claimAutoreleasedReturnValue();
    -[SFTitleCardSection type](v6, "type");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = (void *)v38;
    if ((v38 == 0) == (v93 != 0))
    {
      v10 = 0;
      v11 = 0;
      v12 = 0;
      memset(v108, 0, sizeof(v108));
      v13 = 0;
      memset(v114, 0, 24);
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      *(_QWORD *)&v109[16] = 0x100000001;
      *(_QWORD *)v109 = 1;
      *(_QWORD *)&v109[8] = 0x100000001;
    }
    else
    {
      -[SFTitleCardSection type](self, "type");
      v39 = objc_claimAutoreleasedReturnValue();
      v40 = v39 != 0;
      v92 = (void *)v39;
      if (!v39
        || (-[SFTitleCardSection type](self, "type"),
            v41 = (void *)objc_claimAutoreleasedReturnValue(),
            -[SFTitleCardSection type](v115, "type"),
            v90 = (void *)objc_claimAutoreleasedReturnValue(),
            v91 = v41,
            objc_msgSend(v41, "isEqual:")))
      {
        *(_DWORD *)&v109[4] = v40;
        v42 = -[SFCardSection separatorStyle](self, "separatorStyle");
        if (v42 == -[SFCardSection separatorStyle](v115, "separatorStyle"))
        {
          -[SFCardSection backgroundColor](self, "backgroundColor");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFCardSection backgroundColor](v115, "backgroundColor");
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          if ((v89 == 0) == (v88 != 0))
          {
            v12 = 0;
            memset(v108, 0, sizeof(v108));
            v13 = 0;
            memset(v114, 0, 24);
            v14 = 0;
            v15 = 0;
            v16 = 0;
            v17 = 0;
            v18 = 0;
            *(_QWORD *)&v109[16] = 0x100000001;
            *(_QWORD *)&v109[8] = 0x100000001;
            *(_DWORD *)v109 = 1;
            v10 = 1;
            v11 = 1;
          }
          else
          {
            -[SFCardSection backgroundColor](self, "backgroundColor");
            v43 = objc_claimAutoreleasedReturnValue();
            HIDWORD(v114[2]) = v43 != 0;
            v87 = (void *)v43;
            if (!v43
              || (-[SFCardSection backgroundColor](self, "backgroundColor"),
                  v44 = (void *)objc_claimAutoreleasedReturnValue(),
                  -[SFCardSection backgroundColor](v115, "backgroundColor"),
                  v83 = (void *)objc_claimAutoreleasedReturnValue(),
                  v84 = v44,
                  objc_msgSend(v44, "isEqual:")))
            {
              -[SFTitleCardSection title](self, "title");
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              -[SFTitleCardSection title](v115, "title");
              v85 = (void *)objc_claimAutoreleasedReturnValue();
              if ((v86 == 0) == (v85 != 0))
              {
                v108[0] = 0uLL;
                v13 = 0;
                v14 = 0;
                memset(v114, 0, 20);
                v15 = 0;
                v16 = 0;
                v17 = 0;
                v18 = 0;
                *(_QWORD *)&v109[16] = 0x100000001;
                *(_QWORD *)&v109[8] = 0x100000001;
                *(_DWORD *)v109 = 1;
                v10 = 1;
                v11 = 1;
                v12 = 1;
                v108[1] = 1uLL;
              }
              else
              {
                -[SFTitleCardSection title](self, "title");
                v45 = objc_claimAutoreleasedReturnValue();
                LODWORD(v114[2]) = v45 != 0;
                v82 = (void *)v45;
                if (!v45
                  || (-[SFTitleCardSection title](self, "title"),
                      v46 = (void *)objc_claimAutoreleasedReturnValue(),
                      -[SFTitleCardSection title](v115, "title"),
                      v78 = (void *)objc_claimAutoreleasedReturnValue(),
                      v79 = v46,
                      objc_msgSend(v46, "isEqual:")))
                {
                  -[SFTitleCardSection subtitle](self, "subtitle");
                  v81 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SFTitleCardSection subtitle](v115, "subtitle");
                  v80 = (void *)objc_claimAutoreleasedReturnValue();
                  if ((v81 == 0) == (v80 != 0))
                  {
                    *(_QWORD *)((char *)&v108[1] + 4) = 0;
                    v114[0] = 0;
                    v114[1] = 0;
                    *(_QWORD *)&v108[0] = 0;
                    v13 = 0;
                    v14 = 0;
                    v15 = 0;
                    v16 = 0;
                    v17 = 0;
                    v18 = 0;
                    *(_QWORD *)&v109[16] = 0x100000001;
                    *(_QWORD *)&v109[8] = 0x100000001;
                    HIDWORD(v108[1]) = 1;
                    *(_DWORD *)v109 = 1;
                    v10 = 1;
                    v11 = 1;
                    v12 = 1;
                    LODWORD(v108[1]) = 1;
                    *((_QWORD *)&v108[0] + 1) = 1;
                  }
                  else
                  {
                    -[SFTitleCardSection subtitle](self, "subtitle");
                    v47 = objc_claimAutoreleasedReturnValue();
                    HIDWORD(v114[1]) = v47 != 0;
                    v77 = (void *)v47;
                    if (!v47
                      || (-[SFTitleCardSection subtitle](self, "subtitle"),
                          v48 = (void *)objc_claimAutoreleasedReturnValue(),
                          -[SFTitleCardSection subtitle](v115, "subtitle"),
                          v73 = (void *)objc_claimAutoreleasedReturnValue(),
                          v74 = v48,
                          objc_msgSend(v48, "isEqual:")))
                    {
                      -[SFScoreboardCardSection team1](self, "team1");
                      v76 = (void *)objc_claimAutoreleasedReturnValue();
                      -[SFScoreboardCardSection team1](v115, "team1");
                      v75 = (void *)objc_claimAutoreleasedReturnValue();
                      if ((v76 == 0) == (v75 != 0))
                      {
                        *(_QWORD *)((char *)v114 + 4) = 0;
                        v13 = 0;
                        v14 = 0;
                        LODWORD(v114[0]) = 0;
                        v15 = 0;
                        v16 = 0;
                        v17 = 0;
                        v18 = 0;
                        *(_QWORD *)&v109[16] = 0x100000001;
                        *(_QWORD *)&v109[8] = 0x100000001;
                        *(_DWORD *)v109 = 1;
                        v10 = 1;
                        v11 = 1;
                        v12 = 1;
                        *(_QWORD *)&v108[1] = 1;
                        *((_QWORD *)&v108[0] + 1) = 1;
                        *((_QWORD *)&v108[1] + 1) = 0x100000001;
                        *(_QWORD *)&v108[0] = 1;
                      }
                      else
                      {
                        -[SFScoreboardCardSection team1](self, "team1");
                        v49 = objc_claimAutoreleasedReturnValue();
                        LODWORD(v114[1]) = v49 != 0;
                        v72 = (void *)v49;
                        if (!v49
                          || (-[SFScoreboardCardSection team1](self, "team1"),
                              v50 = (void *)objc_claimAutoreleasedReturnValue(),
                              -[SFScoreboardCardSection team1](v115, "team1"),
                              v68 = (void *)objc_claimAutoreleasedReturnValue(),
                              v69 = v50,
                              objc_msgSend(v50, "isEqual:")))
                        {
                          -[SFScoreboardCardSection team2](self, "team2");
                          v71 = (void *)objc_claimAutoreleasedReturnValue();
                          -[SFScoreboardCardSection team2](v115, "team2");
                          v70 = (void *)objc_claimAutoreleasedReturnValue();
                          if ((v71 == 0) == (v70 != 0))
                          {
                            v13 = 0;
                            v114[0] = 0;
                            v14 = 0;
                            v15 = 0;
                            v16 = 0;
                            v17 = 0;
                            v18 = 0;
                            *(_QWORD *)&v109[16] = 0x100000001;
                            *(_QWORD *)&v109[8] = 0x100000001;
                            *(_DWORD *)v109 = 1;
                            v10 = 1;
                            v11 = 1;
                            v12 = 1;
                            *(_QWORD *)&v108[1] = 1;
                            HIDWORD(v108[0]) = 1;
                            *((_QWORD *)&v108[1] + 1) = 0x100000001;
                            LODWORD(v108[0]) = 1;
                            *(_QWORD *)((char *)v108 + 4) = 0x100000001;
                          }
                          else
                          {
                            -[SFScoreboardCardSection team2](self, "team2");
                            v51 = objc_claimAutoreleasedReturnValue();
                            HIDWORD(v114[0]) = v51 != 0;
                            v67 = (void *)v51;
                            if (!v51
                              || (-[SFScoreboardCardSection team2](self, "team2"),
                                  v52 = (void *)objc_claimAutoreleasedReturnValue(),
                                  -[SFScoreboardCardSection team2](v115, "team2"),
                                  v63 = (void *)objc_claimAutoreleasedReturnValue(),
                                  v64 = v52,
                                  objc_msgSend(v52, "isEqual:")))
                            {
                              -[SFScoreboardCardSection accessibilityDescription](self, "accessibilityDescription");
                              v66 = (void *)objc_claimAutoreleasedReturnValue();
                              -[SFScoreboardCardSection accessibilityDescription](v115, "accessibilityDescription");
                              v65 = (void *)objc_claimAutoreleasedReturnValue();
                              if ((v66 == 0) == (v65 != 0))
                              {
                                v14 = 0;
                                LODWORD(v114[0]) = 0;
                                v15 = 0;
                                v16 = 0;
                                v17 = 0;
                                v18 = 0;
                                *(_QWORD *)&v109[16] = 0x100000001;
                                *(_QWORD *)&v109[8] = 0x100000001;
                                *(_DWORD *)v109 = 1;
                                v10 = 1;
                                v11 = 1;
                                v12 = 1;
                                *(_QWORD *)&v108[1] = 0x100000001;
                                *((_QWORD *)&v108[0] + 1) = 0x100000001;
                                *((_QWORD *)&v108[1] + 1) = 0x100000001;
                                *(_QWORD *)&v108[0] = 0x100000001;
                                v13 = 1;
                              }
                              else
                              {
                                -[SFScoreboardCardSection accessibilityDescription](self, "accessibilityDescription");
                                v53 = objc_claimAutoreleasedReturnValue();
                                LODWORD(v114[0]) = v53 != 0;
                                v62 = (void *)v53;
                                if (!v53
                                  || (-[SFScoreboardCardSection accessibilityDescription](self, "accessibilityDescription"), v54 = (void *)objc_claimAutoreleasedReturnValue(), -[SFScoreboardCardSection accessibilityDescription](v115, "accessibilityDescription"), v58 = (void *)objc_claimAutoreleasedReturnValue(), v59 = v54, objc_msgSend(v54, "isEqual:")))
                                {
                                  -[SFScoreboardCardSection eventStatus](self, "eventStatus");
                                  v61 = (void *)objc_claimAutoreleasedReturnValue();
                                  -[SFScoreboardCardSection eventStatus](v115, "eventStatus");
                                  v60 = (void *)objc_claimAutoreleasedReturnValue();
                                  if ((v61 == 0) == (v60 != 0))
                                  {
                                    v16 = 0;
                                    v17 = 0;
                                    v18 = 0;
                                    *(_QWORD *)&v109[16] = 0x100000001;
                                    *(_QWORD *)&v109[8] = 0x100000001;
                                    *(_DWORD *)v109 = 1;
                                    v10 = 1;
                                    v11 = 1;
                                    v12 = 1;
                                    *(_QWORD *)&v108[1] = 0x100000001;
                                    *((_QWORD *)&v108[0] + 1) = 0x100000001;
                                    *((_QWORD *)&v108[1] + 1) = 0x100000001;
                                    *(_QWORD *)&v108[0] = 0x100000001;
                                    v13 = 1;
                                    v14 = 1;
                                    v15 = 1;
                                  }
                                  else
                                  {
                                    -[SFScoreboardCardSection eventStatus](self, "eventStatus");
                                    v57 = (void *)objc_claimAutoreleasedReturnValue();
                                    if (v57)
                                    {
                                      -[SFScoreboardCardSection eventStatus](self, "eventStatus");
                                      v55 = (void *)objc_claimAutoreleasedReturnValue();
                                      -[SFScoreboardCardSection eventStatus](v115, "eventStatus");
                                      v3 = objc_claimAutoreleasedReturnValue();
                                      v56 = v55;
                                      v18 = objc_msgSend(v55, "isEqual:", v3);
                                      v17 = 1;
                                      *(_QWORD *)&v109[16] = 0x100000001;
                                      *(_QWORD *)&v109[8] = 0x100000001;
                                      *(_DWORD *)v109 = 1;
                                      v10 = 1;
                                      v11 = 1;
                                      v12 = 1;
                                      *(_QWORD *)&v108[1] = 0x100000001;
                                      *((_QWORD *)&v108[0] + 1) = 0x100000001;
                                      *((_QWORD *)&v108[1] + 1) = 0x100000001;
                                      *(_QWORD *)&v108[0] = 0x100000001;
                                      v13 = 1;
                                      v14 = 1;
                                      v15 = 1;
                                      v16 = 1;
                                    }
                                    else
                                    {
                                      v57 = 0;
                                      v17 = 0;
                                      *(_QWORD *)&v109[16] = 0x100000001;
                                      *(_QWORD *)&v109[8] = 0x100000001;
                                      *(_DWORD *)v109 = 1;
                                      v10 = 1;
                                      v11 = 1;
                                      v12 = 1;
                                      *(_QWORD *)&v108[1] = 0x100000001;
                                      *((_QWORD *)&v108[0] + 1) = 0x100000001;
                                      *((_QWORD *)&v108[1] + 1) = 0x100000001;
                                      *(_QWORD *)&v108[0] = 0x100000001;
                                      v13 = 1;
                                      v14 = 1;
                                      v15 = 1;
                                      v16 = 1;
                                      v18 = 1;
                                    }
                                  }
                                }
                                else
                                {
                                  v15 = 0;
                                  v16 = 0;
                                  v17 = 0;
                                  v18 = 0;
                                  *(_QWORD *)&v109[16] = 0x100000001;
                                  *(_QWORD *)&v109[8] = 0x100000001;
                                  *(_DWORD *)v109 = 1;
                                  v10 = 1;
                                  v11 = 1;
                                  v12 = 1;
                                  *(_QWORD *)&v108[1] = 0x100000001;
                                  *((_QWORD *)&v108[0] + 1) = 0x100000001;
                                  *((_QWORD *)&v108[1] + 1) = 0x100000001;
                                  *(_QWORD *)&v108[0] = 0x100000001;
                                  v13 = 1;
                                  v14 = 1;
                                  LODWORD(v114[0]) = 1;
                                }
                              }
                            }
                            else
                            {
                              v14 = 0;
                              v114[0] = 0x100000000;
                              v15 = 0;
                              v16 = 0;
                              v17 = 0;
                              v18 = 0;
                              *(_QWORD *)&v109[16] = 0x100000001;
                              *(_QWORD *)&v109[8] = 0x100000001;
                              *(_DWORD *)v109 = 1;
                              v10 = 1;
                              v11 = 1;
                              v12 = 1;
                              *(_QWORD *)&v108[1] = 1;
                              HIDWORD(v108[0]) = 1;
                              *((_QWORD *)&v108[1] + 1) = 0x100000001;
                              LODWORD(v108[0]) = 1;
                              *(_QWORD *)((char *)v108 + 4) = 0x100000001;
                              v13 = 1;
                            }
                          }
                        }
                        else
                        {
                          v13 = 0;
                          v114[0] = 0;
                          v14 = 0;
                          v15 = 0;
                          v16 = 0;
                          v17 = 0;
                          v18 = 0;
                          *(_QWORD *)&v109[16] = 0x100000001;
                          *(_QWORD *)&v109[8] = 0x100000001;
                          *(_DWORD *)v109 = 1;
                          v10 = 1;
                          v11 = 1;
                          v12 = 1;
                          *(_QWORD *)&v108[1] = 1;
                          *((_QWORD *)&v108[0] + 1) = 0x100000001;
                          *((_QWORD *)&v108[1] + 1) = 0x100000001;
                          *(_QWORD *)&v108[0] = 1;
                          LODWORD(v114[1]) = 1;
                        }
                      }
                    }
                    else
                    {
                      *(_QWORD *)&v108[0] = 0;
                      *(_QWORD *)((char *)v114 + 4) = 0;
                      v13 = 0;
                      v14 = 0;
                      LODWORD(v114[0]) = 0;
                      v15 = 0;
                      v16 = 0;
                      v17 = 0;
                      v18 = 0;
                      *(_QWORD *)&v109[16] = 0x100000001;
                      *(_QWORD *)&v109[8] = 0x100000001;
                      *(_DWORD *)v109 = 1;
                      v10 = 1;
                      v11 = 1;
                      v12 = 1;
                      *(_QWORD *)&v108[1] = 1;
                      *((_QWORD *)&v108[0] + 1) = 1;
                      *((_QWORD *)&v108[1] + 1) = 0x100000001;
                      HIDWORD(v114[1]) = 1;
                    }
                  }
                }
                else
                {
                  *(_QWORD *)((char *)&v108[1] + 4) = 0;
                  v114[0] = 0;
                  v114[1] = 0;
                  v108[0] = 0uLL;
                  v13 = 0;
                  v14 = 0;
                  v15 = 0;
                  v16 = 0;
                  v17 = 0;
                  v18 = 0;
                  *(_QWORD *)&v109[16] = 0x100000001;
                  *(_QWORD *)&v109[8] = 0x100000001;
                  HIDWORD(v108[1]) = 1;
                  *(_DWORD *)v109 = 1;
                  v10 = 1;
                  v11 = 1;
                  v12 = 1;
                  LODWORD(v108[1]) = 1;
                  LODWORD(v114[2]) = 1;
                }
              }
            }
            else
            {
              memset(v108, 0, sizeof(v108));
              v13 = 0;
              v14 = 0;
              memset(v114, 0, 20);
              v15 = 0;
              v16 = 0;
              v17 = 0;
              v18 = 0;
              *(_QWORD *)&v109[16] = 0x100000001;
              *(_QWORD *)&v109[8] = 0x100000001;
              *(_DWORD *)v109 = 1;
              v10 = 1;
              v11 = 1;
              v12 = 1;
              HIDWORD(v114[2]) = 1;
            }
          }
        }
        else
        {
          v11 = 0;
          v12 = 0;
          memset(v108, 0, sizeof(v108));
          v13 = 0;
          memset(v114, 0, 24);
          v14 = 0;
          v15 = 0;
          v16 = 0;
          v17 = 0;
          v18 = 0;
          *(_QWORD *)&v109[16] = 0x100000001;
          *(_QWORD *)&v109[8] = 0x100000001;
          *(_DWORD *)v109 = 1;
          v10 = 1;
        }
      }
      else
      {
        v11 = 0;
        v12 = 0;
        memset(v108, 0, sizeof(v108));
        v13 = 0;
        memset(v114, 0, 24);
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v17 = 0;
        v18 = 0;
        *(_QWORD *)&v109[16] = 0x100000001;
        *(_QWORD *)&v109[8] = 0x100000001;
        *(_QWORD *)v109 = 0x100000001;
        v10 = 1;
      }
    }
  }
  else
  {
    *(_QWORD *)&v109[4] = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    memset(v108, 0, sizeof(v108));
    v13 = 0;
    memset(v114, 0, 24);
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    *(_QWORD *)&v109[16] = 0x100000001;
    *(_DWORD *)&v109[12] = 1;
    *(_DWORD *)v109 = 1;
  }
LABEL_16:
  if (v17)
  {
    v23 = v13;
    v24 = v14;
    v25 = v11;
    v26 = v15;
    v27 = v12;
    v28 = v10;
    v29 = v16;

    v16 = v29;
    v10 = v28;
    v12 = v27;
    v15 = v26;
    v11 = v25;
    v14 = v24;
    v13 = v23;
  }
  if (v16)

  if (v15)
  {

  }
  if (LODWORD(v114[0]))
  {

  }
  if (v14)

  if (DWORD1(v108[1]))
  {

  }
  if (HIDWORD(v114[0]))
  {

  }
  if (v13)

  if (DWORD1(v108[0]))
  {

  }
  if (LODWORD(v114[1]))
  {

  }
  if (HIDWORD(v108[0]))

  if (LODWORD(v108[0]))
  {

  }
  if (HIDWORD(v114[1]))
  {

  }
  if (DWORD2(v108[1]))

  if (DWORD2(v108[0]))
  {

  }
  if (LODWORD(v114[2]))
  {

  }
  if (HIDWORD(v108[1]))

  if (LODWORD(v108[1]))
  {

  }
  if (HIDWORD(v114[2]))
  {

    if (!v12)
      goto LABEL_54;
LABEL_81:

    if (!v11)
      goto LABEL_56;
    goto LABEL_55;
  }
  if (v12)
    goto LABEL_81;
LABEL_54:
  if (v11)
  {
LABEL_55:

  }
LABEL_56:
  if (*(_DWORD *)&v109[4])
  {

  }
  if (v10)

  if (*(_DWORD *)&v109[8])
  {

  }
  if (LODWORD(v114[3]))
  {

  }
  if (*(_DWORD *)v109)

  if (*(_DWORD *)&v109[12])
  {

  }
  if (HIDWORD(v114[3]))
  {

  }
  if (*(_DWORD *)&v109[16])

  if (*(_DWORD *)&v109[20])
  {

  }
  if (*(_DWORD *)&v109[24])
  {

  }
  if (v111 != v110)

LABEL_79:
  return v18;
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
  void *v23;
  uint64_t v24;
  void *v25;
  unint64_t v26;
  void *v28;
  void *v29;
  void *v30;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)SFScoreboardCardSection;
  v3 = -[SFTitleCardSection hash](&v31, sel_hash);
  -[SFCardSection punchoutOptions](self, "punchoutOptions");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v30, "hash");
  -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 ^ objc_msgSend(v29, "hash");
  -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 ^ objc_msgSend(v28, "hash");
  v7 = v6 ^ -[SFCardSection canBeHidden](self, "canBeHidden");
  v8 = v7 ^ -[SFCardSection hasTopPadding](self, "hasTopPadding") ^ v3;
  v9 = -[SFCardSection hasBottomPadding](self, "hasBottomPadding");
  -[SFTitleCardSection type](self, "type");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9 ^ objc_msgSend(v10, "hash");
  v12 = v11 ^ -[SFCardSection separatorStyle](self, "separatorStyle");
  -[SFCardSection backgroundColor](self, "backgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 ^ objc_msgSend(v13, "hash");
  -[SFTitleCardSection title](self, "title");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v8 ^ v14 ^ objc_msgSend(v15, "hash");
  -[SFTitleCardSection subtitle](self, "subtitle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "hash");
  -[SFScoreboardCardSection team1](self, "team1");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v18 ^ objc_msgSend(v19, "hash");
  -[SFScoreboardCardSection team2](self, "team2");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v20 ^ objc_msgSend(v21, "hash");
  -[SFScoreboardCardSection accessibilityDescription](self, "accessibilityDescription");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v22 ^ objc_msgSend(v23, "hash");
  -[SFScoreboardCardSection eventStatus](self, "eventStatus");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v16 ^ v24 ^ objc_msgSend(v25, "hash");

  return v26;
}

- (SFSportsTeam)team1
{
  return self->_team1;
}

- (void)setTeam1:(id)a3
{
  objc_storeStrong((id *)&self->_team1, a3);
}

- (SFSportsTeam)team2
{
  return self->_team2;
}

- (void)setTeam2:(id)a3
{
  objc_storeStrong((id *)&self->_team2, a3);
}

- (NSString)accessibilityDescription
{
  return self->_accessibilityDescription;
}

- (void)setAccessibilityDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (NSString)eventStatus
{
  return self->_eventStatus;
}

- (void)setEventStatus:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventStatus, 0);
  objc_storeStrong((id *)&self->_accessibilityDescription, 0);
  objc_storeStrong((id *)&self->_team2, 0);
  objc_storeStrong((id *)&self->_team1, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
