@implementation SFAppLinkCardSection

- (SFAppLinkCardSection)initWithCoder:(id)a3
{
  id v4;
  SFAppLinkCardSection *v5;
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

    -[SFCardSection appLinks](v8, "appLinks");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAppLinkCardSection setAppLinks:](v5, "setAppLinks:", v16);

    -[SFCardSection punchoutOptions](v8, "punchoutOptions");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutOptions:](v5, "setPunchoutOptions:", v17);

    -[SFCardSection punchoutPickerTitle](v8, "punchoutPickerTitle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerTitle:](v5, "setPunchoutPickerTitle:", v18);

    -[SFCardSection punchoutPickerDismissText](v8, "punchoutPickerDismissText");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerDismissText:](v5, "setPunchoutPickerDismissText:", v19);

    -[SFCardSection setCanBeHidden:](v5, "setCanBeHidden:", -[SFCardSection canBeHidden](v8, "canBeHidden"));
    -[SFCardSection setHasTopPadding:](v5, "setHasTopPadding:", -[SFCardSection hasTopPadding](v8, "hasTopPadding"));
    -[SFCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", -[SFCardSection hasBottomPadding](v8, "hasBottomPadding"));
    -[SFCardSection type](v8, "type");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFTitleCardSection setType:](v5, "setType:", v20);

    -[SFCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", -[SFCardSection separatorStyle](v8, "separatorStyle"));
    -[SFCardSection backgroundColor](v8, "backgroundColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setBackgroundColor:](v5, "setBackgroundColor:", v21);

    -[SFCardSection title](v8, "title");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFTitleCardSection setTitle:](v5, "setTitle:", v22);

    -[SFCardSection subtitle](v8, "subtitle");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFTitleCardSection setSubtitle:](v5, "setSubtitle:", v23);

    -[SFTitleCardSection setIsCentered:](v5, "setIsCentered:", -[SFCardSection isCentered](v8, "isCentered"));
    -[SFCardSection nextCard](v8, "nextCard");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setNextCard:](v5, "setNextCard:", v24);

    -[SFCardSection commands](v8, "commands");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCommands:](v5, "setCommands:", v25);

    -[SFCardSection parameterKeyPaths](v8, "parameterKeyPaths");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setParameterKeyPaths:](v5, "setParameterKeyPaths:", v26);

    -[SFCardSection cardSectionId](v8, "cardSectionId");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCardSectionId:](v5, "setCardSectionId:", v27);

    -[SFCardSection resultIdentifier](v8, "resultIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setResultIdentifier:](v5, "setResultIdentifier:", v28);

    -[SFCardSection userReportRequest](v8, "userReportRequest");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setUserReportRequest:](v5, "setUserReportRequest:", v29);

    -[SFCardSection command](v8, "command");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCommand:](v5, "setCommand:", v30);

    -[SFCardSection previewCommand](v8, "previewCommand");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewCommand:](v5, "setPreviewCommand:", v31);

    -[SFCardSection previewButtonItems](v8, "previewButtonItems");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewButtonItems:](v5, "setPreviewButtonItems:", v32);

    -[SFCardSection cardSectionDetail](v8, "cardSectionDetail");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCardSectionDetail:](v5, "setCardSectionDetail:", v33);

    -[SFCardSection previewButtonItemsTitle](v8, "previewButtonItemsTitle");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewButtonItemsTitle:](v5, "setPreviewButtonItemsTitle:", v34);

    -[SFCardSection backgroundColor](v8, "backgroundColor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setBackgroundColor:](v5, "setBackgroundColor:", v35);

    -[SFCardSection setShouldHideInAmbientMode:](v5, "setShouldHideInAmbientMode:", -[SFCardSection shouldHideInAmbientMode](v8, "shouldHideInAmbientMode"));
    -[SFCardSection leadingSwipeButtonItems](v8, "leadingSwipeButtonItems");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setLeadingSwipeButtonItems:](v5, "setLeadingSwipeButtonItems:", v36);

    -[SFCardSection trailingSwipeButtonItems](v8, "trailingSwipeButtonItems");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setTrailingSwipeButtonItems:](v5, "setTrailingSwipeButtonItems:", v37);

    -[SFCardSection punchoutOptions](v8, "punchoutOptions");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutOptions:](v5, "setPunchoutOptions:", v38);

    -[SFCardSection punchoutPickerTitle](v8, "punchoutPickerTitle");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerTitle:](v5, "setPunchoutPickerTitle:", v39);

    -[SFCardSection punchoutPickerDismissText](v8, "punchoutPickerDismissText");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerDismissText:](v5, "setPunchoutPickerDismissText:", v40);

    -[SFCardSection setCanBeHidden:](v5, "setCanBeHidden:", -[SFCardSection canBeHidden](v8, "canBeHidden"));
    -[SFCardSection setHasTopPadding:](v5, "setHasTopPadding:", -[SFCardSection hasTopPadding](v8, "hasTopPadding"));
    -[SFCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", -[SFCardSection hasBottomPadding](v8, "hasBottomPadding"));
    -[SFCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", -[SFCardSection separatorStyle](v8, "separatorStyle"));
    -[SFCardSection referencedCommands](v8, "referencedCommands");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setReferencedCommands:](v5, "setReferencedCommands:", v41);

    -[SFCardSection setForceEnable3DTouch:](v5, "setForceEnable3DTouch:", -[SFCardSection forceEnable3DTouch](v8, "forceEnable3DTouch"));
    -[SFCardSection setShouldShowInSmartDialog:](v5, "setShouldShowInSmartDialog:", -[SFCardSection shouldShowInSmartDialog](v8, "shouldShowInSmartDialog"));
    -[SFCardSection appEntityAnnotation](v8, "appEntityAnnotation");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setAppEntityAnnotation:](v5, "setAppEntityAnnotation:", v42);

    -[SFCardSection emphasisSubjectId](v8, "emphasisSubjectId");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setEmphasisSubjectId:](v5, "setEmphasisSubjectId:", v43);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFAppLinkCardSection;
  -[SFTitleCardSection encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBAppLinkCardSection *v2;
  void *v3;

  v2 = -[_SFPBAppLinkCardSection initWithFacade:]([_SFPBAppLinkCardSection alloc], "initWithFacade:", self);
  -[_SFPBAppLinkCardSection dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBAppLinkCardSection *v2;
  void *v3;

  v2 = -[_SFPBAppLinkCardSection initWithFacade:]([_SFPBAppLinkCardSection alloc], "initWithFacade:", self);
  -[_SFPBAppLinkCardSection jsonData](v2, "jsonData");
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
  v22.super_class = (Class)SFAppLinkCardSection;
  v4 = -[SFTitleCardSection copyWithZone:](&v22, sel_copyWithZone_, a3);
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

  -[SFAppLinkCardSection appLinks](self, "appLinks");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");
  objc_msgSend(v4, "setAppLinks:", v20);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SFAppLinkCardSection *v4;
  SFAppLinkCardSection *v5;
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

  v4 = (SFAppLinkCardSection *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    if (-[SFAppLinkCardSection isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
    {
      v67.receiver = self;
      v67.super_class = (Class)SFAppLinkCardSection;
      if (-[SFTitleCardSection isEqual:](&v67, sel_isEqual_, v4))
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
              -[SFTitleCardSection type](self, "type");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              -[SFTitleCardSection type](v5, "type");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              if ((v25 == 0) != (v26 != 0))
              {
                v55 = v26;
                v56 = v25;
                -[SFTitleCardSection type](self, "type");
                v14 = v64;
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                if (v57)
                {
                  -[SFTitleCardSection type](self, "type");
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SFTitleCardSection type](v5, "type");
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
                    -[SFTitleCardSection title](self, "title");
                    v49 = (void *)objc_claimAutoreleasedReturnValue();
                    -[SFTitleCardSection title](v5, "title");
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
                    -[SFTitleCardSection title](self, "title");
                    v45 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v45)
                    {
                      -[SFTitleCardSection title](self, "title");
                      v31 = (void *)objc_claimAutoreleasedReturnValue();
                      -[SFTitleCardSection title](v5, "title");
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
                    -[SFTitleCardSection subtitle](self, "subtitle");
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    -[SFTitleCardSection subtitle](v5, "subtitle");
                    v43 = (void *)objc_claimAutoreleasedReturnValue();
                    if ((v44 == 0) == (v43 != 0))
                    {

                      v11 = 0;
                      goto LABEL_72;
                    }
                    -[SFTitleCardSection subtitle](self, "subtitle");
                    v40 = (void *)objc_claimAutoreleasedReturnValue();
                    if (!v40
                      || (-[SFTitleCardSection subtitle](self, "subtitle"),
                          v32 = (void *)objc_claimAutoreleasedReturnValue(),
                          -[SFTitleCardSection subtitle](v5, "subtitle"),
                          v38 = (void *)objc_claimAutoreleasedReturnValue(),
                          v39 = v32,
                          objc_msgSend(v32, "isEqual:")))
                    {
                      -[SFAppLinkCardSection appLinks](self, "appLinks");
                      v37 = (void *)objc_claimAutoreleasedReturnValue();
                      -[SFAppLinkCardSection appLinks](v5, "appLinks");
                      v36 = (void *)objc_claimAutoreleasedReturnValue();
                      if ((v37 == 0) == (v36 != 0))
                      {

                        v11 = 0;
                      }
                      else
                      {
                        -[SFAppLinkCardSection appLinks](self, "appLinks");
                        v35 = (void *)objc_claimAutoreleasedReturnValue();
                        if (v35)
                        {
                          -[SFAppLinkCardSection appLinks](self, "appLinks");
                          v34 = (void *)objc_claimAutoreleasedReturnValue();
                          -[SFAppLinkCardSection appLinks](v5, "appLinks");
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
  v25.super_class = (Class)SFAppLinkCardSection;
  v3 = -[SFTitleCardSection hash](&v25, sel_hash);
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
  -[SFTitleCardSection type](self, "type");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 ^ objc_msgSend(v13, "hash");
  v15 = v14 ^ -[SFCardSection separatorStyle](self, "separatorStyle");
  -[SFCardSection backgroundColor](self, "backgroundColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v15 ^ objc_msgSend(v16, "hash");
  -[SFTitleCardSection title](self, "title");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v11 ^ v17 ^ objc_msgSend(v18, "hash");
  -[SFTitleCardSection subtitle](self, "subtitle");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "hash");
  -[SFAppLinkCardSection appLinks](self, "appLinks");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v19 ^ v21 ^ objc_msgSend(v22, "hash");

  return v23;
}

- (NSArray)appLinks
{
  return self->_appLinks;
}

- (void)setAppLinks:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appLinks, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFAppLinkCardSection)initWithProtobuf:(id)a3
{
  id v4;
  SFAppLinkCardSection *v5;
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
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  SFAppLink *v35;
  SFAppLinkCardSection *v36;
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
  v46.super_class = (Class)SFAppLinkCardSection;
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
    objc_msgSend(v4, "appLinks");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
      v29 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v29 = 0;

    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    objc_msgSend(v4, "appLinks", 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v39;
      do
      {
        for (j = 0; j != v32; ++j)
        {
          if (*(_QWORD *)v39 != v33)
            objc_enumerationMutation(v30);
          v35 = -[SFAppLink initWithProtobuf:]([SFAppLink alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * j));
          if (v35)
            objc_msgSend(v29, "addObject:", v35);

        }
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
      }
      while (v32);
    }

    -[SFAppLinkCardSection setAppLinks:](v5, "setAppLinks:", v29);
    v36 = v5;

  }
  return v5;
}

@end
