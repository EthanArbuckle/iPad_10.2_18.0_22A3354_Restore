@implementation SFKeyValueDataCardSection

- (SFKeyValueDataCardSection)initWithProtobuf:(id)a3
{
  id v4;
  SFKeyValueDataCardSection *v5;
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
  SFKeyValueTuple *v31;
  void *v32;
  SFImage *v33;
  void *v34;
  SFImage *v35;
  SFKeyValueDataCardSection *v36;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  objc_super v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)SFKeyValueDataCardSection;
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
    objc_msgSend(v4, "punchoutOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
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
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
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
      -[SFKeyValueDataCardSection setType:](v5, "setType:", v19);

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
    objc_msgSend(v4, "datas");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
      v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v25 = 0;

    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    objc_msgSend(v4, "datas", 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v39;
      do
      {
        for (j = 0; j != v28; ++j)
        {
          if (*(_QWORD *)v39 != v29)
            objc_enumerationMutation(v26);
          v31 = -[SFKeyValueTuple initWithProtobuf:]([SFKeyValueTuple alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * j));
          if (v31)
            objc_msgSend(v25, "addObject:", v31);

        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
      }
      while (v28);
    }

    -[SFKeyValueDataCardSection setData:](v5, "setData:", v25);
    objc_msgSend(v4, "accessoryImage");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      v33 = [SFImage alloc];
      objc_msgSend(v4, "accessoryImage");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = -[SFImage initWithProtobuf:](v33, "initWithProtobuf:", v34);
      -[SFKeyValueDataCardSection setAccessoryImage:](v5, "setAccessoryImage:", v35);

    }
    v36 = v5;

  }
  return v5;
}

- (SFKeyValueDataCardSection)initWithCoder:(id)a3
{
  id v4;
  SFKeyValueDataCardSection *v5;
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
    -[SFKeyValueDataCardSection setType:](v5, "setType:", v12);

    -[SFCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", -[SFCardSection separatorStyle](v8, "separatorStyle"));
    -[SFCardSection backgroundColor](v8, "backgroundColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setBackgroundColor:](v5, "setBackgroundColor:", v13);

    -[SFCardSection data](v8, "data");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFKeyValueDataCardSection setData:](v5, "setData:", v14);

    -[SFCardSection accessoryImage](v8, "accessoryImage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFKeyValueDataCardSection setAccessoryImage:](v5, "setAccessoryImage:", v15);

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
  v3.super_class = (Class)SFKeyValueDataCardSection;
  -[SFCardSection encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBKeyValueDataCardSection *v2;
  void *v3;

  v2 = -[_SFPBKeyValueDataCardSection initWithFacade:]([_SFPBKeyValueDataCardSection alloc], "initWithFacade:", self);
  -[_SFPBKeyValueDataCardSection dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBKeyValueDataCardSection *v2;
  void *v3;

  v2 = -[_SFPBKeyValueDataCardSection initWithFacade:]([_SFPBKeyValueDataCardSection alloc], "initWithFacade:", self);
  -[_SFPBKeyValueDataCardSection jsonData](v2, "jsonData");
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
  v20.super_class = (Class)SFKeyValueDataCardSection;
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
  -[SFKeyValueDataCardSection type](self, "type");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setType:", v12);

  objc_msgSend(v4, "setSeparatorStyle:", -[SFCardSection separatorStyle](self, "separatorStyle"));
  -[SFCardSection backgroundColor](self, "backgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setBackgroundColor:", v14);

  -[SFKeyValueDataCardSection data](self, "data");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v4, "setData:", v16);

  -[SFKeyValueDataCardSection accessoryImage](self, "accessoryImage");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");
  objc_msgSend(v4, "setAccessoryImage:", v18);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  SFKeyValueDataCardSection *v5;
  SFKeyValueDataCardSection *v6;
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
  int v26;
  void *v27;
  _BOOL4 v28;
  _BOOL4 v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
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
  id v63;
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
  SFKeyValueDataCardSection *v75;
  void *v76;
  void *v77;
  objc_super v78;

  v5 = (SFKeyValueDataCardSection *)a3;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (-[SFKeyValueDataCardSection isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v78.receiver = self;
      v78.super_class = (Class)SFKeyValueDataCardSection;
      if (-[SFCardSection isEqual:](&v78, sel_isEqual_, v5))
      {
        v6 = v5;
        -[SFCardSection punchoutOptions](self, "punchoutOptions");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFCardSection punchoutOptions](v6, "punchoutOptions");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v7 == 0) == (v8 != 0))
        {
          v11 = 0;
LABEL_58:

          goto LABEL_59;
        }
        -[SFCardSection punchoutOptions](self, "punchoutOptions");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          -[SFCardSection punchoutOptions](self, "punchoutOptions");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFCardSection punchoutOptions](v6, "punchoutOptions");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v10, "isEqual:", v3))
          {
            v11 = 0;
            goto LABEL_56;
          }
          v77 = v10;
        }
        -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFCardSection punchoutPickerTitle](v6, "punchoutPickerTitle");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v12 == 0) != (v13 != 0))
        {
          -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v74 = v3;
          if (v14)
          {
            v71 = v12;
            -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[SFCardSection punchoutPickerTitle](v6, "punchoutPickerTitle");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v15, "isEqual:", v16) & 1) == 0)
            {

LABEL_31:
              v11 = 0;
              goto LABEL_32;
            }
            v69 = v16;
            v70 = v15;
            v75 = v6;
            v73 = v8;
            v17 = v7;
            v18 = v9;
            v19 = v13;
            v20 = v71;
            v3 = v74;
            v21 = v14;
          }
          else
          {
            v75 = v6;
            v73 = v8;
            v17 = v7;
            v18 = v9;
            v19 = v13;
            v20 = v12;
            v21 = 0;
          }
          -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFCardSection punchoutPickerDismissText](v75, "punchoutPickerDismissText");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v21;
          v12 = v20;
          v13 = v19;
          v9 = v18;
          v7 = v17;
          v8 = v73;
          if ((v22 == 0) != (v23 != 0))
          {
            v67 = v23;
            v68 = v22;
            -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            if (v72)
            {
              -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v6 = v75;
              -[SFCardSection punchoutPickerDismissText](v75, "punchoutPickerDismissText");
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              v65 = v25;
              v26 = objc_msgSend(v25, "isEqual:");
              v27 = v68;
              if (!v26)
                goto LABEL_27;
            }
            else
            {
              v6 = v75;
              v27 = v68;
            }
            v66 = v24;
            v28 = -[SFCardSection canBeHidden](self, "canBeHidden");
            if (v28 != -[SFCardSection canBeHidden](v6, "canBeHidden")
              || (v29 = -[SFCardSection hasTopPadding](self, "hasTopPadding"),
                  v29 != -[SFCardSection hasTopPadding](v6, "hasTopPadding"))
              || (v30 = -[SFCardSection hasBottomPadding](self, "hasBottomPadding"),
                  v30 != -[SFCardSection hasBottomPadding](v6, "hasBottomPadding")))
            {
              v24 = v66;
              if (!v72)
              {
LABEL_28:

                if (v24)
                {

                }
                goto LABEL_31;
              }
LABEL_27:

              goto LABEL_28;
            }
            -[SFKeyValueDataCardSection type](self, "type");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            -[SFKeyValueDataCardSection type](v6, "type");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            if ((v31 == 0) != (v32 != 0))
            {
              v63 = v32;
              v76 = v31;
              -[SFKeyValueDataCardSection type](self, "type");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              if (v33)
              {
                -[SFKeyValueDataCardSection type](self, "type");
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                -[SFKeyValueDataCardSection type](v6, "type");
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                if (!objc_msgSend(v62, "isEqual:"))
                {
                  v11 = 0;
                  goto LABEL_68;
                }
                v61 = v33;
              }
              else
              {
                v61 = 0;
              }
              v34 = -[SFCardSection separatorStyle](self, "separatorStyle");
              if (v34 != -[SFCardSection separatorStyle](v6, "separatorStyle"))
              {
                v11 = 0;
                goto LABEL_67;
              }
              -[SFCardSection backgroundColor](self, "backgroundColor");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              -[SFCardSection backgroundColor](v6, "backgroundColor");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              if ((v35 == 0) != (v36 != 0))
              {
                v59 = v36;
                v57 = v9;
                v58 = v7;
                v56 = v13;
                v37 = v12;
                -[SFCardSection backgroundColor](self, "backgroundColor");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                if (v38)
                {
                  -[SFCardSection backgroundColor](self, "backgroundColor");
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SFCardSection backgroundColor](v6, "backgroundColor");
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  v55 = v39;
                  if (!objc_msgSend(v39, "isEqual:"))
                  {
                    v11 = 0;
                    goto LABEL_65;
                  }
                }
                -[SFKeyValueDataCardSection data](self, "data");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                -[SFKeyValueDataCardSection data](v6, "data");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                v43 = v42;
                if ((v41 == 0) == (v42 != 0))
                {

                  v11 = 0;
                  if (!v38)
                  {
LABEL_66:

                    v12 = v37;
                    v13 = v56;
                    v9 = v57;
                    v7 = v58;
                    v8 = v73;
                    v27 = v68;
LABEL_67:
                    v33 = v61;
                    if (!v61)
                    {
LABEL_69:

                      if (v72)
                      {

                      }
                      if (v66)
                      {

                      }
LABEL_32:
                      v10 = v77;
                      v3 = v74;
                      if (!v9)
                        goto LABEL_57;
                      goto LABEL_56;
                    }
LABEL_68:

                    goto LABEL_69;
                  }
LABEL_65:

                  goto LABEL_66;
                }
                -[SFKeyValueDataCardSection data](self, "data");
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v53
                  || (-[SFKeyValueDataCardSection data](self, "data"),
                      v44 = (void *)objc_claimAutoreleasedReturnValue(),
                      -[SFKeyValueDataCardSection data](v6, "data"),
                      v51 = (void *)objc_claimAutoreleasedReturnValue(),
                      v52 = v44,
                      objc_msgSend(v44, "isEqual:")))
                {
                  -[SFKeyValueDataCardSection accessoryImage](self, "accessoryImage");
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SFKeyValueDataCardSection accessoryImage](v6, "accessoryImage");
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  v46 = v45;
                  if ((v50 == 0) == (v45 != 0))
                  {

                    v11 = 0;
                  }
                  else
                  {
                    -[SFKeyValueDataCardSection accessoryImage](self, "accessoryImage");
                    v49 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v49)
                    {
                      -[SFKeyValueDataCardSection accessoryImage](self, "accessoryImage");
                      v48 = (void *)objc_claimAutoreleasedReturnValue();
                      -[SFKeyValueDataCardSection accessoryImage](v6, "accessoryImage");
                      v47 = (void *)objc_claimAutoreleasedReturnValue();
                      v11 = objc_msgSend(v48, "isEqual:", v47);

                    }
                    else
                    {

                      v11 = 1;
                    }
                  }
                  if (!v53)
                  {
LABEL_81:

                    if (!v38)
                      goto LABEL_66;
                    goto LABEL_65;
                  }
                }
                else
                {
                  v11 = 0;
                }

                goto LABEL_81;
              }

              if (v61)
              {

              }
              v31 = v76;
              v32 = v63;
            }
            v75 = v6;

            v24 = v66;
            if (v72)
            {

            }
            v23 = v67;
            v22 = v68;
            v3 = v74;
          }

          if (v24)
          {

          }
          v6 = v75;
        }

        v11 = 0;
        v10 = v77;
        if (!v9)
        {
LABEL_57:

          goto LABEL_58;
        }
LABEL_56:

        goto LABEL_57;
      }
    }
    v11 = 0;
  }
LABEL_59:

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
  unint64_t v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)SFKeyValueDataCardSection;
  v3 = -[SFCardSection hash](&v23, sel_hash);
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
  -[SFKeyValueDataCardSection type](self, "type");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 ^ objc_msgSend(v13, "hash");
  v15 = v14 ^ -[SFCardSection separatorStyle](self, "separatorStyle");
  -[SFCardSection backgroundColor](self, "backgroundColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v15 ^ objc_msgSend(v16, "hash");
  -[SFKeyValueDataCardSection data](self, "data");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v11 ^ v17 ^ objc_msgSend(v18, "hash");
  -[SFKeyValueDataCardSection accessoryImage](self, "accessoryImage");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v19 ^ objc_msgSend(v20, "hash");

  return v21;
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSArray)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (SFImage)accessoryImage
{
  return self->_accessoryImage;
}

- (void)setAccessoryImage:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryImage, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
