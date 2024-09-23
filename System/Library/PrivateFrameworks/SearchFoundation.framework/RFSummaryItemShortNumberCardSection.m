@implementation RFSummaryItemShortNumberCardSection

- (RFSummaryItemShortNumberCardSection)initWithProtobuf:(id)a3
{
  id v4;
  RFSummaryItemShortNumberCardSection *v5;
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
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  RFTextProperty *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  RFTextProperty *v33;
  void *v34;
  RFTextProperty *v35;
  void *v36;
  RFTextProperty *v37;
  void *v38;
  RFTextProperty *v39;
  void *v40;
  RFTextProperty *v41;
  void *v42;
  RFVisualProperty *v43;
  void *v44;
  RFVisualProperty *v45;
  RFSummaryItemShortNumberCardSection *v46;
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
  v56.super_class = (Class)RFSummaryItemShortNumberCardSection;
  v5 = -[SFCardSection init](&v56, sel_init);
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
      -[RFSummaryItemShortNumberCardSection setNumber:](v5, "setNumber:", v9);

    }
    objc_msgSend(v4, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [RFTextProperty alloc];
      objc_msgSend(v4, "text");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[RFTextProperty initWithProtobuf:](v11, "initWithProtobuf:", v12);
      -[RFSummaryItemShortNumberCardSection setText_2:](v5, "setText_2:", v13);

    }
    objc_msgSend(v4, "text");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = [RFTextProperty alloc];
      objc_msgSend(v4, "text");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[RFTextProperty initWithProtobuf:](v15, "initWithProtobuf:", v16);
      -[RFSummaryItemShortNumberCardSection setText_1:](v5, "setText_1:", v17);

    }
    objc_msgSend(v4, "text_3s");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
      v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v19 = 0;

    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    objc_msgSend(v4, "text_3s");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v53 != v23)
            objc_enumerationMutation(v20);
          v25 = -[RFTextProperty initWithProtobuf:]([RFTextProperty alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i));
          if (v25)
            objc_msgSend(v19, "addObject:", v25);

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
      }
      while (v22);
    }

    -[RFSummaryItemShortNumberCardSection setText_3:](v5, "setText_3:", v19);
    objc_msgSend(v4, "text_4s");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
      v27 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v27 = 0;

    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    objc_msgSend(v4, "text_4s", 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v49;
      do
      {
        for (j = 0; j != v30; ++j)
        {
          if (*(_QWORD *)v49 != v31)
            objc_enumerationMutation(v28);
          v33 = -[RFTextProperty initWithProtobuf:]([RFTextProperty alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * j));
          if (v33)
            objc_msgSend(v27, "addObject:", v33);

        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
      }
      while (v30);
    }

    -[RFSummaryItemShortNumberCardSection setText_4:](v5, "setText_4:", v27);
    objc_msgSend(v4, "text");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      v35 = [RFTextProperty alloc];
      objc_msgSend(v4, "text");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = -[RFTextProperty initWithProtobuf:](v35, "initWithProtobuf:", v36);
      -[RFSummaryItemShortNumberCardSection setText_5:](v5, "setText_5:", v37);

    }
    objc_msgSend(v4, "text");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      v39 = [RFTextProperty alloc];
      objc_msgSend(v4, "text");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = -[RFTextProperty initWithProtobuf:](v39, "initWithProtobuf:", v40);
      -[RFSummaryItemShortNumberCardSection setText_6:](v5, "setText_6:", v41);

    }
    objc_msgSend(v4, "thumbnail");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42)
    {
      v43 = [RFVisualProperty alloc];
      objc_msgSend(v4, "thumbnail");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = -[RFVisualProperty initWithProtobuf:](v43, "initWithProtobuf:", v44);
      -[RFSummaryItemShortNumberCardSection setThumbnail:](v5, "setThumbnail:", v45);

    }
    v46 = v5;

  }
  return v5;
}

- (RFSummaryItemShortNumberCardSection)initWithCoder:(id)a3
{
  id v4;
  RFSummaryItemShortNumberCardSection *v5;
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
    -[SFCardSection number](v8, "number");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFSummaryItemShortNumberCardSection setNumber:](v5, "setNumber:", v9);

    -[SFCardSection text](v8, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFSummaryItemShortNumberCardSection setText_2:](v5, "setText_2:", v10);

    -[SFCardSection text](v8, "text");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFSummaryItemShortNumberCardSection setText_1:](v5, "setText_1:", v11);

    -[SFCardSection text](v8, "text");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFSummaryItemShortNumberCardSection setText_3:](v5, "setText_3:", v12);

    -[SFCardSection text](v8, "text");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFSummaryItemShortNumberCardSection setText_4:](v5, "setText_4:", v13);

    -[SFCardSection text](v8, "text");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFSummaryItemShortNumberCardSection setText_5:](v5, "setText_5:", v14);

    -[SFCardSection text](v8, "text");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFSummaryItemShortNumberCardSection setText_6:](v5, "setText_6:", v15);

    -[SFCardSection thumbnail](v8, "thumbnail");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFSummaryItemShortNumberCardSection setThumbnail:](v5, "setThumbnail:", v16);

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
  v3.super_class = (Class)RFSummaryItemShortNumberCardSection;
  -[SFCardSection encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBRFSummaryItemShortNumberCardSection *v2;
  void *v3;

  v2 = -[_SFPBRFSummaryItemShortNumberCardSection initWithFacade:]([_SFPBRFSummaryItemShortNumberCardSection alloc], "initWithFacade:", self);
  -[_SFPBRFSummaryItemShortNumberCardSection dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBRFSummaryItemShortNumberCardSection *v2;
  void *v3;

  v2 = -[_SFPBRFSummaryItemShortNumberCardSection initWithFacade:]([_SFPBRFSummaryItemShortNumberCardSection alloc], "initWithFacade:", self);
  -[_SFPBRFSummaryItemShortNumberCardSection jsonData](v2, "jsonData");
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
  v22.super_class = (Class)RFSummaryItemShortNumberCardSection;
  v4 = -[SFCardSection copyWithZone:](&v22, sel_copyWithZone_, a3);
  -[RFSummaryItemShortNumberCardSection number](self, "number");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setNumber:", v6);

  -[RFSummaryItemShortNumberCardSection text](self, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setText_2:", v8);

  -[RFSummaryItemShortNumberCardSection text](self, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setText_1:", v10);

  -[RFSummaryItemShortNumberCardSection text](self, "text");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setText_3:", v12);

  -[RFSummaryItemShortNumberCardSection text](self, "text");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setText_4:", v14);

  -[RFSummaryItemShortNumberCardSection text](self, "text");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v4, "setText_5:", v16);

  -[RFSummaryItemShortNumberCardSection text](self, "text");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");
  objc_msgSend(v4, "setText_6:", v18);

  -[RFSummaryItemShortNumberCardSection thumbnail](self, "thumbnail");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");
  objc_msgSend(v4, "setThumbnail:", v20);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  RFSummaryItemShortNumberCardSection *v4;
  RFSummaryItemShortNumberCardSection *v5;
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
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
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
  objc_super v74;

  v4 = (RFSummaryItemShortNumberCardSection *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    if (-[RFSummaryItemShortNumberCardSection isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
    {
      v74.receiver = self;
      v74.super_class = (Class)RFSummaryItemShortNumberCardSection;
      if (-[SFCardSection isEqual:](&v74, sel_isEqual_, v4))
      {
        v5 = v4;
        -[RFSummaryItemShortNumberCardSection number](self, "number");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFSummaryItemShortNumberCardSection number](v5, "number");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v6 == 0) == (v7 != 0))
        {
          v11 = 0;
LABEL_27:

          goto LABEL_28;
        }
        -[RFSummaryItemShortNumberCardSection number](self, "number");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          -[RFSummaryItemShortNumberCardSection number](self, "number");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[RFSummaryItemShortNumberCardSection number](v5, "number");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v9, "isEqual:", v10))
          {
            v11 = 0;
LABEL_25:

            goto LABEL_26;
          }
          v72 = v10;
          v73 = v9;
        }
        -[RFSummaryItemShortNumberCardSection text](self, "text");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFSummaryItemShortNumberCardSection text](v5, "text");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v12 == 0) == (v13 != 0))
          goto LABEL_23;
        -[RFSummaryItemShortNumberCardSection text](self, "text");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          -[RFSummaryItemShortNumberCardSection text](self, "text");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[RFSummaryItemShortNumberCardSection text](v5, "text");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          v70 = v15;
          if (!objc_msgSend(v15, "isEqual:", v69))
            goto LABEL_21;
        }
        v71 = v14;
        -[RFSummaryItemShortNumberCardSection text](self, "text");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFSummaryItemShortNumberCardSection text](v5, "text");
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
        v66 = v16;
        v67 = v17;
        -[RFSummaryItemShortNumberCardSection text](self, "text");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        if (v68)
        {
          -[RFSummaryItemShortNumberCardSection text](self, "text");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[RFSummaryItemShortNumberCardSection text](v5, "text");
          v65 = v18;
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v18, "isEqual:", v64))
          {
LABEL_49:

LABEL_50:
            if (!v14)
              goto LABEL_22;
            goto LABEL_21;
          }
        }
        -[RFSummaryItemShortNumberCardSection text](self, "text");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFSummaryItemShortNumberCardSection text](v5, "text");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v20 == 0) == (v21 != 0))
        {

          goto LABEL_48;
        }
        v62 = v20;
        v63 = v21;
        -[RFSummaryItemShortNumberCardSection text](self, "text");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          -[RFSummaryItemShortNumberCardSection text](self, "text");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[RFSummaryItemShortNumberCardSection text](v5, "text");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = v23;
          if (!objc_msgSend(v23, "isEqual:"))
            goto LABEL_39;
        }
        v61 = v22;
        -[RFSummaryItemShortNumberCardSection text](self, "text");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFSummaryItemShortNumberCardSection text](v5, "text");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v24 == 0) == (v25 != 0))
        {

          v22 = v61;
          if (!v61)
          {
LABEL_47:

LABEL_48:
            v14 = v71;
            if (!v68)
              goto LABEL_50;
            goto LABEL_49;
          }
LABEL_39:

          goto LABEL_47;
        }
        v56 = v25;
        v57 = v24;
        -[RFSummaryItemShortNumberCardSection text](self, "text");
        v22 = v61;
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        if (v58)
        {
          -[RFSummaryItemShortNumberCardSection text](self, "text");
          v26 = objc_claimAutoreleasedReturnValue();
          -[RFSummaryItemShortNumberCardSection text](v5, "text");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = (void *)v26;
          v27 = (void *)v26;
          v28 = v58;
          if (!objc_msgSend(v27, "isEqual:"))
          {
LABEL_45:

LABEL_46:
            if (!v22)
              goto LABEL_47;
            goto LABEL_39;
          }
        }
        -[RFSummaryItemShortNumberCardSection text](self, "text");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFSummaryItemShortNumberCardSection text](v5, "text");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v29 == 0) == (v30 != 0))
        {

          v22 = v61;
          v28 = v58;
          if (!v58)
            goto LABEL_46;
          goto LABEL_45;
        }
        v52 = v30;
        v53 = v29;
        -[RFSummaryItemShortNumberCardSection text](self, "text");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (v31)
        {
          -[RFSummaryItemShortNumberCardSection text](self, "text");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[RFSummaryItemShortNumberCardSection text](v5, "text");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = v32;
          v33 = objc_msgSend(v32, "isEqual:");
          v34 = v57;
          if (!v33)
          {
            v11 = 0;
            goto LABEL_68;
          }
          v51 = v31;
        }
        else
        {
          v51 = 0;
        }
        -[RFSummaryItemShortNumberCardSection text](self, "text");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFSummaryItemShortNumberCardSection text](v5, "text");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v35 == 0) != (v36 != 0))
        {
          v46 = v35;
          v47 = v36;
          -[RFSummaryItemShortNumberCardSection text](self, "text");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v48
            || (-[RFSummaryItemShortNumberCardSection text](self, "text"),
                v37 = (void *)objc_claimAutoreleasedReturnValue(),
                -[RFSummaryItemShortNumberCardSection text](v5, "text"),
                v44 = (void *)objc_claimAutoreleasedReturnValue(),
                v45 = v37,
                objc_msgSend(v37, "isEqual:")))
          {
            -[RFSummaryItemShortNumberCardSection thumbnail](self, "thumbnail");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            -[RFSummaryItemShortNumberCardSection thumbnail](v5, "thumbnail");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            if ((v38 == 0) == (v43 != 0))
            {

              v11 = 0;
            }
            else
            {
              -[RFSummaryItemShortNumberCardSection thumbnail](self, "thumbnail");
              v39 = objc_claimAutoreleasedReturnValue();
              if (v39)
              {
                v40 = (void *)v39;
                -[RFSummaryItemShortNumberCardSection thumbnail](self, "thumbnail");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                -[RFSummaryItemShortNumberCardSection thumbnail](v5, "thumbnail");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                v11 = objc_msgSend(v42, "isEqual:", v41);

              }
              else
              {

                v11 = 1;
              }
            }
            v34 = v57;
            v31 = v51;
            if (!v48)
            {
LABEL_67:

              if (!v31)
                goto LABEL_69;
              goto LABEL_68;
            }
          }
          else
          {
            v11 = 0;
            v34 = v57;
            v31 = v51;
          }

          goto LABEL_67;
        }

        v11 = 0;
        v31 = v51;
        v34 = v57;
        if (!v51)
        {
LABEL_69:

          if (v58)
          {

          }
          if (v61)
          {

          }
          if (v68)
          {

          }
          if (v71)
          {

          }
          if (!v8)
            goto LABEL_26;
LABEL_24:
          v10 = v72;
          v9 = v73;
          goto LABEL_25;
        }
LABEL_68:

        goto LABEL_69;
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
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)RFSummaryItemShortNumberCardSection;
  v3 = -[SFCardSection hash](&v21, sel_hash);
  -[RFSummaryItemShortNumberCardSection number](self, "number");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[RFSummaryItemShortNumberCardSection text](self, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");
  -[RFSummaryItemShortNumberCardSection text](self, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 ^ objc_msgSend(v8, "hash");
  -[RFSummaryItemShortNumberCardSection text](self, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9 ^ objc_msgSend(v10, "hash");
  -[RFSummaryItemShortNumberCardSection text](self, "text");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11 ^ objc_msgSend(v12, "hash") ^ v3;
  -[RFSummaryItemShortNumberCardSection text](self, "text");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hash");
  -[RFSummaryItemShortNumberCardSection text](self, "text");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v15 ^ objc_msgSend(v16, "hash");
  -[RFSummaryItemShortNumberCardSection thumbnail](self, "thumbnail");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v13 ^ v17 ^ objc_msgSend(v18, "hash");

  return v19;
}

- (RFTextProperty)number
{
  return self->_number;
}

- (void)setNumber:(id)a3
{
  objc_storeStrong((id *)&self->_number, a3);
}

- (RFTextProperty)text_2
{
  return self->_text_2;
}

- (void)setText_2:(id)a3
{
  objc_storeStrong((id *)&self->_text_2, a3);
}

- (RFTextProperty)text_1
{
  return self->_text_1;
}

- (void)setText_1:(id)a3
{
  objc_storeStrong((id *)&self->_text_1, a3);
}

- (NSArray)text_3
{
  return self->_text_3;
}

- (void)setText_3:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (NSArray)text_4
{
  return self->_text_4;
}

- (void)setText_4:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (RFTextProperty)text_5
{
  return self->_text_5;
}

- (void)setText_5:(id)a3
{
  objc_storeStrong((id *)&self->_text_5, a3);
}

- (RFTextProperty)text_6
{
  return self->_text_6;
}

- (void)setText_6:(id)a3
{
  objc_storeStrong((id *)&self->_text_6, a3);
}

- (RFVisualProperty)thumbnail
{
  return self->_thumbnail;
}

- (void)setThumbnail:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnail, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_text_6, 0);
  objc_storeStrong((id *)&self->_text_5, 0);
  objc_storeStrong((id *)&self->_text_4, 0);
  objc_storeStrong((id *)&self->_text_3, 0);
  objc_storeStrong((id *)&self->_text_1, 0);
  objc_storeStrong((id *)&self->_text_2, 0);
  objc_storeStrong((id *)&self->_number, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
