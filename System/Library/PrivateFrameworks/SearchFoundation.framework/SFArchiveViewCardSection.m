@implementation SFArchiveViewCardSection

- (SFArchiveViewCardSection)initWithProtobuf:(id)a3
{
  id v4;
  SFArchiveViewCardSection *v5;
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
  SFArchiveViewCardSection *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)SFArchiveViewCardSection;
  v5 = -[SFCardSection init](&v32, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "punchoutOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v7 = 0;

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend(v4, "punchoutOptions", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v29 != v11)
            objc_enumerationMutation(v8);
          v13 = -[SFPunchout initWithProtobuf:]([SFPunchout alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i));
          if (v13)
            objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
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
      -[SFArchiveViewCardSection setType:](v5, "setType:", v19);

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
    objc_msgSend(v4, "archive");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v4, "archive");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFArchiveViewCardSection setArchive:](v5, "setArchive:", v25);

    }
    v26 = v5;

  }
  return v5;
}

- (SFArchiveViewCardSection)initWithCoder:(id)a3
{
  id v4;
  SFArchiveViewCardSection *v5;
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
    -[SFArchiveViewCardSection setType:](v5, "setType:", v12);

    -[SFCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", -[SFCardSection separatorStyle](v8, "separatorStyle"));
    -[SFCardSection backgroundColor](v8, "backgroundColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setBackgroundColor:](v5, "setBackgroundColor:", v13);

    -[SFCardSection archive](v8, "archive");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFArchiveViewCardSection setArchive:](v5, "setArchive:", v14);

    -[SFCardSection nextCard](v8, "nextCard");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setNextCard:](v5, "setNextCard:", v15);

    -[SFCardSection commands](v8, "commands");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCommands:](v5, "setCommands:", v16);

    -[SFCardSection parameterKeyPaths](v8, "parameterKeyPaths");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setParameterKeyPaths:](v5, "setParameterKeyPaths:", v17);

    -[SFCardSection cardSectionId](v8, "cardSectionId");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCardSectionId:](v5, "setCardSectionId:", v18);

    -[SFCardSection resultIdentifier](v8, "resultIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setResultIdentifier:](v5, "setResultIdentifier:", v19);

    -[SFCardSection userReportRequest](v8, "userReportRequest");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setUserReportRequest:](v5, "setUserReportRequest:", v20);

    -[SFCardSection command](v8, "command");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCommand:](v5, "setCommand:", v21);

    -[SFCardSection previewCommand](v8, "previewCommand");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewCommand:](v5, "setPreviewCommand:", v22);

    -[SFCardSection previewButtonItems](v8, "previewButtonItems");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewButtonItems:](v5, "setPreviewButtonItems:", v23);

    -[SFCardSection cardSectionDetail](v8, "cardSectionDetail");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCardSectionDetail:](v5, "setCardSectionDetail:", v24);

    -[SFCardSection previewButtonItemsTitle](v8, "previewButtonItemsTitle");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewButtonItemsTitle:](v5, "setPreviewButtonItemsTitle:", v25);

    -[SFCardSection backgroundColor](v8, "backgroundColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setBackgroundColor:](v5, "setBackgroundColor:", v26);

    -[SFCardSection setShouldHideInAmbientMode:](v5, "setShouldHideInAmbientMode:", -[SFCardSection shouldHideInAmbientMode](v8, "shouldHideInAmbientMode"));
    -[SFCardSection leadingSwipeButtonItems](v8, "leadingSwipeButtonItems");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setLeadingSwipeButtonItems:](v5, "setLeadingSwipeButtonItems:", v27);

    -[SFCardSection trailingSwipeButtonItems](v8, "trailingSwipeButtonItems");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setTrailingSwipeButtonItems:](v5, "setTrailingSwipeButtonItems:", v28);

    -[SFCardSection punchoutOptions](v8, "punchoutOptions");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutOptions:](v5, "setPunchoutOptions:", v29);

    -[SFCardSection punchoutPickerTitle](v8, "punchoutPickerTitle");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerTitle:](v5, "setPunchoutPickerTitle:", v30);

    -[SFCardSection punchoutPickerDismissText](v8, "punchoutPickerDismissText");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerDismissText:](v5, "setPunchoutPickerDismissText:", v31);

    -[SFCardSection setCanBeHidden:](v5, "setCanBeHidden:", -[SFCardSection canBeHidden](v8, "canBeHidden"));
    -[SFCardSection setHasTopPadding:](v5, "setHasTopPadding:", -[SFCardSection hasTopPadding](v8, "hasTopPadding"));
    -[SFCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", -[SFCardSection hasBottomPadding](v8, "hasBottomPadding"));
    -[SFCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", -[SFCardSection separatorStyle](v8, "separatorStyle"));
    -[SFCardSection referencedCommands](v8, "referencedCommands");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setReferencedCommands:](v5, "setReferencedCommands:", v32);

    -[SFCardSection setForceEnable3DTouch:](v5, "setForceEnable3DTouch:", -[SFCardSection forceEnable3DTouch](v8, "forceEnable3DTouch"));
    -[SFCardSection setShouldShowInSmartDialog:](v5, "setShouldShowInSmartDialog:", -[SFCardSection shouldShowInSmartDialog](v8, "shouldShowInSmartDialog"));
    -[SFCardSection appEntityAnnotation](v8, "appEntityAnnotation");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setAppEntityAnnotation:](v5, "setAppEntityAnnotation:", v33);

    -[SFCardSection emphasisSubjectId](v8, "emphasisSubjectId");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setEmphasisSubjectId:](v5, "setEmphasisSubjectId:", v34);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFArchiveViewCardSection;
  -[SFCardSection encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBArchiveViewCardSection *v2;
  void *v3;

  v2 = -[_SFPBArchiveViewCardSection initWithFacade:]([_SFPBArchiveViewCardSection alloc], "initWithFacade:", self);
  -[_SFPBArchiveViewCardSection dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBArchiveViewCardSection *v2;
  void *v3;

  v2 = -[_SFPBArchiveViewCardSection initWithFacade:]([_SFPBArchiveViewCardSection alloc], "initWithFacade:", self);
  -[_SFPBArchiveViewCardSection jsonData](v2, "jsonData");
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
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)SFArchiveViewCardSection;
  v4 = -[SFCardSection copyWithZone:](&v18, sel_copyWithZone_, a3);
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
  -[SFArchiveViewCardSection type](self, "type");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setType:", v12);

  objc_msgSend(v4, "setSeparatorStyle:", -[SFCardSection separatorStyle](self, "separatorStyle"));
  -[SFCardSection backgroundColor](self, "backgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setBackgroundColor:", v14);

  -[SFArchiveViewCardSection archive](self, "archive");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v4, "setArchive:", v16);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  SFArchiveViewCardSection *v5;
  SFArchiveViewCardSection *v6;
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
  _BOOL4 v24;
  _BOOL4 v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v33;
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
  uint64_t v51;
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
  objc_super v70;

  v5 = (SFArchiveViewCardSection *)a3;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (-[SFArchiveViewCardSection isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v70.receiver = self;
      v70.super_class = (Class)SFArchiveViewCardSection;
      if (-[SFCardSection isEqual:](&v70, sel_isEqual_, v5))
      {
        v6 = v5;
        -[SFCardSection punchoutOptions](self, "punchoutOptions");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFCardSection punchoutOptions](v6, "punchoutOptions");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v7 == 0) == (v8 != 0))
        {
          v11 = 0;
LABEL_49:

          goto LABEL_50;
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
            goto LABEL_47;
          }
          v69 = v10;
        }
        -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFCardSection punchoutPickerTitle](v6, "punchoutPickerTitle");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v12 == 0) != (v13 != 0))
        {
          -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            v62 = v9;
            v64 = v3;
            v15 = v13;
            -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[SFCardSection punchoutPickerTitle](v6, "punchoutPickerTitle");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v16, "isEqual:", v17) & 1) == 0)
            {

              v11 = 0;
              v10 = v69;
              v9 = v62;
              v3 = v64;
              if (!v62)
                goto LABEL_48;
              goto LABEL_47;
            }
            v60 = v17;
            v61 = v16;
            v67 = v7;
            v68 = v8;
            v18 = v62;
            v3 = v64;
            v19 = v14;
          }
          else
          {
            v67 = v7;
            v68 = v8;
            v18 = v9;
            v15 = v13;
            v19 = 0;
          }
          v66 = v12;
          -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFCardSection punchoutPickerDismissText](v6, "punchoutPickerDismissText");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v19;
          v13 = v15;
          v9 = v18;
          v7 = v67;
          v8 = v68;
          if ((v20 == 0) != (v21 != 0))
          {
            v58 = v20;
            v59 = v21;
            -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            if (v57)
            {
              -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              -[SFCardSection punchoutPickerDismissText](v6, "punchoutPickerDismissText");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              v55 = v23;
              if (!objc_msgSend(v23, "isEqual:"))
              {
                v11 = 0;
                v27 = v57;
LABEL_31:

LABEL_32:
                if (v22)
                {

                }
LABEL_46:
                v10 = v69;
                if (!v9)
                {
LABEL_48:

                  goto LABEL_49;
                }
LABEL_47:

                goto LABEL_48;
              }
              v56 = v22;
            }
            else
            {
              v56 = v22;
            }
            v24 = -[SFCardSection canBeHidden](self, "canBeHidden");
            if (v24 != -[SFCardSection canBeHidden](v6, "canBeHidden")
              || (v25 = -[SFCardSection hasTopPadding](self, "hasTopPadding"),
                  v25 != -[SFCardSection hasTopPadding](v6, "hasTopPadding"))
              || (v26 = -[SFCardSection hasBottomPadding](self, "hasBottomPadding"),
                  v26 != -[SFCardSection hasBottomPadding](v6, "hasBottomPadding")))
            {
              v11 = 0;
              v22 = v56;
              goto LABEL_28;
            }
            -[SFArchiveViewCardSection type](self, "type");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[SFArchiveViewCardSection type](v6, "type");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            if ((v28 == 0) != (v29 != 0))
            {
              v53 = v29;
              -[SFArchiveViewCardSection type](self, "type");
              v51 = objc_claimAutoreleasedReturnValue();
              v52 = v28;
              if (v51)
              {
                -[SFArchiveViewCardSection type](self, "type");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                -[SFArchiveViewCardSection type](v6, "type");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                v50 = v30;
                if (!objc_msgSend(v30, "isEqual:"))
                {
                  v11 = 0;
                  v31 = (void *)v51;
                  v22 = v56;
                  goto LABEL_66;
                }
              }
              v33 = -[SFCardSection separatorStyle](self, "separatorStyle");
              if (v33 == -[SFCardSection separatorStyle](v6, "separatorStyle"))
              {
                -[SFCardSection backgroundColor](self, "backgroundColor");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                -[SFCardSection backgroundColor](v6, "backgroundColor");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                if ((v34 == 0) != (v35 != 0))
                {
                  v48 = v35;
                  v63 = v9;
                  v65 = v3;
                  v47 = v13;
                  -[SFCardSection backgroundColor](self, "backgroundColor");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!v36
                    || (-[SFCardSection backgroundColor](self, "backgroundColor"),
                        v37 = (void *)objc_claimAutoreleasedReturnValue(),
                        -[SFCardSection backgroundColor](v6, "backgroundColor"),
                        v45 = (void *)objc_claimAutoreleasedReturnValue(),
                        v46 = v37,
                        objc_msgSend(v37, "isEqual:")))
                  {
                    -[SFArchiveViewCardSection archive](self, "archive");
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                    -[SFArchiveViewCardSection archive](v6, "archive");
                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                    v40 = v39;
                    if ((v38 == 0) == (v39 != 0))
                    {

                      v11 = 0;
                      if (!v36)
                      {
LABEL_64:

                        v22 = v56;
                        v9 = v63;
                        v3 = v65;
                        v13 = v47;
                        v7 = v67;
                        v8 = v68;
LABEL_65:
                        v31 = (void *)v51;
                        if (!v51)
                        {
LABEL_67:

LABEL_28:
                          v27 = v57;
                          if (!v57)
                            goto LABEL_32;
                          goto LABEL_31;
                        }
LABEL_66:

                        goto LABEL_67;
                      }
                    }
                    else
                    {
                      -[SFArchiveViewCardSection archive](self, "archive");
                      v41 = objc_claimAutoreleasedReturnValue();
                      if (v41)
                      {
                        v42 = (void *)v41;
                        -[SFArchiveViewCardSection archive](self, "archive");
                        v43 = (void *)objc_claimAutoreleasedReturnValue();
                        -[SFArchiveViewCardSection archive](v6, "archive");
                        v44 = (void *)objc_claimAutoreleasedReturnValue();
                        v11 = objc_msgSend(v43, "isEqual:", v44);

                        if (!v36)
                          goto LABEL_64;
                      }
                      else
                      {

                        v11 = 1;
                        if (!v36)
                          goto LABEL_64;
                      }
                    }
                  }
                  else
                  {
                    v11 = 0;
                  }

                  goto LABEL_64;
                }

              }
              v11 = 0;
              v22 = v56;
              goto LABEL_65;
            }

            v22 = v56;
            if (v57)
            {

            }
            v20 = v58;
            v21 = v59;
          }

          if (v22)
          {

          }
          v12 = v66;
        }

        v11 = 0;
        goto LABEL_46;
      }
    }
    v11 = 0;
  }
LABEL_50:

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
  unint64_t v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)SFArchiveViewCardSection;
  v3 = -[SFCardSection hash](&v21, sel_hash);
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
  -[SFArchiveViewCardSection type](self, "type");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 ^ objc_msgSend(v13, "hash");
  v15 = v14 ^ -[SFCardSection separatorStyle](self, "separatorStyle");
  -[SFCardSection backgroundColor](self, "backgroundColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v15 ^ objc_msgSend(v16, "hash");
  -[SFArchiveViewCardSection archive](self, "archive");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v11 ^ v17 ^ objc_msgSend(v18, "hash");

  return v19;
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSData)archive
{
  return self->_archive;
}

- (void)setArchive:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_archive, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
