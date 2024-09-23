@implementation RFSimpleItemRichCardSection

- (RFSimpleItemRichCardSection)initWithProtobuf:(id)a3
{
  id v4;
  RFSimpleItemRichCardSection *v5;
  void *v6;
  RFTextProperty *v7;
  void *v8;
  RFTextProperty *v9;
  void *v10;
  RFTextProperty *v11;
  void *v12;
  RFTextProperty *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  RFTextProperty *v21;
  void *v22;
  RFTextProperty *v23;
  void *v24;
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
  RFTextProperty *v43;
  void *v44;
  RFTextProperty *v45;
  void *v46;
  RFVisualProperty *v47;
  void *v48;
  RFVisualProperty *v49;
  RFSimpleItemRichCardSection *v50;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  objc_super v60;
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v60.receiver = self;
  v60.super_class = (Class)RFSimpleItemRichCardSection;
  v5 = -[SFCardSection init](&v60, sel_init);
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
      -[RFSimpleItemRichCardSection setText_1:](v5, "setText_1:", v9);

    }
    objc_msgSend(v4, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [RFTextProperty alloc];
      objc_msgSend(v4, "text");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[RFTextProperty initWithProtobuf:](v11, "initWithProtobuf:", v12);
      -[RFSimpleItemRichCardSection setText_2:](v5, "setText_2:", v13);

    }
    objc_msgSend(v4, "text_3s");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v15 = 0;

    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    objc_msgSend(v4, "text_3s");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v57;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v57 != v19)
            objc_enumerationMutation(v16);
          v21 = -[RFTextProperty initWithProtobuf:]([RFTextProperty alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * i));
          if (v21)
            objc_msgSend(v15, "addObject:", v21);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
      }
      while (v18);
    }

    -[RFSimpleItemRichCardSection setText_3:](v5, "setText_3:", v15);
    objc_msgSend(v4, "text");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      v23 = [RFTextProperty alloc];
      objc_msgSend(v4, "text");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[RFTextProperty initWithProtobuf:](v23, "initWithProtobuf:", v24);
      -[RFSimpleItemRichCardSection setText_4:](v5, "setText_4:", v25);

    }
    objc_msgSend(v4, "text_5s");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
      v27 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v27 = 0;

    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    objc_msgSend(v4, "text_5s", 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v53;
      do
      {
        for (j = 0; j != v30; ++j)
        {
          if (*(_QWORD *)v53 != v31)
            objc_enumerationMutation(v28);
          v33 = -[RFTextProperty initWithProtobuf:]([RFTextProperty alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * j));
          if (v33)
            objc_msgSend(v27, "addObject:", v33);

        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
      }
      while (v30);
    }

    -[RFSimpleItemRichCardSection setText_5:](v5, "setText_5:", v27);
    objc_msgSend(v4, "text");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      v35 = [RFTextProperty alloc];
      objc_msgSend(v4, "text");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = -[RFTextProperty initWithProtobuf:](v35, "initWithProtobuf:", v36);
      -[RFSimpleItemRichCardSection setText_6:](v5, "setText_6:", v37);

    }
    objc_msgSend(v4, "text");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      v39 = [RFTextProperty alloc];
      objc_msgSend(v4, "text");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = -[RFTextProperty initWithProtobuf:](v39, "initWithProtobuf:", v40);
      -[RFSimpleItemRichCardSection setText_7:](v5, "setText_7:", v41);

    }
    objc_msgSend(v4, "text");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42)
    {
      v43 = [RFTextProperty alloc];
      objc_msgSend(v4, "text");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = -[RFTextProperty initWithProtobuf:](v43, "initWithProtobuf:", v44);
      -[RFSimpleItemRichCardSection setText_8:](v5, "setText_8:", v45);

    }
    objc_msgSend(v4, "thumbnail");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (v46)
    {
      v47 = [RFVisualProperty alloc];
      objc_msgSend(v4, "thumbnail");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = -[RFVisualProperty initWithProtobuf:](v47, "initWithProtobuf:", v48);
      -[RFSimpleItemRichCardSection setThumbnail:](v5, "setThumbnail:", v49);

    }
    v50 = v5;

  }
  return v5;
}

- (RFSimpleItemRichCardSection)initWithCoder:(id)a3
{
  id v4;
  RFSimpleItemRichCardSection *v5;
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
    -[RFSimpleItemRichCardSection setText_1:](v5, "setText_1:", v9);

    -[SFCardSection text](v8, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFSimpleItemRichCardSection setText_2:](v5, "setText_2:", v10);

    -[SFCardSection text](v8, "text");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFSimpleItemRichCardSection setText_3:](v5, "setText_3:", v11);

    -[SFCardSection text](v8, "text");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFSimpleItemRichCardSection setText_4:](v5, "setText_4:", v12);

    -[SFCardSection text](v8, "text");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFSimpleItemRichCardSection setText_5:](v5, "setText_5:", v13);

    -[SFCardSection text](v8, "text");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFSimpleItemRichCardSection setText_6:](v5, "setText_6:", v14);

    -[SFCardSection text](v8, "text");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFSimpleItemRichCardSection setText_7:](v5, "setText_7:", v15);

    -[SFCardSection text](v8, "text");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFSimpleItemRichCardSection setText_8:](v5, "setText_8:", v16);

    -[SFCardSection thumbnail](v8, "thumbnail");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFSimpleItemRichCardSection setThumbnail:](v5, "setThumbnail:", v17);

    -[SFCardSection nextCard](v8, "nextCard");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setNextCard:](v5, "setNextCard:", v18);

    -[SFCardSection commands](v8, "commands");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCommands:](v5, "setCommands:", v19);

    -[SFCardSection parameterKeyPaths](v8, "parameterKeyPaths");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setParameterKeyPaths:](v5, "setParameterKeyPaths:", v20);

    -[SFCardSection cardSectionId](v8, "cardSectionId");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCardSectionId:](v5, "setCardSectionId:", v21);

    -[SFCardSection resultIdentifier](v8, "resultIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setResultIdentifier:](v5, "setResultIdentifier:", v22);

    -[SFCardSection userReportRequest](v8, "userReportRequest");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setUserReportRequest:](v5, "setUserReportRequest:", v23);

    -[SFCardSection command](v8, "command");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCommand:](v5, "setCommand:", v24);

    -[SFCardSection previewCommand](v8, "previewCommand");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewCommand:](v5, "setPreviewCommand:", v25);

    -[SFCardSection previewButtonItems](v8, "previewButtonItems");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewButtonItems:](v5, "setPreviewButtonItems:", v26);

    -[SFCardSection cardSectionDetail](v8, "cardSectionDetail");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCardSectionDetail:](v5, "setCardSectionDetail:", v27);

    -[SFCardSection previewButtonItemsTitle](v8, "previewButtonItemsTitle");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewButtonItemsTitle:](v5, "setPreviewButtonItemsTitle:", v28);

    -[SFCardSection backgroundColor](v8, "backgroundColor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setBackgroundColor:](v5, "setBackgroundColor:", v29);

    -[SFCardSection setShouldHideInAmbientMode:](v5, "setShouldHideInAmbientMode:", -[SFCardSection shouldHideInAmbientMode](v8, "shouldHideInAmbientMode"));
    -[SFCardSection leadingSwipeButtonItems](v8, "leadingSwipeButtonItems");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setLeadingSwipeButtonItems:](v5, "setLeadingSwipeButtonItems:", v30);

    -[SFCardSection trailingSwipeButtonItems](v8, "trailingSwipeButtonItems");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setTrailingSwipeButtonItems:](v5, "setTrailingSwipeButtonItems:", v31);

    -[SFCardSection punchoutOptions](v8, "punchoutOptions");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutOptions:](v5, "setPunchoutOptions:", v32);

    -[SFCardSection punchoutPickerTitle](v8, "punchoutPickerTitle");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerTitle:](v5, "setPunchoutPickerTitle:", v33);

    -[SFCardSection punchoutPickerDismissText](v8, "punchoutPickerDismissText");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerDismissText:](v5, "setPunchoutPickerDismissText:", v34);

    -[SFCardSection setCanBeHidden:](v5, "setCanBeHidden:", -[SFCardSection canBeHidden](v8, "canBeHidden"));
    -[SFCardSection setHasTopPadding:](v5, "setHasTopPadding:", -[SFCardSection hasTopPadding](v8, "hasTopPadding"));
    -[SFCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", -[SFCardSection hasBottomPadding](v8, "hasBottomPadding"));
    -[SFCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", -[SFCardSection separatorStyle](v8, "separatorStyle"));
    -[SFCardSection referencedCommands](v8, "referencedCommands");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setReferencedCommands:](v5, "setReferencedCommands:", v35);

    -[SFCardSection setForceEnable3DTouch:](v5, "setForceEnable3DTouch:", -[SFCardSection forceEnable3DTouch](v8, "forceEnable3DTouch"));
    -[SFCardSection setShouldShowInSmartDialog:](v5, "setShouldShowInSmartDialog:", -[SFCardSection shouldShowInSmartDialog](v8, "shouldShowInSmartDialog"));
    -[SFCardSection appEntityAnnotation](v8, "appEntityAnnotation");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setAppEntityAnnotation:](v5, "setAppEntityAnnotation:", v36);

    -[SFCardSection emphasisSubjectId](v8, "emphasisSubjectId");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setEmphasisSubjectId:](v5, "setEmphasisSubjectId:", v37);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RFSimpleItemRichCardSection;
  -[SFCardSection encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBRFSimpleItemRichCardSection *v2;
  void *v3;

  v2 = -[_SFPBRFSimpleItemRichCardSection initWithFacade:]([_SFPBRFSimpleItemRichCardSection alloc], "initWithFacade:", self);
  -[_SFPBRFSimpleItemRichCardSection dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBRFSimpleItemRichCardSection *v2;
  void *v3;

  v2 = -[_SFPBRFSimpleItemRichCardSection initWithFacade:]([_SFPBRFSimpleItemRichCardSection alloc], "initWithFacade:", self);
  -[_SFPBRFSimpleItemRichCardSection jsonData](v2, "jsonData");
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
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)RFSimpleItemRichCardSection;
  v4 = -[SFCardSection copyWithZone:](&v24, sel_copyWithZone_, a3);
  -[RFSimpleItemRichCardSection text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setText_1:", v6);

  -[RFSimpleItemRichCardSection text](self, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setText_2:", v8);

  -[RFSimpleItemRichCardSection text](self, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setText_3:", v10);

  -[RFSimpleItemRichCardSection text](self, "text");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setText_4:", v12);

  -[RFSimpleItemRichCardSection text](self, "text");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setText_5:", v14);

  -[RFSimpleItemRichCardSection text](self, "text");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v4, "setText_6:", v16);

  -[RFSimpleItemRichCardSection text](self, "text");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");
  objc_msgSend(v4, "setText_7:", v18);

  -[RFSimpleItemRichCardSection text](self, "text");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");
  objc_msgSend(v4, "setText_8:", v20);

  -[RFSimpleItemRichCardSection thumbnail](self, "thumbnail");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "copy");
  objc_msgSend(v4, "setThumbnail:", v22);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  RFSimpleItemRichCardSection *v4;
  RFSimpleItemRichCardSection *v5;
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
  uint64_t v29;
  void *v30;
  void *v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
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
  objc_super v81;

  v4 = (RFSimpleItemRichCardSection *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    if (-[RFSimpleItemRichCardSection isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
    {
      v81.receiver = self;
      v81.super_class = (Class)RFSimpleItemRichCardSection;
      if (-[SFCardSection isEqual:](&v81, sel_isEqual_, v4))
      {
        v5 = v4;
        -[RFSimpleItemRichCardSection text](self, "text");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFSimpleItemRichCardSection text](v5, "text");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v6 == 0) == (v7 != 0))
        {
          v11 = 0;
LABEL_51:

          goto LABEL_52;
        }
        -[RFSimpleItemRichCardSection text](self, "text");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          -[RFSimpleItemRichCardSection text](self, "text");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[RFSimpleItemRichCardSection text](v5, "text");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v9, "isEqual:", v10))
          {
            v11 = 0;
LABEL_49:

            goto LABEL_50;
          }
          v79 = v10;
          v80 = v9;
        }
        -[RFSimpleItemRichCardSection text](self, "text");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFSimpleItemRichCardSection text](v5, "text");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v12 == 0) == (v13 != 0))
          goto LABEL_47;
        -[RFSimpleItemRichCardSection text](self, "text");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          -[RFSimpleItemRichCardSection text](self, "text");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[RFSimpleItemRichCardSection text](v5, "text");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          v77 = v15;
          if (!objc_msgSend(v15, "isEqual:", v76))
          {
LABEL_45:

LABEL_46:
            goto LABEL_47;
          }
        }
        v78 = v14;
        -[RFSimpleItemRichCardSection text](self, "text");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFSimpleItemRichCardSection text](v5, "text");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v16 == 0) == (v17 != 0))
        {

          if (!v14)
          {
LABEL_47:

            v11 = 0;
            if (!v8)
            {
LABEL_50:

              goto LABEL_51;
            }
            goto LABEL_48;
          }
          goto LABEL_45;
        }
        v73 = v16;
        v74 = v17;
        -[RFSimpleItemRichCardSection text](self, "text");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        if (v75)
        {
          -[RFSimpleItemRichCardSection text](self, "text");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[RFSimpleItemRichCardSection text](v5, "text");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          v72 = v18;
          if (!objc_msgSend(v18, "isEqual:", v71))
          {
LABEL_43:

LABEL_44:
            if (!v14)
              goto LABEL_47;
            goto LABEL_45;
          }
        }
        -[RFSimpleItemRichCardSection text](self, "text");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFSimpleItemRichCardSection text](v5, "text");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v19 == 0) == (v20 != 0))
        {

          goto LABEL_42;
        }
        v69 = v20;
        v70 = v19;
        -[RFSimpleItemRichCardSection text](self, "text");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          -[RFSimpleItemRichCardSection text](self, "text");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[RFSimpleItemRichCardSection text](v5, "text");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          v67 = v22;
          if (!objc_msgSend(v22, "isEqual:"))
            goto LABEL_40;
        }
        v68 = v21;
        -[RFSimpleItemRichCardSection text](self, "text");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFSimpleItemRichCardSection text](v5, "text");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v23 == 0) == (v24 != 0))
        {

          goto LABEL_39;
        }
        v64 = v23;
        v65 = v24;
        -[RFSimpleItemRichCardSection text](self, "text");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25)
        {
          -[RFSimpleItemRichCardSection text](self, "text");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[RFSimpleItemRichCardSection text](v5, "text");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = v26;
          if (!objc_msgSend(v26, "isEqual:"))
          {
LABEL_37:

LABEL_38:
LABEL_39:
            v21 = v68;
            if (!v68)
            {
LABEL_41:

LABEL_42:
              v14 = v78;
              if (!v75)
                goto LABEL_44;
              goto LABEL_43;
            }
LABEL_40:

            goto LABEL_41;
          }
        }
        v63 = v25;
        -[RFSimpleItemRichCardSection text](self, "text");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFSimpleItemRichCardSection text](v5, "text");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v27 == 0) == (v28 != 0))
        {

          v25 = v63;
          if (!v63)
            goto LABEL_38;
          goto LABEL_37;
        }
        v59 = v28;
        -[RFSimpleItemRichCardSection text](self, "text");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        if (v60)
        {
          -[RFSimpleItemRichCardSection text](self, "text");
          v29 = objc_claimAutoreleasedReturnValue();
          -[RFSimpleItemRichCardSection text](v5, "text");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = (void *)v29;
          v30 = (void *)v29;
          v31 = v63;
          if (!objc_msgSend(v30, "isEqual:"))
            goto LABEL_59;
        }
        v58 = v27;
        -[RFSimpleItemRichCardSection text](self, "text");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFSimpleItemRichCardSection text](v5, "text");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v33 == 0) == (v34 != 0))
        {

          v31 = v63;
          v27 = v58;
          if (!v60)
          {
            v38 = v68;
LABEL_60:

            if (v31)
            {

            }
            v14 = v78;
            if (v38)
            {

            }
            if (v75)
            {

            }
            if (!v78)
              goto LABEL_46;
            goto LABEL_45;
          }
LABEL_59:
          v38 = v68;

          goto LABEL_60;
        }
        v54 = v34;
        v55 = v33;
        -[RFSimpleItemRichCardSection text](self, "text");
        v53 = objc_claimAutoreleasedReturnValue();
        if (v53)
        {
          -[RFSimpleItemRichCardSection text](self, "text");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          -[RFSimpleItemRichCardSection text](v5, "text");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = v35;
          if (!objc_msgSend(v35, "isEqual:"))
          {
            v11 = 0;
            v36 = v60;
            v37 = (void *)v53;
LABEL_83:

LABEL_84:
            if (v36)
            {

            }
            if (v63)
            {

            }
            if (v68)
            {

            }
            if (v75)
            {

            }
            if (v78)
            {

            }
            if (!v8)
              goto LABEL_50;
LABEL_48:
            v10 = v79;
            v9 = v80;
            goto LABEL_49;
          }
        }
        -[RFSimpleItemRichCardSection text](self, "text");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFSimpleItemRichCardSection text](v5, "text");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v39 == 0) == (v52 != 0))
        {

          v11 = 0;
          goto LABEL_82;
        }
        -[RFSimpleItemRichCardSection text](self, "text");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v49
          || (-[RFSimpleItemRichCardSection text](self, "text"),
              v40 = (void *)objc_claimAutoreleasedReturnValue(),
              -[RFSimpleItemRichCardSection text](v5, "text"),
              v47 = (void *)objc_claimAutoreleasedReturnValue(),
              v48 = v40,
              objc_msgSend(v40, "isEqual:")))
        {
          -[RFSimpleItemRichCardSection thumbnail](self, "thumbnail");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          -[RFSimpleItemRichCardSection thumbnail](v5, "thumbnail");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          if ((v46 == 0) == (v45 != 0))
          {

            v11 = 0;
          }
          else
          {
            -[RFSimpleItemRichCardSection thumbnail](self, "thumbnail");
            v41 = objc_claimAutoreleasedReturnValue();
            if (v41)
            {
              v42 = (void *)v41;
              -[RFSimpleItemRichCardSection thumbnail](self, "thumbnail");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              -[RFSimpleItemRichCardSection thumbnail](v5, "thumbnail");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              v11 = objc_msgSend(v44, "isEqual:", v43);

            }
            else
            {

              v11 = 1;
            }
          }
          if (!v49)
            goto LABEL_81;
        }
        else
        {
          v11 = 0;
        }

LABEL_81:
LABEL_82:
        v36 = v60;
        v37 = (void *)v53;
        if (!v53)
          goto LABEL_84;
        goto LABEL_83;
      }
    }
    v11 = 0;
  }
LABEL_52:

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
  void *v19;
  unint64_t v20;
  void *v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)RFSimpleItemRichCardSection;
  v3 = -[SFCardSection hash](&v23, sel_hash);
  -[RFSimpleItemRichCardSection text](self, "text");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v22, "hash");
  -[RFSimpleItemRichCardSection text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ objc_msgSend(v5, "hash");
  -[RFSimpleItemRichCardSection text](self, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");
  -[RFSimpleItemRichCardSection text](self, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8 ^ objc_msgSend(v9, "hash");
  -[RFSimpleItemRichCardSection text](self, "text");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10 ^ objc_msgSend(v11, "hash") ^ v3;
  -[RFSimpleItemRichCardSection text](self, "text");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "hash");
  -[RFSimpleItemRichCardSection text](self, "text");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v14 ^ objc_msgSend(v15, "hash");
  -[RFSimpleItemRichCardSection text](self, "text");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v16 ^ objc_msgSend(v17, "hash");
  -[RFSimpleItemRichCardSection thumbnail](self, "thumbnail");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v12 ^ v18 ^ objc_msgSend(v19, "hash");

  return v20;
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

- (NSArray)text_3
{
  return self->_text_3;
}

- (void)setText_3:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
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

- (RFTextProperty)text_8
{
  return self->_text_8;
}

- (void)setText_8:(id)a3
{
  objc_storeStrong((id *)&self->_text_8, a3);
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
  objc_storeStrong((id *)&self->_text_8, 0);
  objc_storeStrong((id *)&self->_text_7, 0);
  objc_storeStrong((id *)&self->_text_6, 0);
  objc_storeStrong((id *)&self->_text_5, 0);
  objc_storeStrong((id *)&self->_text_4, 0);
  objc_storeStrong((id *)&self->_text_3, 0);
  objc_storeStrong((id *)&self->_text_2, 0);
  objc_storeStrong((id *)&self->_text_1, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
