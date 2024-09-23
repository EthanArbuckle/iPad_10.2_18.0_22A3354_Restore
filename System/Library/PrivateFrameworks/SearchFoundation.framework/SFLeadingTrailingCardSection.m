@implementation SFLeadingTrailingCardSection

- (SFLeadingTrailingCardSection)initWithProtobuf:(id)a3
{
  id v4;
  SFLeadingTrailingCardSection *v5;
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
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t k;
  SFCardSection *v39;
  void *v40;
  void *v41;
  SFLeadingTrailingCardSection *v42;
  SFLeadingTrailingCardSection *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  objc_super v57;
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v57.receiver = self;
  v57.super_class = (Class)SFLeadingTrailingCardSection;
  v5 = -[SFCardSection init](&v57, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "punchoutOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v7 = 0;

    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    objc_msgSend(v4, "punchoutOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v54;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v54 != v11)
            objc_enumerationMutation(v8);
          v13 = -[SFPunchout initWithProtobuf:]([SFPunchout alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * i));
          if (v13)
            objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
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
      -[SFLeadingTrailingCardSection setType:](v5, "setType:", v19);

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
    objc_msgSend(v4, "leadingCardSections");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
      v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v25 = 0;

    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    objc_msgSend(v4, "leadingCardSections");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v50;
      do
      {
        for (j = 0; j != v28; ++j)
        {
          if (*(_QWORD *)v50 != v29)
            objc_enumerationMutation(v26);
          v31 = -[SFCardSection initWithProtobuf:]([SFCardSection alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * j));
          if (v31)
            objc_msgSend(v25, "addObject:", v31);

        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
      }
      while (v28);
    }

    -[SFLeadingTrailingCardSection setLeadingCardSections:](v5, "setLeadingCardSections:", v25);
    objc_msgSend(v4, "trailingCardSections");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v5;
    if (v32)
      v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v33 = 0;

    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    objc_msgSend(v4, "trailingCardSections");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v46;
      do
      {
        for (k = 0; k != v36; ++k)
        {
          if (*(_QWORD *)v46 != v37)
            objc_enumerationMutation(v34);
          v39 = -[SFCardSection initWithProtobuf:]([SFCardSection alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * k));
          if (v39)
            objc_msgSend(v33, "addObject:", v39);

        }
        v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
      }
      while (v36);
    }

    v5 = v44;
    -[SFLeadingTrailingCardSection setTrailingCardSections:](v44, "setTrailingCardSections:", v33);
    objc_msgSend(v4, "leadingToTrailingRatio");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (v40)
    {
      objc_msgSend(v4, "leadingToTrailingRatio");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "doubleValue");
      -[SFLeadingTrailingCardSection setLeadingToTrailingRatio:](v44, "setLeadingToTrailingRatio:");

    }
    v42 = v44;

  }
  return v5;
}

- (void)setLeadingToTrailingRatio:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_leadingToTrailingRatio = a3;
}

- (BOOL)hasLeadingToTrailingRatio
{
  return *(_BYTE *)&self->_has & 1;
}

- (SFLeadingTrailingCardSection)initWithCoder:(id)a3
{
  id v4;
  SFLeadingTrailingCardSection *v5;
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
    -[SFLeadingTrailingCardSection setType:](v5, "setType:", v12);

    -[SFCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", -[SFCardSection separatorStyle](v8, "separatorStyle"));
    -[SFCardSection backgroundColor](v8, "backgroundColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setBackgroundColor:](v5, "setBackgroundColor:", v13);

    -[SFCardSection leadingCardSections](v8, "leadingCardSections");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFLeadingTrailingCardSection setLeadingCardSections:](v5, "setLeadingCardSections:", v14);

    -[SFCardSection trailingCardSections](v8, "trailingCardSections");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFLeadingTrailingCardSection setTrailingCardSections:](v5, "setTrailingCardSections:", v15);

    -[SFCardSection leadingToTrailingRatio](v8, "leadingToTrailingRatio");
    -[SFLeadingTrailingCardSection setLeadingToTrailingRatio:](v5, "setLeadingToTrailingRatio:");
    -[SFCardSection nextCard](v8, "nextCard");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setNextCard:](v5, "setNextCard:", v16);

    -[SFCardSection commands](v8, "commands");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCommands:](v5, "setCommands:", v17);

    -[SFCardSection parameterKeyPaths](v8, "parameterKeyPaths");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setParameterKeyPaths:](v5, "setParameterKeyPaths:", v18);

    -[SFCardSection cardSectionId](v8, "cardSectionId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCardSectionId:](v5, "setCardSectionId:", v19);

    -[SFCardSection resultIdentifier](v8, "resultIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setResultIdentifier:](v5, "setResultIdentifier:", v20);

    -[SFCardSection userReportRequest](v8, "userReportRequest");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setUserReportRequest:](v5, "setUserReportRequest:", v21);

    -[SFCardSection command](v8, "command");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCommand:](v5, "setCommand:", v22);

    -[SFCardSection previewCommand](v8, "previewCommand");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewCommand:](v5, "setPreviewCommand:", v23);

    -[SFCardSection previewButtonItems](v8, "previewButtonItems");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewButtonItems:](v5, "setPreviewButtonItems:", v24);

    -[SFCardSection cardSectionDetail](v8, "cardSectionDetail");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCardSectionDetail:](v5, "setCardSectionDetail:", v25);

    -[SFCardSection previewButtonItemsTitle](v8, "previewButtonItemsTitle");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewButtonItemsTitle:](v5, "setPreviewButtonItemsTitle:", v26);

    -[SFCardSection backgroundColor](v8, "backgroundColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setBackgroundColor:](v5, "setBackgroundColor:", v27);

    -[SFCardSection setShouldHideInAmbientMode:](v5, "setShouldHideInAmbientMode:", -[SFCardSection shouldHideInAmbientMode](v8, "shouldHideInAmbientMode"));
    -[SFCardSection leadingSwipeButtonItems](v8, "leadingSwipeButtonItems");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setLeadingSwipeButtonItems:](v5, "setLeadingSwipeButtonItems:", v28);

    -[SFCardSection trailingSwipeButtonItems](v8, "trailingSwipeButtonItems");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setTrailingSwipeButtonItems:](v5, "setTrailingSwipeButtonItems:", v29);

    -[SFCardSection punchoutOptions](v8, "punchoutOptions");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutOptions:](v5, "setPunchoutOptions:", v30);

    -[SFCardSection punchoutPickerTitle](v8, "punchoutPickerTitle");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerTitle:](v5, "setPunchoutPickerTitle:", v31);

    -[SFCardSection punchoutPickerDismissText](v8, "punchoutPickerDismissText");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerDismissText:](v5, "setPunchoutPickerDismissText:", v32);

    -[SFCardSection setCanBeHidden:](v5, "setCanBeHidden:", -[SFCardSection canBeHidden](v8, "canBeHidden"));
    -[SFCardSection setHasTopPadding:](v5, "setHasTopPadding:", -[SFCardSection hasTopPadding](v8, "hasTopPadding"));
    -[SFCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", -[SFCardSection hasBottomPadding](v8, "hasBottomPadding"));
    -[SFCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", -[SFCardSection separatorStyle](v8, "separatorStyle"));
    -[SFCardSection referencedCommands](v8, "referencedCommands");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setReferencedCommands:](v5, "setReferencedCommands:", v33);

    -[SFCardSection setForceEnable3DTouch:](v5, "setForceEnable3DTouch:", -[SFCardSection forceEnable3DTouch](v8, "forceEnable3DTouch"));
    -[SFCardSection setShouldShowInSmartDialog:](v5, "setShouldShowInSmartDialog:", -[SFCardSection shouldShowInSmartDialog](v8, "shouldShowInSmartDialog"));
    -[SFCardSection appEntityAnnotation](v8, "appEntityAnnotation");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setAppEntityAnnotation:](v5, "setAppEntityAnnotation:", v34);

    -[SFCardSection emphasisSubjectId](v8, "emphasisSubjectId");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setEmphasisSubjectId:](v5, "setEmphasisSubjectId:", v35);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFLeadingTrailingCardSection;
  -[SFCardSection encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBLeadingTrailingCardSection *v2;
  void *v3;

  v2 = -[_SFPBLeadingTrailingCardSection initWithFacade:]([_SFPBLeadingTrailingCardSection alloc], "initWithFacade:", self);
  -[_SFPBLeadingTrailingCardSection dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBLeadingTrailingCardSection *v2;
  void *v3;

  v2 = -[_SFPBLeadingTrailingCardSection initWithFacade:]([_SFPBLeadingTrailingCardSection alloc], "initWithFacade:", self);
  -[_SFPBLeadingTrailingCardSection jsonData](v2, "jsonData");
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
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)SFLeadingTrailingCardSection;
  v4 = -[SFCardSection copyWithZone:](&v20, sel_copyWithZone_, a3);
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
  -[SFLeadingTrailingCardSection type](self, "type");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setType:", v12);

  objc_msgSend(v4, "setSeparatorStyle:", -[SFCardSection separatorStyle](self, "separatorStyle"));
  -[SFCardSection backgroundColor](self, "backgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setBackgroundColor:", v14);

  -[SFLeadingTrailingCardSection leadingCardSections](self, "leadingCardSections");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v4, "setLeadingCardSections:", v16);

  -[SFLeadingTrailingCardSection trailingCardSections](self, "trailingCardSections");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");
  objc_msgSend(v4, "setTrailingCardSections:", v18);

  -[SFLeadingTrailingCardSection leadingToTrailingRatio](self, "leadingToTrailingRatio");
  objc_msgSend(v4, "setLeadingToTrailingRatio:");
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SFLeadingTrailingCardSection *v4;
  SFLeadingTrailingCardSection *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
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
  _BOOL8 v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  double v36;
  double v37;
  double v38;
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

  v4 = (SFLeadingTrailingCardSection *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    if (-[SFLeadingTrailingCardSection isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
    {
      v67.receiver = self;
      v67.super_class = (Class)SFLeadingTrailingCardSection;
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
              -[SFLeadingTrailingCardSection type](self, "type");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              -[SFLeadingTrailingCardSection type](v5, "type");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              if ((v25 == 0) != (v26 != 0))
              {
                v55 = v26;
                v56 = v25;
                -[SFLeadingTrailingCardSection type](self, "type");
                v14 = v64;
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                if (v57)
                {
                  -[SFLeadingTrailingCardSection type](self, "type");
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SFLeadingTrailingCardSection type](v5, "type");
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
                    -[SFLeadingTrailingCardSection leadingCardSections](self, "leadingCardSections");
                    v49 = (void *)objc_claimAutoreleasedReturnValue();
                    -[SFLeadingTrailingCardSection leadingCardSections](v5, "leadingCardSections");
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
                    -[SFLeadingTrailingCardSection leadingCardSections](self, "leadingCardSections");
                    v45 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v45)
                    {
                      -[SFLeadingTrailingCardSection leadingCardSections](self, "leadingCardSections");
                      v31 = (void *)objc_claimAutoreleasedReturnValue();
                      -[SFLeadingTrailingCardSection leadingCardSections](v5, "leadingCardSections");
                      v41 = (void *)objc_claimAutoreleasedReturnValue();
                      v42 = v31;
                      if (!objc_msgSend(v31, "isEqual:"))
                      {
                        v11 = 0;
LABEL_68:

LABEL_69:
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
                    -[SFLeadingTrailingCardSection trailingCardSections](self, "trailingCardSections");
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    v32 = v44 == 0;
                    -[SFLeadingTrailingCardSection trailingCardSections](v5, "trailingCardSections");
                    v43 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v32 == (v43 != 0))
                    {

                      v11 = 0;
                      goto LABEL_67;
                    }
                    -[SFLeadingTrailingCardSection trailingCardSections](self, "trailingCardSections");
                    v40 = (void *)objc_claimAutoreleasedReturnValue();
                    if (!v40
                      || (-[SFLeadingTrailingCardSection trailingCardSections](self, "trailingCardSections"),
                          v33 = objc_claimAutoreleasedReturnValue(),
                          -[SFLeadingTrailingCardSection trailingCardSections](v5, "trailingCardSections"),
                          v34 = objc_claimAutoreleasedReturnValue(),
                          v39 = (void *)v33,
                          v35 = (void *)v33,
                          v32 = v34,
                          objc_msgSend(v35, "isEqual:")))
                    {
                      -[SFLeadingTrailingCardSection leadingToTrailingRatio](self, "leadingToTrailingRatio");
                      v37 = v36;
                      -[SFLeadingTrailingCardSection leadingToTrailingRatio](v5, "leadingToTrailingRatio");
                      v11 = vabdd_f64(v37, v38) < 2.22044605e-16;
                      if (!v40)
                      {
LABEL_66:

LABEL_67:
                        if (!v45)
                          goto LABEL_69;
                        goto LABEL_68;
                      }
                    }
                    else
                    {
                      v11 = 0;
                    }

                    goto LABEL_66;
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
  double v22;
  double v23;
  long double v24;
  unint64_t v25;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)SFLeadingTrailingCardSection;
  v3 = -[SFCardSection hash](&v27, sel_hash);
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
  -[SFLeadingTrailingCardSection type](self, "type");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 ^ objc_msgSend(v13, "hash");
  v15 = v14 ^ -[SFCardSection separatorStyle](self, "separatorStyle");
  -[SFCardSection backgroundColor](self, "backgroundColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v15 ^ objc_msgSend(v16, "hash");
  -[SFLeadingTrailingCardSection leadingCardSections](self, "leadingCardSections");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v11 ^ v17 ^ objc_msgSend(v18, "hash");
  -[SFLeadingTrailingCardSection trailingCardSections](self, "trailingCardSections");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v19 ^ objc_msgSend(v20, "hash");
  -[SFLeadingTrailingCardSection leadingToTrailingRatio](self, "leadingToTrailingRatio");
  v23 = -v22;
  if (v22 >= 0.0)
    v23 = v22;
  v24 = round(v23);
  v25 = v21 ^ ((unint64_t)(fmod(v24, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v23 - v24, 0x40uLL));

  return v25;
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSArray)leadingCardSections
{
  return self->_leadingCardSections;
}

- (void)setLeadingCardSections:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSArray)trailingCardSections
{
  return self->_trailingCardSections;
}

- (void)setTrailingCardSections:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (double)leadingToTrailingRatio
{
  return self->_leadingToTrailingRatio;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingCardSections, 0);
  objc_storeStrong((id *)&self->_leadingCardSections, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
