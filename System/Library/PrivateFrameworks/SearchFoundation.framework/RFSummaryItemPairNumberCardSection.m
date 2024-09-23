@implementation RFSummaryItemPairNumberCardSection

- (RFSummaryItemPairNumberCardSection)initWithProtobuf:(id)a3
{
  id v4;
  RFSummaryItemPairNumberCardSection *v5;
  void *v6;
  RFTextProperty *v7;
  void *v8;
  RFTextProperty *v9;
  void *v10;
  RFTextProperty *v11;
  void *v12;
  RFTextProperty *v13;
  void *v14;
  RFTextProperty *v15;
  void *v16;
  RFTextProperty *v17;
  void *v18;
  RFTextProperty *v19;
  void *v20;
  RFTextProperty *v21;
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
  RFVisualProperty *v39;
  void *v40;
  RFVisualProperty *v41;
  void *v42;
  RFVisualProperty *v43;
  void *v44;
  RFVisualProperty *v45;
  void *v46;
  RFTextProperty *v47;
  void *v48;
  RFTextProperty *v49;
  void *v50;
  RFTextProperty *v51;
  void *v52;
  RFTextProperty *v53;
  void *v54;
  SFButtonItem *v55;
  void *v56;
  SFButtonItem *v57;
  RFSummaryItemPairNumberCardSection *v58;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  objc_super v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v64.receiver = self;
  v64.super_class = (Class)RFSummaryItemPairNumberCardSection;
  v5 = -[SFCardSection init](&v64, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "number");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [RFTextProperty alloc];
      objc_msgSend(v4, "number");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[RFTextProperty initWithProtobuf:](v7, "initWithProtobuf:", v8);
      -[RFSummaryItemPairNumberCardSection setNumber_1:](v5, "setNumber_1:", v9);

    }
    objc_msgSend(v4, "number");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [RFTextProperty alloc];
      objc_msgSend(v4, "number");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[RFTextProperty initWithProtobuf:](v11, "initWithProtobuf:", v12);
      -[RFSummaryItemPairNumberCardSection setNumber_2:](v5, "setNumber_2:", v13);

    }
    objc_msgSend(v4, "text");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = [RFTextProperty alloc];
      objc_msgSend(v4, "text");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[RFTextProperty initWithProtobuf:](v15, "initWithProtobuf:", v16);
      -[RFSummaryItemPairNumberCardSection setText_1:](v5, "setText_1:", v17);

    }
    objc_msgSend(v4, "text");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v19 = [RFTextProperty alloc];
      objc_msgSend(v4, "text");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[RFTextProperty initWithProtobuf:](v19, "initWithProtobuf:", v20);
      -[RFSummaryItemPairNumberCardSection setText_2:](v5, "setText_2:", v21);

    }
    objc_msgSend(v4, "text");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      v23 = [RFTextProperty alloc];
      objc_msgSend(v4, "text");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[RFTextProperty initWithProtobuf:](v23, "initWithProtobuf:", v24);
      -[RFSummaryItemPairNumberCardSection setText_3:](v5, "setText_3:", v25);

    }
    objc_msgSend(v4, "text");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      v27 = [RFTextProperty alloc];
      objc_msgSend(v4, "text");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = -[RFTextProperty initWithProtobuf:](v27, "initWithProtobuf:", v28);
      -[RFSummaryItemPairNumberCardSection setText_4:](v5, "setText_4:", v29);

    }
    objc_msgSend(v4, "text_5s");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
      v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v31 = 0;

    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    objc_msgSend(v4, "text_5s", 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v61;
      do
      {
        for (i = 0; i != v34; ++i)
        {
          if (*(_QWORD *)v61 != v35)
            objc_enumerationMutation(v32);
          v37 = -[RFTextProperty initWithProtobuf:]([RFTextProperty alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * i));
          if (v37)
            objc_msgSend(v31, "addObject:", v37);

        }
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
      }
      while (v34);
    }

    -[RFSummaryItemPairNumberCardSection setText_5:](v5, "setText_5:", v31);
    objc_msgSend(v4, "thumbnail");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      v39 = [RFVisualProperty alloc];
      objc_msgSend(v4, "thumbnail");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = -[RFVisualProperty initWithProtobuf:](v39, "initWithProtobuf:", v40);
      -[RFSummaryItemPairNumberCardSection setThumbnail_1:](v5, "setThumbnail_1:", v41);

    }
    objc_msgSend(v4, "thumbnail");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42)
    {
      v43 = [RFVisualProperty alloc];
      objc_msgSend(v4, "thumbnail");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = -[RFVisualProperty initWithProtobuf:](v43, "initWithProtobuf:", v44);
      -[RFSummaryItemPairNumberCardSection setThumbnail_2:](v5, "setThumbnail_2:", v45);

    }
    objc_msgSend(v4, "text");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (v46)
    {
      v47 = [RFTextProperty alloc];
      objc_msgSend(v4, "text");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = -[RFTextProperty initWithProtobuf:](v47, "initWithProtobuf:", v48);
      -[RFSummaryItemPairNumberCardSection setText_6:](v5, "setText_6:", v49);

    }
    objc_msgSend(v4, "text");
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    if (v50)
    {
      v51 = [RFTextProperty alloc];
      objc_msgSend(v4, "text");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = -[RFTextProperty initWithProtobuf:](v51, "initWithProtobuf:", v52);
      -[RFSummaryItemPairNumberCardSection setText_7:](v5, "setText_7:", v53);

    }
    objc_msgSend(v4, "button");
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    if (v54)
    {
      v55 = [SFButtonItem alloc];
      objc_msgSend(v4, "button");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = -[SFButtonItem initWithProtobuf:](v55, "initWithProtobuf:", v56);
      -[RFSummaryItemPairNumberCardSection setButton_1:](v5, "setButton_1:", v57);

    }
    v58 = v5;

  }
  return v5;
}

- (RFSummaryItemPairNumberCardSection)initWithCoder:(id)a3
{
  id v4;
  RFSummaryItemPairNumberCardSection *v5;
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

  v4 = a3;
  v5 = -[SFCardSection init](self, "init");
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[_SFPBCardSection initWithData:]([_SFPBCardSection alloc], "initWithData:", v6);
  v8 = -[SFCardSection initWithProtobuf:]([SFCardSection alloc], "initWithProtobuf:", v7);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SFCardSection number](v8, "number");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFSummaryItemPairNumberCardSection setNumber_1:](v5, "setNumber_1:", v9);

    -[SFCardSection number](v8, "number");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFSummaryItemPairNumberCardSection setNumber_2:](v5, "setNumber_2:", v10);

    -[SFCardSection text](v8, "text");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFSummaryItemPairNumberCardSection setText_1:](v5, "setText_1:", v11);

    -[SFCardSection text](v8, "text");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFSummaryItemPairNumberCardSection setText_2:](v5, "setText_2:", v12);

    -[SFCardSection text](v8, "text");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFSummaryItemPairNumberCardSection setText_3:](v5, "setText_3:", v13);

    -[SFCardSection text](v8, "text");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFSummaryItemPairNumberCardSection setText_4:](v5, "setText_4:", v14);

    -[SFCardSection text](v8, "text");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFSummaryItemPairNumberCardSection setText_5:](v5, "setText_5:", v15);

    -[SFCardSection thumbnail](v8, "thumbnail");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFSummaryItemPairNumberCardSection setThumbnail_1:](v5, "setThumbnail_1:", v16);

    -[SFCardSection thumbnail](v8, "thumbnail");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFSummaryItemPairNumberCardSection setThumbnail_2:](v5, "setThumbnail_2:", v17);

    -[SFCardSection text](v8, "text");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFSummaryItemPairNumberCardSection setText_6:](v5, "setText_6:", v18);

    -[SFCardSection text](v8, "text");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFSummaryItemPairNumberCardSection setText_7:](v5, "setText_7:", v19);

    -[SFCardSection button](v8, "button");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFSummaryItemPairNumberCardSection setButton_1:](v5, "setButton_1:", v20);

    -[SFCardSection nextCard](v8, "nextCard");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setNextCard:](v5, "setNextCard:", v21);

    -[SFCardSection commands](v8, "commands");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCommands:](v5, "setCommands:", v22);

    -[SFCardSection parameterKeyPaths](v8, "parameterKeyPaths");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setParameterKeyPaths:](v5, "setParameterKeyPaths:", v23);

    -[SFCardSection cardSectionId](v8, "cardSectionId");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCardSectionId:](v5, "setCardSectionId:", v24);

    -[SFCardSection resultIdentifier](v8, "resultIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setResultIdentifier:](v5, "setResultIdentifier:", v25);

    -[SFCardSection userReportRequest](v8, "userReportRequest");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setUserReportRequest:](v5, "setUserReportRequest:", v26);

    -[SFCardSection command](v8, "command");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCommand:](v5, "setCommand:", v27);

    -[SFCardSection previewCommand](v8, "previewCommand");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewCommand:](v5, "setPreviewCommand:", v28);

    -[SFCardSection previewButtonItems](v8, "previewButtonItems");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewButtonItems:](v5, "setPreviewButtonItems:", v29);

    -[SFCardSection cardSectionDetail](v8, "cardSectionDetail");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCardSectionDetail:](v5, "setCardSectionDetail:", v30);

    -[SFCardSection previewButtonItemsTitle](v8, "previewButtonItemsTitle");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewButtonItemsTitle:](v5, "setPreviewButtonItemsTitle:", v31);

    -[SFCardSection backgroundColor](v8, "backgroundColor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setBackgroundColor:](v5, "setBackgroundColor:", v32);

    -[SFCardSection setShouldHideInAmbientMode:](v5, "setShouldHideInAmbientMode:", -[SFCardSection shouldHideInAmbientMode](v8, "shouldHideInAmbientMode"));
    -[SFCardSection leadingSwipeButtonItems](v8, "leadingSwipeButtonItems");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setLeadingSwipeButtonItems:](v5, "setLeadingSwipeButtonItems:", v33);

    -[SFCardSection trailingSwipeButtonItems](v8, "trailingSwipeButtonItems");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setTrailingSwipeButtonItems:](v5, "setTrailingSwipeButtonItems:", v34);

    -[SFCardSection punchoutOptions](v8, "punchoutOptions");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutOptions:](v5, "setPunchoutOptions:", v35);

    -[SFCardSection punchoutPickerTitle](v8, "punchoutPickerTitle");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerTitle:](v5, "setPunchoutPickerTitle:", v36);

    -[SFCardSection punchoutPickerDismissText](v8, "punchoutPickerDismissText");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerDismissText:](v5, "setPunchoutPickerDismissText:", v37);

    -[SFCardSection setCanBeHidden:](v5, "setCanBeHidden:", -[SFCardSection canBeHidden](v8, "canBeHidden"));
    -[SFCardSection setHasTopPadding:](v5, "setHasTopPadding:", -[SFCardSection hasTopPadding](v8, "hasTopPadding"));
    -[SFCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", -[SFCardSection hasBottomPadding](v8, "hasBottomPadding"));
    -[SFCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", -[SFCardSection separatorStyle](v8, "separatorStyle"));
    -[SFCardSection referencedCommands](v8, "referencedCommands");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setReferencedCommands:](v5, "setReferencedCommands:", v38);

    -[SFCardSection setForceEnable3DTouch:](v5, "setForceEnable3DTouch:", -[SFCardSection forceEnable3DTouch](v8, "forceEnable3DTouch"));
    -[SFCardSection setShouldShowInSmartDialog:](v5, "setShouldShowInSmartDialog:", -[SFCardSection shouldShowInSmartDialog](v8, "shouldShowInSmartDialog"));
    -[SFCardSection appEntityAnnotation](v8, "appEntityAnnotation");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setAppEntityAnnotation:](v5, "setAppEntityAnnotation:", v39);

    -[SFCardSection emphasisSubjectId](v8, "emphasisSubjectId");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setEmphasisSubjectId:](v5, "setEmphasisSubjectId:", v40);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RFSummaryItemPairNumberCardSection;
  -[SFCardSection encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBRFSummaryItemPairNumberCardSection *v2;
  void *v3;

  v2 = -[_SFPBRFSummaryItemPairNumberCardSection initWithFacade:]([_SFPBRFSummaryItemPairNumberCardSection alloc], "initWithFacade:", self);
  -[_SFPBRFSummaryItemPairNumberCardSection dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBRFSummaryItemPairNumberCardSection *v2;
  void *v3;

  v2 = -[_SFPBRFSummaryItemPairNumberCardSection initWithFacade:]([_SFPBRFSummaryItemPairNumberCardSection alloc], "initWithFacade:", self);
  -[_SFPBRFSummaryItemPairNumberCardSection jsonData](v2, "jsonData");
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
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)RFSummaryItemPairNumberCardSection;
  v4 = -[SFCardSection copyWithZone:](&v30, sel_copyWithZone_, a3);
  -[RFSummaryItemPairNumberCardSection number](self, "number");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setNumber_1:", v6);

  -[RFSummaryItemPairNumberCardSection number](self, "number");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setNumber_2:", v8);

  -[RFSummaryItemPairNumberCardSection text](self, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setText_1:", v10);

  -[RFSummaryItemPairNumberCardSection text](self, "text");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setText_2:", v12);

  -[RFSummaryItemPairNumberCardSection text](self, "text");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setText_3:", v14);

  -[RFSummaryItemPairNumberCardSection text](self, "text");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v4, "setText_4:", v16);

  -[RFSummaryItemPairNumberCardSection text](self, "text");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");
  objc_msgSend(v4, "setText_5:", v18);

  -[RFSummaryItemPairNumberCardSection thumbnail](self, "thumbnail");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");
  objc_msgSend(v4, "setThumbnail_1:", v20);

  -[RFSummaryItemPairNumberCardSection thumbnail](self, "thumbnail");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "copy");
  objc_msgSend(v4, "setThumbnail_2:", v22);

  -[RFSummaryItemPairNumberCardSection text](self, "text");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v23, "copy");
  objc_msgSend(v4, "setText_6:", v24);

  -[RFSummaryItemPairNumberCardSection text](self, "text");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v25, "copy");
  objc_msgSend(v4, "setText_7:", v26);

  -[RFSummaryItemPairNumberCardSection button](self, "button");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v27, "copy");
  objc_msgSend(v4, "setButton_1:", v28);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  RFSummaryItemPairNumberCardSection *v4;
  RFSummaryItemPairNumberCardSection *v5;
  void *v6;
  void *v7;
  uint64_t v8;
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
  char v19;
  uint64_t v20;
  _BOOL4 v21;
  void *v22;
  RFSummaryItemPairNumberCardSection *v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
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
  uint64_t v108;
  int v109;
  uint64_t v110;
  _BYTE v111[44];
  uint64_t v112;
  int v113;
  int v114;
  id v115;
  id v116;
  _BYTE v117[36];
  objc_super v118;

  v4 = (RFSummaryItemPairNumberCardSection *)a3;
  if (self == v4)
  {
    v19 = 1;
    goto LABEL_85;
  }
  if (!-[RFSummaryItemPairNumberCardSection isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class())
    || (v118.receiver = self,
        v118.super_class = (Class)RFSummaryItemPairNumberCardSection,
        !-[SFCardSection isEqual:](&v118, sel_isEqual_, v4)))
  {
    v19 = 0;
    goto LABEL_85;
  }
  v5 = v4;
  -[RFSummaryItemPairNumberCardSection number](self, "number");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RFSummaryItemPairNumberCardSection number](v5, "number");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 != 0;
  v115 = v7;
  v116 = v6;
  v113 = v8;
  v114 = v6 == 0;
  if (v114 == (_DWORD)v8)
  {
    v112 = 0;
    memset(v111, 0, sizeof(v111));
    v110 = 0;
    v108 = 0;
    v12 = 0;
    v109 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    memset(v117, 0, sizeof(v117));
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v19 = 0;
  }
  else
  {
    -[RFSummaryItemPairNumberCardSection number](self, "number");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9 != 0;
    v107 = (void *)v9;
    if (!v9
      || (-[RFSummaryItemPairNumberCardSection number](self, "number"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          -[RFSummaryItemPairNumberCardSection number](v5, "number"),
          v103 = (void *)objc_claimAutoreleasedReturnValue(),
          v104 = v11,
          objc_msgSend(v11, "isEqual:")))
    {
      -[RFSummaryItemPairNumberCardSection number](self, "number");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFSummaryItemPairNumberCardSection number](v5, "number");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      HIDWORD(v112) = v10;
      if ((v106 == 0) == (v105 != 0))
      {
        LODWORD(v112) = 0;
        memset(v111, 0, 40);
        v110 = 0;
        v108 = 0;
        v12 = 0;
        v109 = 0;
        v13 = 0;
        v14 = 0;
        v15 = 0;
        memset(v117, 0, sizeof(v117));
        v16 = 0;
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_DWORD *)&v111[40] = 1;
      }
      else
      {
        -[RFSummaryItemPairNumberCardSection number](self, "number");
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = v20 != 0;
        v102 = (void *)v20;
        if (!v20
          || (-[RFSummaryItemPairNumberCardSection number](self, "number"),
              v22 = (void *)objc_claimAutoreleasedReturnValue(),
              -[RFSummaryItemPairNumberCardSection number](v5, "number"),
              v98 = (void *)objc_claimAutoreleasedReturnValue(),
              v99 = v22,
              objc_msgSend(v22, "isEqual:")))
        {
          -[RFSummaryItemPairNumberCardSection text](self, "text");
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          -[RFSummaryItemPairNumberCardSection text](v5, "text");
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v112) = v21;
          if ((v101 == 0) == (v100 != 0))
          {
            memset(v111, 0, 28);
            v110 = 0;
            v108 = 0;
            v12 = 0;
            v109 = 0;
            v13 = 0;
            v14 = 0;
            v15 = 0;
            memset(v117, 0, sizeof(v117));
            v16 = 0;
            v17 = 0;
            v18 = 0;
            v19 = 0;
            *(_QWORD *)&v111[36] = 0x100000001;
            *(_QWORD *)&v111[28] = 1;
          }
          else
          {
            -[RFSummaryItemPairNumberCardSection text](self, "text");
            v31 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)&v117[32] = v31 != 0;
            v97 = (void *)v31;
            if (!v31
              || (-[RFSummaryItemPairNumberCardSection text](self, "text"),
                  v32 = (void *)objc_claimAutoreleasedReturnValue(),
                  -[RFSummaryItemPairNumberCardSection text](v5, "text"),
                  v93 = (void *)objc_claimAutoreleasedReturnValue(),
                  v94 = v32,
                  objc_msgSend(v32, "isEqual:")))
            {
              -[RFSummaryItemPairNumberCardSection text](self, "text");
              v96 = (void *)objc_claimAutoreleasedReturnValue();
              -[RFSummaryItemPairNumberCardSection text](v5, "text");
              v95 = (void *)objc_claimAutoreleasedReturnValue();
              if ((v96 == 0) == (v95 != 0))
              {
                memset(v111, 0, 20);
                v110 = 0;
                v108 = 0;
                v12 = 0;
                v109 = 0;
                v13 = 0;
                memset(v117, 0, 32);
                v14 = 0;
                v15 = 0;
                v16 = 0;
                v17 = 0;
                v18 = 0;
                v19 = 0;
                *(_QWORD *)&v111[36] = 0x100000001;
                *(_QWORD *)&v111[28] = 0x100000001;
                *(_QWORD *)&v111[20] = 1;
              }
              else
              {
                -[RFSummaryItemPairNumberCardSection text](self, "text");
                v33 = objc_claimAutoreleasedReturnValue();
                *(_DWORD *)&v117[28] = v33 != 0;
                v92 = (void *)v33;
                if (!v33
                  || (-[RFSummaryItemPairNumberCardSection text](self, "text"),
                      v34 = (void *)objc_claimAutoreleasedReturnValue(),
                      -[RFSummaryItemPairNumberCardSection text](v5, "text"),
                      v88 = (void *)objc_claimAutoreleasedReturnValue(),
                      v89 = v34,
                      objc_msgSend(v34, "isEqual:")))
                {
                  -[RFSummaryItemPairNumberCardSection text](self, "text");
                  v91 = (void *)objc_claimAutoreleasedReturnValue();
                  -[RFSummaryItemPairNumberCardSection text](v5, "text");
                  v90 = (void *)objc_claimAutoreleasedReturnValue();
                  if ((v91 == 0) == (v90 != 0))
                  {
                    *(_DWORD *)&v111[16] = 0;
                    *(_QWORD *)v111 = 0;
                    *(_QWORD *)&v111[8] = 0x100000000;
                    v110 = 0;
                    v108 = 0;
                    v12 = 0;
                    v109 = 0;
                    v13 = 0;
                    v14 = 0;
                    v15 = 0;
                    memset(v117, 0, 28);
                    v16 = 0;
                    v17 = 0;
                    v18 = 0;
                    v19 = 0;
                    *(_QWORD *)&v111[36] = 0x100000001;
                    *(_QWORD *)&v111[28] = 0x100000001;
                    *(_QWORD *)&v111[20] = 0x100000001;
                  }
                  else
                  {
                    -[RFSummaryItemPairNumberCardSection text](self, "text");
                    v35 = objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)&v117[24] = v35 != 0;
                    v87 = (void *)v35;
                    if (!v35
                      || (-[RFSummaryItemPairNumberCardSection text](self, "text"),
                          v36 = (void *)objc_claimAutoreleasedReturnValue(),
                          -[RFSummaryItemPairNumberCardSection text](v5, "text"),
                          v83 = (void *)objc_claimAutoreleasedReturnValue(),
                          v84 = v36,
                          objc_msgSend(v36, "isEqual:")))
                    {
                      -[RFSummaryItemPairNumberCardSection text](self, "text");
                      v37 = objc_claimAutoreleasedReturnValue();
                      -[RFSummaryItemPairNumberCardSection text](v5, "text");
                      v85 = (void *)objc_claimAutoreleasedReturnValue();
                      v86 = (void *)v37;
                      if ((v37 == 0) == (v85 != 0))
                      {
                        *(_QWORD *)&v111[4] = 0;
                        v110 = 0;
                        v108 = 0;
                        v12 = 0;
                        v109 = 0;
                        v13 = 0;
                        memset(v117, 0, 24);
                        v14 = 0;
                        v15 = 0;
                        v16 = 0;
                        v17 = 0;
                        v18 = 0;
                        v19 = 0;
                        *(_QWORD *)&v111[36] = 0x100000001;
                        *(_QWORD *)&v111[28] = 0x100000001;
                        *(_QWORD *)&v111[20] = 0x100000001;
                        *(_DWORD *)&v111[12] = 1;
                        *(_DWORD *)&v111[16] = 1;
                        *(_DWORD *)v111 = 1;
                      }
                      else
                      {
                        -[RFSummaryItemPairNumberCardSection text](self, "text");
                        v38 = objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)&v117[20] = v38 != 0;
                        v82 = (void *)v38;
                        if (!v38
                          || (-[RFSummaryItemPairNumberCardSection text](self, "text"),
                              v39 = (void *)objc_claimAutoreleasedReturnValue(),
                              -[RFSummaryItemPairNumberCardSection text](v5, "text"),
                              v78 = (void *)objc_claimAutoreleasedReturnValue(),
                              v79 = v39,
                              objc_msgSend(v39, "isEqual:")))
                        {
                          -[RFSummaryItemPairNumberCardSection text](self, "text");
                          v81 = (void *)objc_claimAutoreleasedReturnValue();
                          -[RFSummaryItemPairNumberCardSection text](v5, "text");
                          v80 = (void *)objc_claimAutoreleasedReturnValue();
                          if ((v81 == 0) == (v80 != 0))
                          {
                            v108 = 0;
                            v12 = 0;
                            v109 = 0;
                            v13 = 0;
                            v14 = 0;
                            v15 = 0;
                            memset(v117, 0, 20);
                            v16 = 0;
                            v17 = 0;
                            v18 = 0;
                            v19 = 0;
                            *(_QWORD *)&v111[36] = 0x100000001;
                            *(_QWORD *)&v111[28] = 0x100000001;
                            *(_QWORD *)&v111[20] = 0x100000001;
                            *(_DWORD *)&v111[16] = 1;
                            *(_QWORD *)v111 = 1;
                            *(_QWORD *)&v111[8] = 0x100000001;
                            v110 = 1;
                          }
                          else
                          {
                            -[RFSummaryItemPairNumberCardSection text](self, "text");
                            v40 = objc_claimAutoreleasedReturnValue();
                            *(_DWORD *)&v117[16] = v40 != 0;
                            v77 = (void *)v40;
                            if (!v40
                              || (-[RFSummaryItemPairNumberCardSection text](self, "text"),
                                  v41 = (void *)objc_claimAutoreleasedReturnValue(),
                                  -[RFSummaryItemPairNumberCardSection text](v5, "text"),
                                  v73 = (void *)objc_claimAutoreleasedReturnValue(),
                                  v74 = v41,
                                  objc_msgSend(v41, "isEqual:")))
                            {
                              -[RFSummaryItemPairNumberCardSection thumbnail](self, "thumbnail");
                              v76 = (void *)objc_claimAutoreleasedReturnValue();
                              -[RFSummaryItemPairNumberCardSection thumbnail](v5, "thumbnail");
                              v75 = (void *)objc_claimAutoreleasedReturnValue();
                              if ((v76 == 0) == (v75 != 0))
                              {
                                *(_QWORD *)&v117[8] = 0;
                                v108 = 0x100000000;
                                v12 = 0;
                                v13 = 0;
                                *(_QWORD *)v117 = 0;
                                v14 = 0;
                                v15 = 0;
                                v16 = 0;
                                v17 = 0;
                                v18 = 0;
                                v19 = 0;
                                *(_QWORD *)&v111[36] = 0x100000001;
                                *(_QWORD *)&v111[28] = 0x100000001;
                                *(_QWORD *)&v111[20] = 0x100000001;
                                *(_DWORD *)&v111[16] = 1;
                                *(_QWORD *)v111 = 0x100000001;
                                *(_QWORD *)&v111[8] = 0x100000001;
                                v109 = 0;
                                v110 = 1;
                              }
                              else
                              {
                                -[RFSummaryItemPairNumberCardSection thumbnail](self, "thumbnail");
                                v42 = objc_claimAutoreleasedReturnValue();
                                *(_DWORD *)&v117[12] = v42 != 0;
                                v72 = (void *)v42;
                                if (!v42
                                  || (-[RFSummaryItemPairNumberCardSection thumbnail](self, "thumbnail"),
                                      v43 = (void *)objc_claimAutoreleasedReturnValue(),
                                      -[RFSummaryItemPairNumberCardSection thumbnail](v5, "thumbnail"),
                                      v68 = (void *)objc_claimAutoreleasedReturnValue(),
                                      v69 = v43,
                                      objc_msgSend(v43, "isEqual:")))
                                {
                                  -[RFSummaryItemPairNumberCardSection thumbnail](self, "thumbnail");
                                  v71 = (void *)objc_claimAutoreleasedReturnValue();
                                  -[RFSummaryItemPairNumberCardSection thumbnail](v5, "thumbnail");
                                  v70 = (void *)objc_claimAutoreleasedReturnValue();
                                  if ((v71 == 0) == (v70 != 0))
                                  {
                                    v12 = 0;
                                    *(_QWORD *)&v117[4] = 0;
                                    v13 = 0;
                                    v14 = 0;
                                    v15 = 0;
                                    *(_DWORD *)v117 = 0;
                                    v16 = 0;
                                    v17 = 0;
                                    v18 = 0;
                                    v19 = 0;
                                    *(_QWORD *)&v111[36] = 0x100000001;
                                    *(_QWORD *)&v111[28] = 0x100000001;
                                    *(_QWORD *)&v111[20] = 0x100000001;
                                    *(_DWORD *)&v111[16] = 1;
                                    *(_QWORD *)v111 = 0x100000001;
                                    *(_QWORD *)&v111[8] = 0x100000001;
                                    v109 = 0;
                                    v110 = 0x100000001;
                                    v108 = 0x100000001;
                                  }
                                  else
                                  {
                                    -[RFSummaryItemPairNumberCardSection thumbnail](self, "thumbnail");
                                    v44 = objc_claimAutoreleasedReturnValue();
                                    *(_DWORD *)&v117[8] = v44 != 0;
                                    v67 = (void *)v44;
                                    if (!v44
                                      || (-[RFSummaryItemPairNumberCardSection thumbnail](self, "thumbnail"),
                                          v45 = (void *)objc_claimAutoreleasedReturnValue(),
                                          -[RFSummaryItemPairNumberCardSection thumbnail](v5, "thumbnail"),
                                          v63 = (void *)objc_claimAutoreleasedReturnValue(),
                                          v64 = v45,
                                          objc_msgSend(v45, "isEqual:")))
                                    {
                                      -[RFSummaryItemPairNumberCardSection text](self, "text");
                                      v66 = (void *)objc_claimAutoreleasedReturnValue();
                                      -[RFSummaryItemPairNumberCardSection text](v5, "text");
                                      v65 = (void *)objc_claimAutoreleasedReturnValue();
                                      if ((v66 == 0) == (v65 != 0))
                                      {
                                        v13 = 0;
                                        *(_QWORD *)v117 = 0;
                                        v14 = 0;
                                        v15 = 0;
                                        v16 = 0;
                                        v17 = 0;
                                        v18 = 0;
                                        v19 = 0;
                                        *(_QWORD *)&v111[36] = 0x100000001;
                                        *(_QWORD *)&v111[28] = 0x100000001;
                                        *(_QWORD *)&v111[20] = 0x100000001;
                                        *(_DWORD *)&v111[16] = 1;
                                        *(_QWORD *)v111 = 0x100000001;
                                        *(_QWORD *)&v111[8] = 0x100000001;
                                        v110 = 0x100000001;
                                        v108 = 0x100000001;
                                        v12 = 1;
                                        v109 = 1;
                                      }
                                      else
                                      {
                                        -[RFSummaryItemPairNumberCardSection text](self, "text");
                                        v46 = objc_claimAutoreleasedReturnValue();
                                        *(_DWORD *)&v117[4] = v46 != 0;
                                        v62 = (void *)v46;
                                        if (!v46
                                          || (-[RFSummaryItemPairNumberCardSection text](self, "text"),
                                              v47 = (void *)objc_claimAutoreleasedReturnValue(),
                                              -[RFSummaryItemPairNumberCardSection text](v5, "text"),
                                              v58 = (void *)objc_claimAutoreleasedReturnValue(),
                                              v59 = v47,
                                              objc_msgSend(v47, "isEqual:")))
                                        {
                                          -[RFSummaryItemPairNumberCardSection text](self, "text");
                                          v61 = (void *)objc_claimAutoreleasedReturnValue();
                                          -[RFSummaryItemPairNumberCardSection text](v5, "text");
                                          v60 = (void *)objc_claimAutoreleasedReturnValue();
                                          if ((v61 == 0) == (v60 != 0))
                                          {
                                            v15 = 0;
                                            *(_DWORD *)v117 = 0;
                                            v16 = 0;
                                            v17 = 0;
                                            v18 = 0;
                                            v19 = 0;
                                            *(_QWORD *)&v111[36] = 0x100000001;
                                            *(_QWORD *)&v111[28] = 0x100000001;
                                            *(_QWORD *)&v111[20] = 0x100000001;
                                            *(_DWORD *)&v111[16] = 1;
                                            *(_QWORD *)v111 = 0x100000001;
                                            *(_QWORD *)&v111[8] = 0x100000001;
                                            v110 = 0x100000001;
                                            v108 = 0x100000001;
                                            v12 = 1;
                                            v109 = 1;
                                            v13 = 1;
                                            v14 = 1;
                                          }
                                          else
                                          {
                                            -[RFSummaryItemPairNumberCardSection text](self, "text");
                                            v48 = objc_claimAutoreleasedReturnValue();
                                            *(_DWORD *)v117 = v48 != 0;
                                            v57 = (void *)v48;
                                            if (!v48
                                              || (-[RFSummaryItemPairNumberCardSection text](self, "text"),
                                                  v49 = (void *)objc_claimAutoreleasedReturnValue(),
                                                  -[RFSummaryItemPairNumberCardSection text](v5, "text"),
                                                  v53 = (void *)objc_claimAutoreleasedReturnValue(),
                                                  v54 = v49,
                                                  objc_msgSend(v49, "isEqual:")))
                                            {
                                              -[RFSummaryItemPairNumberCardSection button](self, "button");
                                              v56 = (void *)objc_claimAutoreleasedReturnValue();
                                              -[RFSummaryItemPairNumberCardSection button](v5, "button");
                                              v55 = (void *)objc_claimAutoreleasedReturnValue();
                                              if ((v56 == 0) == (v55 != 0))
                                              {
                                                v17 = 0;
                                                v18 = 0;
                                                v19 = 0;
                                                *(_QWORD *)&v111[36] = 0x100000001;
                                                *(_QWORD *)&v111[28] = 0x100000001;
                                                *(_QWORD *)&v111[20] = 0x100000001;
                                                *(_DWORD *)&v111[16] = 1;
                                                *(_QWORD *)v111 = 0x100000001;
                                                *(_QWORD *)&v111[8] = 0x100000001;
                                                v110 = 0x100000001;
                                                v108 = 0x100000001;
                                                v12 = 1;
                                                v109 = 1;
                                                v13 = 1;
                                                v14 = 1;
                                                v15 = 1;
                                                v16 = 1;
                                              }
                                              else
                                              {
                                                -[RFSummaryItemPairNumberCardSection button](self, "button");
                                                v52 = (void *)objc_claimAutoreleasedReturnValue();
                                                if (v52)
                                                {
                                                  -[RFSummaryItemPairNumberCardSection button](self, "button");
                                                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                                                  -[RFSummaryItemPairNumberCardSection button](v5, "button");
                                                  v8 = objc_claimAutoreleasedReturnValue();
                                                  v51 = v50;
                                                  v19 = objc_msgSend(v50, "isEqual:", v8);
                                                  v18 = 1;
                                                  *(_QWORD *)&v111[36] = 0x100000001;
                                                  *(_QWORD *)&v111[28] = 0x100000001;
                                                  *(_QWORD *)&v111[20] = 0x100000001;
                                                  *(_DWORD *)&v111[16] = 1;
                                                  *(_QWORD *)v111 = 0x100000001;
                                                  *(_QWORD *)&v111[8] = 0x100000001;
                                                  v110 = 0x100000001;
                                                  v108 = 0x100000001;
                                                  v12 = 1;
                                                  v109 = 1;
                                                  v13 = 1;
                                                  v14 = 1;
                                                  v15 = 1;
                                                  v16 = 1;
                                                  v17 = 1;
                                                }
                                                else
                                                {
                                                  v52 = 0;
                                                  v18 = 0;
                                                  *(_QWORD *)&v111[36] = 0x100000001;
                                                  *(_QWORD *)&v111[28] = 0x100000001;
                                                  *(_QWORD *)&v111[20] = 0x100000001;
                                                  *(_DWORD *)&v111[16] = 1;
                                                  *(_QWORD *)v111 = 0x100000001;
                                                  *(_QWORD *)&v111[8] = 0x100000001;
                                                  v110 = 0x100000001;
                                                  v108 = 0x100000001;
                                                  v12 = 1;
                                                  v109 = 1;
                                                  v13 = 1;
                                                  v14 = 1;
                                                  v15 = 1;
                                                  v16 = 1;
                                                  v17 = 1;
                                                  v19 = 1;
                                                }
                                              }
                                            }
                                            else
                                            {
                                              v16 = 0;
                                              v17 = 0;
                                              v18 = 0;
                                              v19 = 0;
                                              *(_QWORD *)&v111[36] = 0x100000001;
                                              *(_QWORD *)&v111[28] = 0x100000001;
                                              *(_QWORD *)&v111[20] = 0x100000001;
                                              *(_DWORD *)&v111[16] = 1;
                                              *(_QWORD *)v111 = 0x100000001;
                                              *(_QWORD *)&v111[8] = 0x100000001;
                                              v110 = 0x100000001;
                                              v108 = 0x100000001;
                                              v12 = 1;
                                              v109 = 1;
                                              v13 = 1;
                                              v14 = 1;
                                              v15 = 1;
                                              *(_DWORD *)v117 = 1;
                                            }
                                          }
                                        }
                                        else
                                        {
                                          v14 = 0;
                                          v15 = 0;
                                          *(_QWORD *)v117 = 0x100000000;
                                          v16 = 0;
                                          v17 = 0;
                                          v18 = 0;
                                          v19 = 0;
                                          *(_QWORD *)&v111[36] = 0x100000001;
                                          *(_QWORD *)&v111[28] = 0x100000001;
                                          *(_QWORD *)&v111[20] = 0x100000001;
                                          *(_DWORD *)&v111[16] = 1;
                                          *(_QWORD *)v111 = 0x100000001;
                                          *(_QWORD *)&v111[8] = 0x100000001;
                                          v110 = 0x100000001;
                                          v108 = 0x100000001;
                                          v12 = 1;
                                          v109 = 1;
                                          v13 = 1;
                                        }
                                      }
                                    }
                                    else
                                    {
                                      v13 = 0;
                                      *(_QWORD *)v117 = 0;
                                      v14 = 0;
                                      v15 = 0;
                                      v16 = 0;
                                      v17 = 0;
                                      v18 = 0;
                                      v19 = 0;
                                      *(_QWORD *)&v111[36] = 0x100000001;
                                      *(_QWORD *)&v111[28] = 0x100000001;
                                      *(_QWORD *)&v111[20] = 0x100000001;
                                      *(_DWORD *)&v111[16] = 1;
                                      *(_QWORD *)v111 = 0x100000001;
                                      *(_QWORD *)&v111[8] = 0x100000001;
                                      v109 = 0;
                                      v110 = 0x100000001;
                                      v108 = 0x100000001;
                                      v12 = 1;
                                      *(_DWORD *)&v117[8] = 1;
                                    }
                                  }
                                }
                                else
                                {
                                  v108 = 0x100000000;
                                  v12 = 0;
                                  *(_QWORD *)&v117[4] = 0;
                                  v13 = 0;
                                  v14 = 0;
                                  v15 = 0;
                                  *(_DWORD *)v117 = 0;
                                  v16 = 0;
                                  v17 = 0;
                                  v18 = 0;
                                  v19 = 0;
                                  *(_QWORD *)&v111[36] = 0x100000001;
                                  *(_QWORD *)&v111[28] = 0x100000001;
                                  *(_QWORD *)&v111[20] = 0x100000001;
                                  *(_DWORD *)&v111[16] = 1;
                                  *(_QWORD *)v111 = 0x100000001;
                                  *(_QWORD *)&v111[8] = 0x100000001;
                                  v109 = 0;
                                  v110 = 0x100000001;
                                  *(_DWORD *)&v117[12] = 1;
                                }
                              }
                            }
                            else
                            {
                              v108 = 0;
                              *(_QWORD *)&v117[8] = 0;
                              v12 = 0;
                              v13 = 0;
                              *(_QWORD *)v117 = 0;
                              v14 = 0;
                              v15 = 0;
                              v16 = 0;
                              v17 = 0;
                              v18 = 0;
                              v19 = 0;
                              *(_QWORD *)&v111[36] = 0x100000001;
                              *(_QWORD *)&v111[28] = 0x100000001;
                              *(_QWORD *)&v111[20] = 0x100000001;
                              *(_DWORD *)&v111[16] = 1;
                              *(_QWORD *)v111 = 0x100000001;
                              *(_QWORD *)&v111[8] = 0x100000001;
                              v109 = 0;
                              v110 = 1;
                              *(_DWORD *)&v117[16] = 1;
                            }
                          }
                        }
                        else
                        {
                          v110 = 0;
                          v108 = 0;
                          v12 = 0;
                          v109 = 0;
                          v13 = 0;
                          v14 = 0;
                          v15 = 0;
                          memset(v117, 0, 20);
                          v16 = 0;
                          v17 = 0;
                          v18 = 0;
                          v19 = 0;
                          *(_QWORD *)&v111[36] = 0x100000001;
                          *(_QWORD *)&v111[28] = 0x100000001;
                          *(_QWORD *)&v111[20] = 0x100000001;
                          *(_DWORD *)&v111[16] = 1;
                          *(_QWORD *)v111 = 1;
                          *(_QWORD *)&v111[8] = 0x100000001;
                          *(_DWORD *)&v117[20] = 1;
                        }
                      }
                    }
                    else
                    {
                      *(_QWORD *)v111 = 0;
                      *(_QWORD *)&v111[8] = 0x100000000;
                      v110 = 0;
                      v108 = 0;
                      v12 = 0;
                      v109 = 0;
                      v13 = 0;
                      memset(v117, 0, 24);
                      v14 = 0;
                      v15 = 0;
                      v16 = 0;
                      v17 = 0;
                      v18 = 0;
                      v19 = 0;
                      *(_QWORD *)&v111[36] = 0x100000001;
                      *(_QWORD *)&v111[28] = 0x100000001;
                      *(_QWORD *)&v111[20] = 0x100000001;
                      *(_DWORD *)&v111[16] = 1;
                      *(_DWORD *)&v117[24] = 1;
                    }
                  }
                }
                else
                {
                  memset(v111, 0, 20);
                  v110 = 0;
                  v108 = 0;
                  v12 = 0;
                  v109 = 0;
                  v13 = 0;
                  v14 = 0;
                  v15 = 0;
                  memset(v117, 0, 28);
                  v16 = 0;
                  v17 = 0;
                  v18 = 0;
                  v19 = 0;
                  *(_QWORD *)&v111[36] = 0x100000001;
                  *(_QWORD *)&v111[28] = 0x100000001;
                  *(_QWORD *)&v111[20] = 0x100000001;
                  *(_DWORD *)&v117[28] = 1;
                }
              }
            }
            else
            {
              memset(v111, 0, 28);
              v110 = 0;
              v108 = 0;
              v12 = 0;
              v109 = 0;
              v13 = 0;
              memset(v117, 0, 32);
              v14 = 0;
              v15 = 0;
              v16 = 0;
              v17 = 0;
              v18 = 0;
              v19 = 0;
              *(_QWORD *)&v111[36] = 0x100000001;
              *(_QWORD *)&v111[28] = 0x100000001;
              *(_DWORD *)&v117[32] = 1;
            }
          }
        }
        else
        {
          memset(v111, 0, 36);
          v110 = 0;
          v108 = 0;
          v12 = 0;
          v109 = 0;
          v13 = 0;
          v14 = 0;
          v15 = 0;
          memset(v117, 0, sizeof(v117));
          v16 = 0;
          v17 = 0;
          v18 = 0;
          v19 = 0;
          *(_QWORD *)&v111[36] = 0x100000001;
          LODWORD(v112) = 1;
        }
      }
    }
    else
    {
      v112 = 0x100000000;
      memset(v111, 0, sizeof(v111));
      v110 = 0;
      v108 = 0;
      v12 = 0;
      v109 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      memset(v117, 0, sizeof(v117));
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v19 = 0;
    }
  }
  if (v18)
  {
    v23 = v5;
    v24 = v12;
    v25 = v14;
    v26 = v13;
    v27 = v15;
    v28 = v16;
    v29 = v17;

    v17 = v29;
    v16 = v28;
    v15 = v27;
    v13 = v26;
    v14 = v25;
    v12 = v24;
    v5 = v23;
  }
  if (v17)

  if (v16)
  {

  }
  if (*(_DWORD *)v117)
  {

    if (!v15)
      goto LABEL_24;
LABEL_87:

    if (!v14)
      goto LABEL_26;
    goto LABEL_25;
  }
  if (v15)
    goto LABEL_87;
LABEL_24:
  if (v14)
  {
LABEL_25:

  }
LABEL_26:
  if (*(_DWORD *)&v117[4])
  {

  }
  if (v13)

  if (v109)
  {

  }
  if (*(_DWORD *)&v117[8])
  {

  }
  if (v12)

  if ((_DWORD)v108)
  {

  }
  if (*(_DWORD *)&v117[12])
  {

  }
  if (HIDWORD(v110))

  if (HIDWORD(v108))
  {

  }
  if (*(_DWORD *)&v117[16])
  {

  }
  if (*(_DWORD *)&v111[4])

  if ((_DWORD)v110)
  {

  }
  if (*(_DWORD *)&v117[20])
  {

  }
  if (*(_DWORD *)&v111[8])

  if (*(_DWORD *)v111)
  {

  }
  if (*(_DWORD *)&v117[24])
  {

  }
  if (*(_DWORD *)&v111[16])

  if (*(_DWORD *)&v111[12])
  {

  }
  if (*(_DWORD *)&v117[28])
  {

  }
  if (*(_DWORD *)&v111[24])

  if (*(_DWORD *)&v111[20])
  {

  }
  if (*(_DWORD *)&v117[32])
  {

  }
  if (*(_DWORD *)&v111[32])

  if (*(_DWORD *)&v111[28])
  {

  }
  if ((_DWORD)v112)
  {

  }
  if (*(_DWORD *)&v111[36])

  if (*(_DWORD *)&v111[40])
  {

  }
  if (HIDWORD(v112))
  {

  }
  if (v114 != v113)

LABEL_85:
  return v19;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
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
  unint64_t v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)RFSummaryItemPairNumberCardSection;
  v3 = -[SFCardSection hash](&v29, sel_hash);
  -[RFSummaryItemPairNumberCardSection number](self, "number");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v28, "hash");
  -[RFSummaryItemPairNumberCardSection number](self, "number");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 ^ objc_msgSend(v27, "hash");
  -[RFSummaryItemPairNumberCardSection text](self, "text");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 ^ objc_msgSend(v26, "hash");
  -[RFSummaryItemPairNumberCardSection text](self, "text");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 ^ objc_msgSend(v25, "hash");
  -[RFSummaryItemPairNumberCardSection text](self, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 ^ objc_msgSend(v8, "hash") ^ v3;
  -[RFSummaryItemPairNumberCardSection text](self, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash");
  -[RFSummaryItemPairNumberCardSection text](self, "text");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11 ^ objc_msgSend(v12, "hash");
  -[RFSummaryItemPairNumberCardSection thumbnail](self, "thumbnail");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v13 ^ objc_msgSend(v14, "hash");
  -[RFSummaryItemPairNumberCardSection thumbnail](self, "thumbnail");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v15 ^ objc_msgSend(v16, "hash");
  -[RFSummaryItemPairNumberCardSection text](self, "text");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v17 ^ objc_msgSend(v18, "hash");
  -[RFSummaryItemPairNumberCardSection text](self, "text");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v9 ^ v19 ^ objc_msgSend(v20, "hash");
  -[RFSummaryItemPairNumberCardSection button](self, "button");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v21 ^ objc_msgSend(v22, "hash");

  return v23;
}

- (RFTextProperty)number_1
{
  return self->_number_1;
}

- (void)setNumber_1:(id)a3
{
  objc_storeStrong((id *)&self->_number_1, a3);
}

- (RFTextProperty)number_2
{
  return self->_number_2;
}

- (void)setNumber_2:(id)a3
{
  objc_storeStrong((id *)&self->_number_2, a3);
}

- (RFTextProperty)text_1
{
  return self->_text_1;
}

- (void)setText_1:(id)a3
{
  objc_storeStrong((id *)&self->_text_1, a3);
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

- (RFTextProperty)text_4
{
  return self->_text_4;
}

- (void)setText_4:(id)a3
{
  objc_storeStrong((id *)&self->_text_4, a3);
}

- (NSArray)text_5
{
  return self->_text_5;
}

- (void)setText_5:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (RFVisualProperty)thumbnail_1
{
  return self->_thumbnail_1;
}

- (void)setThumbnail_1:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnail_1, a3);
}

- (RFVisualProperty)thumbnail_2
{
  return self->_thumbnail_2;
}

- (void)setThumbnail_2:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnail_2, a3);
}

- (RFTextProperty)text_6
{
  return self->_text_6;
}

- (void)setText_6:(id)a3
{
  objc_storeStrong((id *)&self->_text_6, a3);
}

- (RFTextProperty)text_7
{
  return self->_text_7;
}

- (void)setText_7:(id)a3
{
  objc_storeStrong((id *)&self->_text_7, a3);
}

- (SFButtonItem)button_1
{
  return self->_button_1;
}

- (void)setButton_1:(id)a3
{
  objc_storeStrong((id *)&self->_button_1, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button_1, 0);
  objc_storeStrong((id *)&self->_text_7, 0);
  objc_storeStrong((id *)&self->_text_6, 0);
  objc_storeStrong((id *)&self->_thumbnail_2, 0);
  objc_storeStrong((id *)&self->_thumbnail_1, 0);
  objc_storeStrong((id *)&self->_text_5, 0);
  objc_storeStrong((id *)&self->_text_4, 0);
  objc_storeStrong((id *)&self->_text_3, 0);
  objc_storeStrong((id *)&self->_text_2, 0);
  objc_storeStrong((id *)&self->_text_1, 0);
  objc_storeStrong((id *)&self->_number_2, 0);
  objc_storeStrong((id *)&self->_number_1, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
