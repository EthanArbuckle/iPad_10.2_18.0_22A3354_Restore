@implementation RFSummaryItemButtonCardSection

- (RFSummaryItemButtonCardSection)initWithProtobuf:(id)a3
{
  id v4;
  RFSummaryItemButtonCardSection *v5;
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
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  RFTextProperty *v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  RFTextProperty *v37;
  void *v38;
  RFTextProperty *v39;
  void *v40;
  RFTextProperty *v41;
  void *v42;
  RFVisualProperty *v43;
  void *v44;
  RFVisualProperty *v45;
  RFSummaryItemButtonCardSection *v46;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  objc_super v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v56.receiver = self;
  v56.super_class = (Class)RFSummaryItemButtonCardSection;
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
      -[RFSummaryItemButtonCardSection setText_1:](v5, "setText_1:", v9);

    }
    objc_msgSend(v4, "button");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [SFButtonItem alloc];
      objc_msgSend(v4, "button");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[SFButtonItem initWithProtobuf:](v11, "initWithProtobuf:", v12);
      -[RFSummaryItemButtonCardSection setButton_1:](v5, "setButton_1:", v13);

    }
    objc_msgSend(v4, "button");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = [SFButtonItem alloc];
      objc_msgSend(v4, "button");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[SFButtonItem initWithProtobuf:](v15, "initWithProtobuf:", v16);
      -[RFSummaryItemButtonCardSection setButton_2:](v5, "setButton_2:", v17);

    }
    objc_msgSend(v4, "button");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v19 = [SFButtonItem alloc];
      objc_msgSend(v4, "button");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[SFButtonItem initWithProtobuf:](v19, "initWithProtobuf:", v20);
      -[RFSummaryItemButtonCardSection setButton_3:](v5, "setButton_3:", v21);

    }
    objc_msgSend(v4, "text_2s");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
      v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v23 = 0;

    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    objc_msgSend(v4, "text_2s");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v53 != v27)
            objc_enumerationMutation(v24);
          v29 = -[RFTextProperty initWithProtobuf:]([RFTextProperty alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i));
          if (v29)
            objc_msgSend(v23, "addObject:", v29);

        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
      }
      while (v26);
    }

    -[RFSummaryItemButtonCardSection setText_2:](v5, "setText_2:", v23);
    objc_msgSend(v4, "text_3s");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
      v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v31 = 0;

    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    objc_msgSend(v4, "text_3s", 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v49;
      do
      {
        for (j = 0; j != v34; ++j)
        {
          if (*(_QWORD *)v49 != v35)
            objc_enumerationMutation(v32);
          v37 = -[RFTextProperty initWithProtobuf:]([RFTextProperty alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * j));
          if (v37)
            objc_msgSend(v31, "addObject:", v37);

        }
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
      }
      while (v34);
    }

    -[RFSummaryItemButtonCardSection setText_3:](v5, "setText_3:", v31);
    objc_msgSend(v4, "text");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      v39 = [RFTextProperty alloc];
      objc_msgSend(v4, "text");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = -[RFTextProperty initWithProtobuf:](v39, "initWithProtobuf:", v40);
      -[RFSummaryItemButtonCardSection setText_4:](v5, "setText_4:", v41);

    }
    objc_msgSend(v4, "thumbnail");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42)
    {
      v43 = [RFVisualProperty alloc];
      objc_msgSend(v4, "thumbnail");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = -[RFVisualProperty initWithProtobuf:](v43, "initWithProtobuf:", v44);
      -[RFSummaryItemButtonCardSection setThumbnail:](v5, "setThumbnail:", v45);

    }
    if (objc_msgSend(v4, "buttonItemsAreTrailing"))
      -[RFSummaryItemButtonCardSection setButtonItemsAreTrailing:](v5, "setButtonItemsAreTrailing:", objc_msgSend(v4, "buttonItemsAreTrailing"));
    v46 = v5;

  }
  return v5;
}

- (void)setButtonItemsAreTrailing:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_buttonItemsAreTrailing = a3;
}

- (BOOL)hasButtonItemsAreTrailing
{
  return *(_BYTE *)&self->_has & 1;
}

- (RFSummaryItemButtonCardSection)initWithCoder:(id)a3
{
  id v4;
  RFSummaryItemButtonCardSection *v5;
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
    -[SFCardSection text](v8, "text");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFSummaryItemButtonCardSection setText_1:](v5, "setText_1:", v9);

    -[SFCardSection button](v8, "button");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFSummaryItemButtonCardSection setButton_1:](v5, "setButton_1:", v10);

    -[SFCardSection button](v8, "button");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFSummaryItemButtonCardSection setButton_2:](v5, "setButton_2:", v11);

    -[SFCardSection button](v8, "button");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFSummaryItemButtonCardSection setButton_3:](v5, "setButton_3:", v12);

    -[SFCardSection text](v8, "text");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFSummaryItemButtonCardSection setText_2:](v5, "setText_2:", v13);

    -[SFCardSection text](v8, "text");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFSummaryItemButtonCardSection setText_3:](v5, "setText_3:", v14);

    -[SFCardSection text](v8, "text");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFSummaryItemButtonCardSection setText_4:](v5, "setText_4:", v15);

    -[SFCardSection thumbnail](v8, "thumbnail");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFSummaryItemButtonCardSection setThumbnail:](v5, "setThumbnail:", v16);

    -[RFSummaryItemButtonCardSection setButtonItemsAreTrailing:](v5, "setButtonItemsAreTrailing:", -[SFCardSection buttonItemsAreTrailing](v8, "buttonItemsAreTrailing"));
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
  v3.super_class = (Class)RFSummaryItemButtonCardSection;
  -[SFCardSection encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBRFSummaryItemButtonCardSection *v2;
  void *v3;

  v2 = -[_SFPBRFSummaryItemButtonCardSection initWithFacade:]([_SFPBRFSummaryItemButtonCardSection alloc], "initWithFacade:", self);
  -[_SFPBRFSummaryItemButtonCardSection dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBRFSummaryItemButtonCardSection *v2;
  void *v3;

  v2 = -[_SFPBRFSummaryItemButtonCardSection initWithFacade:]([_SFPBRFSummaryItemButtonCardSection alloc], "initWithFacade:", self);
  -[_SFPBRFSummaryItemButtonCardSection jsonData](v2, "jsonData");
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
  v22.super_class = (Class)RFSummaryItemButtonCardSection;
  v4 = -[SFCardSection copyWithZone:](&v22, sel_copyWithZone_, a3);
  -[RFSummaryItemButtonCardSection text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setText_1:", v6);

  -[RFSummaryItemButtonCardSection button](self, "button");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setButton_1:", v8);

  -[RFSummaryItemButtonCardSection button](self, "button");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setButton_2:", v10);

  -[RFSummaryItemButtonCardSection button](self, "button");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setButton_3:", v12);

  -[RFSummaryItemButtonCardSection text](self, "text");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setText_2:", v14);

  -[RFSummaryItemButtonCardSection text](self, "text");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v4, "setText_3:", v16);

  -[RFSummaryItemButtonCardSection text](self, "text");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");
  objc_msgSend(v4, "setText_4:", v18);

  -[RFSummaryItemButtonCardSection thumbnail](self, "thumbnail");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");
  objc_msgSend(v4, "setThumbnail:", v20);

  objc_msgSend(v4, "setButtonItemsAreTrailing:", -[RFSummaryItemButtonCardSection buttonItemsAreTrailing](self, "buttonItemsAreTrailing"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  RFSummaryItemButtonCardSection *v4;
  RFSummaryItemButtonCardSection *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
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
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  _BOOL4 v43;
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
  uint64_t v61;
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
  objc_super v78;

  v4 = (RFSummaryItemButtonCardSection *)a3;
  if (self == v4)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    if (-[RFSummaryItemButtonCardSection isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
    {
      v78.receiver = self;
      v78.super_class = (Class)RFSummaryItemButtonCardSection;
      if (-[SFCardSection isEqual:](&v78, sel_isEqual_, v4))
      {
        v5 = v4;
        -[RFSummaryItemButtonCardSection text](self, "text");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFSummaryItemButtonCardSection text](v5, "text");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v6 == 0) == (v7 != 0))
        {
          LOBYTE(v11) = 0;
LABEL_50:

          goto LABEL_51;
        }
        -[RFSummaryItemButtonCardSection text](self, "text");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          -[RFSummaryItemButtonCardSection text](self, "text");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[RFSummaryItemButtonCardSection text](v5, "text");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v9, "isEqual:", v10))
          {
            LOBYTE(v11) = 0;
LABEL_48:

            goto LABEL_49;
          }
          v76 = v10;
          v77 = v9;
        }
        -[RFSummaryItemButtonCardSection button](self, "button");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFSummaryItemButtonCardSection button](v5, "button");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v12 == 0) == (v13 != 0))
          goto LABEL_46;
        -[RFSummaryItemButtonCardSection button](self, "button");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          -[RFSummaryItemButtonCardSection button](self, "button");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[RFSummaryItemButtonCardSection button](v5, "button");
          v72 = v15;
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v15, "isEqual:", v73))
          {
LABEL_21:

            goto LABEL_22;
          }
        }
        v75 = v14;
        -[RFSummaryItemButtonCardSection button](self, "button");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFSummaryItemButtonCardSection button](v5, "button");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v16 == 0) == (v17 != 0))
        {

          if (!v14)
            goto LABEL_46;
          goto LABEL_21;
        }
        v69 = v16;
        v70 = v17;
        -[RFSummaryItemButtonCardSection button](self, "button");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        if (v71)
        {
          -[RFSummaryItemButtonCardSection button](self, "button");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[RFSummaryItemButtonCardSection button](v5, "button");
          v68 = v18;
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v18, "isEqual:", v67))
          {
LABEL_44:

LABEL_45:
            if (!v14)
            {
LABEL_46:

              LOBYTE(v11) = 0;
              if (!v8)
              {
LABEL_49:

                goto LABEL_50;
              }
              goto LABEL_47;
            }
            goto LABEL_21;
          }
        }
        -[RFSummaryItemButtonCardSection button](self, "button");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFSummaryItemButtonCardSection button](v5, "button");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v19 == 0) == (v20 != 0))
        {

          goto LABEL_43;
        }
        v65 = v19;
        v66 = v20;
        -[RFSummaryItemButtonCardSection button](self, "button");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          -[RFSummaryItemButtonCardSection button](self, "button");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[RFSummaryItemButtonCardSection button](v5, "button");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = v22;
          if (!objc_msgSend(v22, "isEqual:"))
            goto LABEL_34;
        }
        v64 = v21;
        -[RFSummaryItemButtonCardSection text](self, "text");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFSummaryItemButtonCardSection text](v5, "text");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v23 == 0) == (v24 != 0))
        {

          v21 = v64;
          if (!v64)
          {
LABEL_42:

LABEL_43:
            v14 = v75;
            if (!v71)
              goto LABEL_45;
            goto LABEL_44;
          }
LABEL_34:

          goto LABEL_42;
        }
        v59 = v24;
        v60 = v23;
        -[RFSummaryItemButtonCardSection text](self, "text");
        v21 = v64;
        v61 = objc_claimAutoreleasedReturnValue();
        if (v61)
        {
          -[RFSummaryItemButtonCardSection text](self, "text");
          v25 = objc_claimAutoreleasedReturnValue();
          -[RFSummaryItemButtonCardSection text](v5, "text");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = (void *)v25;
          v26 = (void *)v25;
          v27 = (void *)v61;
          if (!objc_msgSend(v26, "isEqual:"))
            goto LABEL_40;
        }
        -[RFSummaryItemButtonCardSection text](self, "text");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFSummaryItemButtonCardSection text](v5, "text");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v28 == 0) == (v29 != 0))
        {

          v21 = v64;
          v27 = (void *)v61;
          if (!v61)
          {
LABEL_41:

            if (!v21)
              goto LABEL_42;
            goto LABEL_34;
          }
LABEL_40:

          goto LABEL_41;
        }
        v54 = v29;
        v55 = v28;
        -[RFSummaryItemButtonCardSection text](self, "text");
        v30 = (void *)v61;
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        if (v56)
        {
          -[RFSummaryItemButtonCardSection text](self, "text");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[RFSummaryItemButtonCardSection text](v5, "text");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = v31;
          v32 = objc_msgSend(v31, "isEqual:");
          v33 = v73;
          if (!v32)
            goto LABEL_59;
        }
        else
        {
          v33 = v73;
        }
        v74 = v33;
        -[RFSummaryItemButtonCardSection text](self, "text");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFSummaryItemButtonCardSection text](v5, "text");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v35 == 0) == (v36 != 0))
        {

          v30 = (void *)v61;
          v33 = v74;
          if (!v56)
          {
LABEL_60:

            if (v30)
            {

            }
            if (v64)
            {

            }
            if (v71)
            {

            }
            v14 = v75;
            if (!v75)
              goto LABEL_23;

LABEL_22:
LABEL_23:

            goto LABEL_46;
          }
LABEL_59:

          goto LABEL_60;
        }
        v49 = v36;
        v50 = v35;
        -[RFSummaryItemButtonCardSection text](self, "text");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        if (v51)
        {
          -[RFSummaryItemButtonCardSection text](self, "text");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[RFSummaryItemButtonCardSection text](v5, "text");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = v37;
          if (!objc_msgSend(v37, "isEqual:"))
          {
            LOBYTE(v11) = 0;
            v38 = (void *)v61;
LABEL_77:

LABEL_78:
            if (v56)
            {

            }
            if (v38)
            {

            }
            if (v64)
            {

            }
            if (v71)
            {

            }
            if (v75)
            {

            }
            if (!v8)
              goto LABEL_49;
LABEL_47:
            v10 = v76;
            v9 = v77;
            goto LABEL_48;
          }
        }
        -[RFSummaryItemButtonCardSection thumbnail](self, "thumbnail");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFSummaryItemButtonCardSection thumbnail](v5, "thumbnail");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v48 == 0) == (v47 != 0))
        {

          LOBYTE(v11) = 0;
          goto LABEL_76;
        }
        -[RFSummaryItemButtonCardSection thumbnail](self, "thumbnail");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v39
          || (-[RFSummaryItemButtonCardSection thumbnail](self, "thumbnail"),
              v40 = objc_claimAutoreleasedReturnValue(),
              -[RFSummaryItemButtonCardSection thumbnail](v5, "thumbnail"),
              v41 = objc_claimAutoreleasedReturnValue(),
              v44 = (void *)v40,
              v42 = (void *)v40,
              v35 = (void *)v41,
              objc_msgSend(v42, "isEqual:")))
        {
          v43 = -[RFSummaryItemButtonCardSection buttonItemsAreTrailing](self, "buttonItemsAreTrailing");
          v11 = v43 ^ -[RFSummaryItemButtonCardSection buttonItemsAreTrailing](v5, "buttonItemsAreTrailing") ^ 1;
          if (!v39)
          {
LABEL_75:

LABEL_76:
            v38 = (void *)v61;
            v35 = v50;
            if (!v51)
              goto LABEL_78;
            goto LABEL_77;
          }
        }
        else
        {
          LOBYTE(v11) = 0;
        }

        goto LABEL_75;
      }
    }
    LOBYTE(v11) = 0;
  }
LABEL_51:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  void *v5;
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
  unint64_t v19;
  void *v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)RFSummaryItemButtonCardSection;
  v3 = -[SFCardSection hash](&v22, sel_hash);
  -[RFSummaryItemButtonCardSection text](self, "text");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v21, "hash");
  -[RFSummaryItemButtonCardSection button](self, "button");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ objc_msgSend(v5, "hash");
  -[RFSummaryItemButtonCardSection button](self, "button");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");
  -[RFSummaryItemButtonCardSection button](self, "button");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8 ^ objc_msgSend(v9, "hash");
  -[RFSummaryItemButtonCardSection text](self, "text");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10 ^ objc_msgSend(v11, "hash") ^ v3;
  -[RFSummaryItemButtonCardSection text](self, "text");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "hash");
  -[RFSummaryItemButtonCardSection text](self, "text");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v14 ^ objc_msgSend(v15, "hash");
  -[RFSummaryItemButtonCardSection thumbnail](self, "thumbnail");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v16 ^ objc_msgSend(v17, "hash");
  v19 = v12 ^ v18 ^ -[RFSummaryItemButtonCardSection buttonItemsAreTrailing](self, "buttonItemsAreTrailing");

  return v19;
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

- (NSArray)text_2
{
  return self->_text_2;
}

- (void)setText_2:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (NSArray)text_3
{
  return self->_text_3;
}

- (void)setText_3:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (RFTextProperty)text_4
{
  return self->_text_4;
}

- (void)setText_4:(id)a3
{
  objc_storeStrong((id *)&self->_text_4, a3);
}

- (RFVisualProperty)thumbnail
{
  return self->_thumbnail;
}

- (void)setThumbnail:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnail, a3);
}

- (BOOL)buttonItemsAreTrailing
{
  return self->_buttonItemsAreTrailing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnail, 0);
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

@end
