@implementation SFStrokeAnimationCardSection

- (SFStrokeAnimationCardSection)initWithCoder:(id)a3
{
  id v4;
  SFStrokeAnimationCardSection *v5;
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
    -[SFStrokeAnimationCardSection setType:](v5, "setType:", v12);

    -[SFCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", -[SFCardSection separatorStyle](v8, "separatorStyle"));
    -[SFCardSection backgroundColor](v8, "backgroundColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setBackgroundColor:](v5, "setBackgroundColor:", v13);

    -[SFCardSection strokeAnimationRepresentation](v8, "strokeAnimationRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFStrokeAnimationCardSection setStrokeAnimationRepresentation:](v5, "setStrokeAnimationRepresentation:", v14);

    -[SFCardSection strokeNames](v8, "strokeNames");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFStrokeAnimationCardSection setStrokeNames:](v5, "setStrokeNames:", v15);

    -[SFCardSection characters](v8, "characters");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFStrokeAnimationCardSection setCharacters:](v5, "setCharacters:", v16);

    -[SFCardSection pronunciations](v8, "pronunciations");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFStrokeAnimationCardSection setPronunciations:](v5, "setPronunciations:", v17);

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
  v3.super_class = (Class)SFStrokeAnimationCardSection;
  -[SFCardSection encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBStrokeAnimationCardSection *v2;
  void *v3;

  v2 = -[_SFPBStrokeAnimationCardSection initWithFacade:]([_SFPBStrokeAnimationCardSection alloc], "initWithFacade:", self);
  -[_SFPBStrokeAnimationCardSection dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBStrokeAnimationCardSection *v2;
  void *v3;

  v2 = -[_SFPBStrokeAnimationCardSection initWithFacade:]([_SFPBStrokeAnimationCardSection alloc], "initWithFacade:", self);
  -[_SFPBStrokeAnimationCardSection jsonData](v2, "jsonData");
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
  v24.super_class = (Class)SFStrokeAnimationCardSection;
  v4 = -[SFCardSection copyWithZone:](&v24, sel_copyWithZone_, a3);
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
  -[SFStrokeAnimationCardSection type](self, "type");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setType:", v12);

  objc_msgSend(v4, "setSeparatorStyle:", -[SFCardSection separatorStyle](self, "separatorStyle"));
  -[SFCardSection backgroundColor](self, "backgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setBackgroundColor:", v14);

  -[SFStrokeAnimationCardSection strokeAnimationRepresentation](self, "strokeAnimationRepresentation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v4, "setStrokeAnimationRepresentation:", v16);

  -[SFStrokeAnimationCardSection strokeNames](self, "strokeNames");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");
  objc_msgSend(v4, "setStrokeNames:", v18);

  -[SFStrokeAnimationCardSection characters](self, "characters");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");
  objc_msgSend(v4, "setCharacters:", v20);

  -[SFStrokeAnimationCardSection pronunciations](self, "pronunciations");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "copy");
  objc_msgSend(v4, "setPronunciations:", v22);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  SFStrokeAnimationCardSection *v5;
  SFStrokeAnimationCardSection *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  _BOOL4 v23;
  _BOOL4 v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  int v29;
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
  objc_super v77;

  v5 = (SFStrokeAnimationCardSection *)a3;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (-[SFStrokeAnimationCardSection isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v77.receiver = self;
      v77.super_class = (Class)SFStrokeAnimationCardSection;
      if (-[SFCardSection isEqual:](&v77, sel_isEqual_, v5))
      {
        v6 = v5;
        -[SFCardSection punchoutOptions](self, "punchoutOptions");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFCardSection punchoutOptions](v6, "punchoutOptions");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v7 == 0) == (v8 != 0))
        {
          v11 = 0;
LABEL_40:

          goto LABEL_41;
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
LABEL_38:

            goto LABEL_39;
          }
          v75 = v3;
          v76 = v10;
        }
        -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFCardSection punchoutPickerTitle](v6, "punchoutPickerTitle");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v12 == 0) == (v13 != 0))
          goto LABEL_35;
        -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
          v15 = objc_claimAutoreleasedReturnValue();
          -[SFCardSection punchoutPickerTitle](v6, "punchoutPickerTitle");
          v16 = objc_claimAutoreleasedReturnValue();
          v72 = (void *)v15;
          v17 = (void *)v15;
          v3 = (void *)v16;
          if (!objc_msgSend(v17, "isEqual:", v16))
            goto LABEL_34;
        }
        v73 = v12;
        v74 = v14;
        -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFCardSection punchoutPickerDismissText](v6, "punchoutPickerDismissText");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v18 == 0) == (v19 != 0))
        {

          goto LABEL_33;
        }
        v69 = v18;
        v70 = v19;
        -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        if (v71)
        {
          -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
          v20 = objc_claimAutoreleasedReturnValue();
          -[SFCardSection punchoutPickerDismissText](v6, "punchoutPickerDismissText");
          v21 = objc_claimAutoreleasedReturnValue();
          v68 = (void *)v20;
          v22 = (void *)v20;
          v18 = (void *)v21;
          if (!objc_msgSend(v22, "isEqual:", v21))
            goto LABEL_31;
        }
        v23 = -[SFCardSection canBeHidden](self, "canBeHidden");
        if (v23 == -[SFCardSection canBeHidden](v6, "canBeHidden"))
        {
          v24 = -[SFCardSection hasTopPadding](self, "hasTopPadding");
          if (v24 == -[SFCardSection hasTopPadding](v6, "hasTopPadding"))
          {
            v25 = -[SFCardSection hasBottomPadding](self, "hasBottomPadding");
            if (v25 == -[SFCardSection hasBottomPadding](v6, "hasBottomPadding"))
            {
              -[SFStrokeAnimationCardSection type](self, "type");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              -[SFStrokeAnimationCardSection type](v6, "type");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              if ((v26 == 0) != (v27 != 0))
              {
                v65 = v27;
                v66 = v26;
                -[SFStrokeAnimationCardSection type](self, "type");
                v14 = v74;
                v67 = (void *)objc_claimAutoreleasedReturnValue();
                if (v67)
                {
                  -[SFStrokeAnimationCardSection type](self, "type");
                  v64 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SFStrokeAnimationCardSection type](v6, "type");
                  v63 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!objc_msgSend(v64, "isEqual:"))
                    goto LABEL_50;
                }
                v29 = -[SFCardSection separatorStyle](self, "separatorStyle");
                if (v29 == -[SFCardSection separatorStyle](v6, "separatorStyle"))
                {
                  -[SFCardSection backgroundColor](self, "backgroundColor");
                  v62 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SFCardSection backgroundColor](v6, "backgroundColor");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  if ((v62 == 0) != (v30 != 0))
                  {
                    v60 = v3;
                    v61 = v30;
                    v59 = v18;
                    -[SFCardSection backgroundColor](self, "backgroundColor");
                    v31 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v31)
                    {
                      -[SFCardSection backgroundColor](self, "backgroundColor");
                      v32 = (void *)objc_claimAutoreleasedReturnValue();
                      -[SFCardSection backgroundColor](v6, "backgroundColor");
                      v56 = (void *)objc_claimAutoreleasedReturnValue();
                      v57 = v32;
                      if (!objc_msgSend(v32, "isEqual:"))
                      {
LABEL_57:

LABEL_58:
                        v14 = v74;
                        v18 = v59;
                        v3 = v60;
LABEL_49:
                        if (!v67)
                        {
LABEL_51:

LABEL_30:
                          if (!v71)
                          {
LABEL_32:

LABEL_33:
                            v12 = v73;
                            if (!v14)
                            {
LABEL_35:

                              goto LABEL_36;
                            }
LABEL_34:

                            goto LABEL_35;
                          }
LABEL_31:

                          goto LABEL_32;
                        }
LABEL_50:

                        goto LABEL_51;
                      }
                    }
                    -[SFStrokeAnimationCardSection strokeAnimationRepresentation](self, "strokeAnimationRepresentation");
                    v58 = (void *)objc_claimAutoreleasedReturnValue();
                    -[SFStrokeAnimationCardSection strokeAnimationRepresentation](v6, "strokeAnimationRepresentation");
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    v34 = v33;
                    if ((v58 == 0) == (v33 != 0))
                    {

                      if (!v31)
                        goto LABEL_58;
                      goto LABEL_57;
                    }
                    -[SFStrokeAnimationCardSection strokeAnimationRepresentation](self, "strokeAnimationRepresentation");
                    v55 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v55)
                    {
                      -[SFStrokeAnimationCardSection strokeAnimationRepresentation](self, "strokeAnimationRepresentation");
                      v35 = (void *)objc_claimAutoreleasedReturnValue();
                      -[SFStrokeAnimationCardSection strokeAnimationRepresentation](v6, "strokeAnimationRepresentation");
                      v51 = (void *)objc_claimAutoreleasedReturnValue();
                      v52 = v35;
                      if (!objc_msgSend(v35, "isEqual:"))
                        goto LABEL_65;
                    }
                    -[SFStrokeAnimationCardSection strokeNames](self, "strokeNames");
                    v54 = (void *)objc_claimAutoreleasedReturnValue();
                    -[SFStrokeAnimationCardSection strokeNames](v6, "strokeNames");
                    v53 = (void *)objc_claimAutoreleasedReturnValue();
                    if ((v54 == 0) == (v53 != 0))
                    {

                      if (!v55)
                      {
LABEL_66:

                        if (v31)
                        {

                        }
                        if (v67)
                        {

                        }
                        if (v71)
                        {

                        }
                        if (v74)
                        {

                        }
LABEL_36:
                        v11 = 0;
                        if (!v9)
                        {
LABEL_39:

                          goto LABEL_40;
                        }
                        goto LABEL_37;
                      }
LABEL_65:

                      goto LABEL_66;
                    }
                    -[SFStrokeAnimationCardSection strokeNames](self, "strokeNames");
                    v50 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v50)
                    {
                      -[SFStrokeAnimationCardSection strokeNames](self, "strokeNames");
                      v36 = (void *)objc_claimAutoreleasedReturnValue();
                      -[SFStrokeAnimationCardSection strokeNames](v6, "strokeNames");
                      v46 = (void *)objc_claimAutoreleasedReturnValue();
                      v47 = v36;
                      if (!objc_msgSend(v36, "isEqual:"))
                      {
                        v11 = 0;
LABEL_89:

LABEL_90:
                        if (v55)
                        {

                        }
                        if (v31)
                        {

                        }
                        if (v67)
                        {

                        }
                        if (v71)
                        {

                        }
                        if (v74)
                        {

                        }
                        if (!v9)
                          goto LABEL_39;
LABEL_37:
                        v3 = v75;
                        v10 = v76;
                        goto LABEL_38;
                      }
                    }
                    -[SFStrokeAnimationCardSection characters](self, "characters");
                    v49 = (void *)objc_claimAutoreleasedReturnValue();
                    -[SFStrokeAnimationCardSection characters](v6, "characters");
                    v48 = (void *)objc_claimAutoreleasedReturnValue();
                    if ((v49 == 0) == (v48 != 0))
                    {

                      v11 = 0;
                      goto LABEL_88;
                    }
                    -[SFStrokeAnimationCardSection characters](self, "characters");
                    v45 = (void *)objc_claimAutoreleasedReturnValue();
                    if (!v45
                      || (-[SFStrokeAnimationCardSection characters](self, "characters"),
                          v37 = (void *)objc_claimAutoreleasedReturnValue(),
                          -[SFStrokeAnimationCardSection characters](v6, "characters"),
                          v43 = (void *)objc_claimAutoreleasedReturnValue(),
                          v44 = v37,
                          objc_msgSend(v37, "isEqual:")))
                    {
                      -[SFStrokeAnimationCardSection pronunciations](self, "pronunciations");
                      v42 = (void *)objc_claimAutoreleasedReturnValue();
                      -[SFStrokeAnimationCardSection pronunciations](v6, "pronunciations");
                      v41 = (void *)objc_claimAutoreleasedReturnValue();
                      if ((v42 == 0) == (v41 != 0))
                      {

                        v11 = 0;
                      }
                      else
                      {
                        -[SFStrokeAnimationCardSection pronunciations](self, "pronunciations");
                        v40 = (void *)objc_claimAutoreleasedReturnValue();
                        if (v40)
                        {
                          -[SFStrokeAnimationCardSection pronunciations](self, "pronunciations");
                          v39 = (void *)objc_claimAutoreleasedReturnValue();
                          -[SFStrokeAnimationCardSection pronunciations](v6, "pronunciations");
                          v38 = (void *)objc_claimAutoreleasedReturnValue();
                          v11 = objc_msgSend(v39, "isEqual:", v38);

                        }
                        else
                        {

                          v11 = 1;
                        }
                      }
                      if (!v45)
                        goto LABEL_87;
                    }
                    else
                    {
                      v11 = 0;
                    }

LABEL_87:
LABEL_88:
                    if (!v50)
                      goto LABEL_90;
                    goto LABEL_89;
                  }

                }
                v14 = v74;
                goto LABEL_49;
              }

            }
          }
        }
        v14 = v74;
        goto LABEL_30;
      }
    }
    v11 = 0;
  }
LABEL_41:

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
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
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
  unint64_t v24;
  void *v26;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)SFStrokeAnimationCardSection;
  v3 = -[SFCardSection hash](&v27, sel_hash);
  -[SFCardSection punchoutOptions](self, "punchoutOptions");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v26, "hash");
  -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ objc_msgSend(v5, "hash");
  -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");
  v9 = v8 ^ -[SFCardSection canBeHidden](self, "canBeHidden");
  v10 = v9 ^ -[SFCardSection hasTopPadding](self, "hasTopPadding") ^ v3;
  v11 = -[SFCardSection hasBottomPadding](self, "hasBottomPadding");
  -[SFStrokeAnimationCardSection type](self, "type");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11 ^ objc_msgSend(v12, "hash");
  v14 = v13 ^ -[SFCardSection separatorStyle](self, "separatorStyle");
  -[SFCardSection backgroundColor](self, "backgroundColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v14 ^ objc_msgSend(v15, "hash");
  -[SFStrokeAnimationCardSection strokeAnimationRepresentation](self, "strokeAnimationRepresentation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v10 ^ v16 ^ objc_msgSend(v17, "hash");
  -[SFStrokeAnimationCardSection strokeNames](self, "strokeNames");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "hash");
  -[SFStrokeAnimationCardSection characters](self, "characters");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v20 ^ objc_msgSend(v21, "hash");
  -[SFStrokeAnimationCardSection pronunciations](self, "pronunciations");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v18 ^ v22 ^ objc_msgSend(v23, "hash");

  return v24;
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSString)strokeAnimationRepresentation
{
  return self->_strokeAnimationRepresentation;
}

- (void)setStrokeAnimationRepresentation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSArray)strokeNames
{
  return self->_strokeNames;
}

- (void)setStrokeNames:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSArray)characters
{
  return self->_characters;
}

- (void)setCharacters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (NSArray)pronunciations
{
  return self->_pronunciations;
}

- (void)setPronunciations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pronunciations, 0);
  objc_storeStrong((id *)&self->_characters, 0);
  objc_storeStrong((id *)&self->_strokeNames, 0);
  objc_storeStrong((id *)&self->_strokeAnimationRepresentation, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFStrokeAnimationCardSection)initWithProtobuf:(id)a3
{
  id v4;
  SFStrokeAnimationCardSection *v5;
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
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  id v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t k;
  void *v40;
  id v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t m;
  SFStrokeAnimationCardSection *v47;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  objc_super v65;
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v65.receiver = self;
  v65.super_class = (Class)SFStrokeAnimationCardSection;
  v5 = -[SFCardSection init](&v65, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "punchoutOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v7 = 0;

    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    objc_msgSend(v4, "punchoutOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v62;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v62 != v11)
            objc_enumerationMutation(v8);
          v13 = -[SFPunchout initWithProtobuf:]([SFPunchout alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * i));
          if (v13)
            objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
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
      -[SFStrokeAnimationCardSection setType:](v5, "setType:", v19);

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
    objc_msgSend(v4, "strokeAnimationRepresentation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v4, "strokeAnimationRepresentation");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFStrokeAnimationCardSection setStrokeAnimationRepresentation:](v5, "setStrokeAnimationRepresentation:", v25);

    }
    objc_msgSend(v4, "strokeNames");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
      v27 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v27 = 0;

    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    objc_msgSend(v4, "strokeNames");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v57, v68, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v58;
      do
      {
        for (j = 0; j != v30; ++j)
        {
          if (*(_QWORD *)v58 != v31)
            objc_enumerationMutation(v28);
          if (*(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * j))
            objc_msgSend(v27, "addObject:");
        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v57, v68, 16);
      }
      while (v30);
    }

    -[SFStrokeAnimationCardSection setStrokeNames:](v5, "setStrokeNames:", v27);
    objc_msgSend(v4, "characters");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33)
      v34 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v34 = 0;

    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    objc_msgSend(v4, "characters");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v53, v67, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v54;
      do
      {
        for (k = 0; k != v37; ++k)
        {
          if (*(_QWORD *)v54 != v38)
            objc_enumerationMutation(v35);
          if (*(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * k))
            objc_msgSend(v34, "addObject:");
        }
        v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v53, v67, 16);
      }
      while (v37);
    }

    -[SFStrokeAnimationCardSection setCharacters:](v5, "setCharacters:", v34);
    objc_msgSend(v4, "pronunciations");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (v40)
      v41 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v41 = 0;

    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    objc_msgSend(v4, "pronunciations", 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v49, v66, 16);
    if (v43)
    {
      v44 = v43;
      v45 = *(_QWORD *)v50;
      do
      {
        for (m = 0; m != v44; ++m)
        {
          if (*(_QWORD *)v50 != v45)
            objc_enumerationMutation(v42);
          if (*(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * m))
            objc_msgSend(v41, "addObject:");
        }
        v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v49, v66, 16);
      }
      while (v44);
    }

    -[SFStrokeAnimationCardSection setPronunciations:](v5, "setPronunciations:", v41);
    v47 = v5;

  }
  return v5;
}

@end
