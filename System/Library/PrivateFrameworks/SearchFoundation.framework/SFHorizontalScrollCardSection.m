@implementation SFHorizontalScrollCardSection

- (void)setNumberOfRows:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_numberOfRows = a3;
}

- (BOOL)hasNumberOfRows
{
  return *(_BYTE *)&self->_has & 1;
}

- (SFHorizontalScrollCardSection)initWithCoder:(id)a3
{
  id v4;
  SFHorizontalScrollCardSection *v5;
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
    -[SFHorizontalScrollCardSection setType:](v5, "setType:", v12);

    -[SFCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", -[SFCardSection separatorStyle](v8, "separatorStyle"));
    -[SFCardSection backgroundColor](v8, "backgroundColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setBackgroundColor:](v5, "setBackgroundColor:", v13);

    -[SFCardSection cardSections](v8, "cardSections");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFHorizontalScrollCardSection setCardSections:](v5, "setCardSections:", v14);

    -[SFHorizontalScrollCardSection setNumberOfRows:](v5, "setNumberOfRows:", -[SFCardSection numberOfRows](v8, "numberOfRows"));
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
  v3.super_class = (Class)SFHorizontalScrollCardSection;
  -[SFCardSection encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBHorizontalScrollCardSection *v2;
  void *v3;

  v2 = -[_SFPBHorizontalScrollCardSection initWithFacade:]([_SFPBHorizontalScrollCardSection alloc], "initWithFacade:", self);
  -[_SFPBHorizontalScrollCardSection dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBHorizontalScrollCardSection *v2;
  void *v3;

  v2 = -[_SFPBHorizontalScrollCardSection initWithFacade:]([_SFPBHorizontalScrollCardSection alloc], "initWithFacade:", self);
  -[_SFPBHorizontalScrollCardSection jsonData](v2, "jsonData");
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
  v18.super_class = (Class)SFHorizontalScrollCardSection;
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
  -[SFHorizontalScrollCardSection type](self, "type");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setType:", v12);

  objc_msgSend(v4, "setSeparatorStyle:", -[SFCardSection separatorStyle](self, "separatorStyle"));
  -[SFCardSection backgroundColor](self, "backgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setBackgroundColor:", v14);

  -[SFHorizontalScrollCardSection cardSections](self, "cardSections");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v4, "setCardSections:", v16);

  objc_msgSend(v4, "setNumberOfRows:", -[SFHorizontalScrollCardSection numberOfRows](self, "numberOfRows"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  SFHorizontalScrollCardSection *v5;
  SFHorizontalScrollCardSection *v6;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _BOOL4 v25;
  _BOOL4 v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  unint64_t v43;
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
  id v55;
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
  SFHorizontalScrollCardSection *v68;
  void *v69;
  void *v70;
  objc_super v71;

  v5 = (SFHorizontalScrollCardSection *)a3;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (-[SFHorizontalScrollCardSection isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v71.receiver = self;
      v71.super_class = (Class)SFHorizontalScrollCardSection;
      if (-[SFCardSection isEqual:](&v71, sel_isEqual_, v5))
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
          v70 = v10;
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
            v63 = v3;
            v65 = v12;
            -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[SFCardSection punchoutPickerTitle](v6, "punchoutPickerTitle");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v15, "isEqual:", v16) & 1) == 0)
            {

              v11 = 0;
              v10 = v70;
              v3 = v63;
              if (!v9)
                goto LABEL_57;
              goto LABEL_56;
            }
            v61 = v16;
            v62 = v15;
            v67 = v8;
            v68 = v6;
            v17 = v7;
            v18 = v9;
            v19 = v13;
            v3 = v63;
            v20 = v65;
            v21 = v14;
          }
          else
          {
            v67 = v8;
            v68 = v6;
            v17 = v7;
            v18 = v9;
            v19 = v13;
            v20 = v12;
            v21 = 0;
          }
          -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFCardSection punchoutPickerDismissText](v68, "punchoutPickerDismissText");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v21;
          v12 = v20;
          v13 = v19;
          v9 = v18;
          v7 = v17;
          v8 = v67;
          if ((v22 == 0) != (v23 != 0))
          {
            v58 = v13;
            v59 = v23;
            v60 = v22;
            -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            if (v64)
            {
              -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v6 = v68;
              -[SFCardSection punchoutPickerDismissText](v68, "punchoutPickerDismissText");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              if (!objc_msgSend(v13, "isEqual:"))
                goto LABEL_28;
            }
            else
            {
              v6 = v68;
            }
            v57 = v24;
            v25 = -[SFCardSection canBeHidden](self, "canBeHidden");
            if (v25 != -[SFCardSection canBeHidden](v6, "canBeHidden")
              || (v26 = -[SFCardSection hasTopPadding](self, "hasTopPadding"),
                  v26 != -[SFCardSection hasTopPadding](v6, "hasTopPadding"))
              || (v27 = -[SFCardSection hasBottomPadding](self, "hasBottomPadding"),
                  v27 != -[SFCardSection hasBottomPadding](v6, "hasBottomPadding")))
            {
              v24 = v57;
              if (!v64)
              {
LABEL_29:

                if (v24)
                {

                }
                goto LABEL_54;
              }
LABEL_28:

              goto LABEL_29;
            }
            -[SFHorizontalScrollCardSection type](self, "type");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[SFHorizontalScrollCardSection type](v6, "type");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            if ((v28 == 0) != (v29 != 0))
            {
              v55 = v29;
              v69 = v28;
              -[SFHorizontalScrollCardSection type](self, "type");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              if (v30)
              {
                -[SFHorizontalScrollCardSection type](self, "type");
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                -[SFHorizontalScrollCardSection type](v6, "type");
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                if (!objc_msgSend(v54, "isEqual:"))
                {
                  v11 = 0;
                  goto LABEL_72;
                }
                v53 = v30;
              }
              else
              {
                v53 = 0;
              }
              v31 = -[SFCardSection separatorStyle](self, "separatorStyle");
              if (v31 != -[SFCardSection separatorStyle](v6, "separatorStyle"))
              {
                v11 = 0;
                goto LABEL_71;
              }
              -[SFCardSection backgroundColor](self, "backgroundColor");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              -[SFCardSection backgroundColor](v6, "backgroundColor");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              if ((v51 == 0) != (v32 != 0))
              {
                v33 = v32;
                v49 = v7;
                v50 = v13;
                v48 = v9;
                v66 = v12;
                v34 = v3;
                -[SFCardSection backgroundColor](self, "backgroundColor");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                if (v35)
                {
                  -[SFCardSection backgroundColor](self, "backgroundColor");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SFCardSection backgroundColor](v6, "backgroundColor");
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  v47 = v36;
                  if (!objc_msgSend(v36, "isEqual:"))
                  {
                    v11 = 0;
                    goto LABEL_69;
                  }
                }
                -[SFHorizontalScrollCardSection cardSections](self, "cardSections");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                -[SFHorizontalScrollCardSection cardSections](v6, "cardSections");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                v40 = v39;
                if ((v38 == 0) == (v39 != 0))
                {

                  v11 = 0;
                  if (!v35)
                    goto LABEL_70;
                  goto LABEL_69;
                }
                -[SFHorizontalScrollCardSection cardSections](self, "cardSections");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v41
                  || (-[SFHorizontalScrollCardSection cardSections](self, "cardSections"),
                      v42 = (void *)objc_claimAutoreleasedReturnValue(),
                      -[SFHorizontalScrollCardSection cardSections](v6, "cardSections"),
                      v44 = (void *)objc_claimAutoreleasedReturnValue(),
                      v45 = v42,
                      objc_msgSend(v42, "isEqual:")))
                {
                  v43 = -[SFHorizontalScrollCardSection numberOfRows](self, "numberOfRows");
                  v11 = v43 == -[SFHorizontalScrollCardSection numberOfRows](v6, "numberOfRows");
                  if (!v41)
                    goto LABEL_68;
                }
                else
                {
                  v11 = 0;
                }

LABEL_68:
                if (!v35)
                {
LABEL_70:

                  v3 = v34;
                  v12 = v66;
                  v8 = v67;
                  v9 = v48;
                  v7 = v49;
                  v13 = v50;
LABEL_71:
                  v30 = v53;
                  if (!v53)
                  {
LABEL_73:

                    if (v64)
                    {

                    }
                    if (v57)
                    {

                    }
LABEL_55:
                    v10 = v70;
                    if (!v9)
                    {
LABEL_57:

                      goto LABEL_58;
                    }
LABEL_56:

                    goto LABEL_57;
                  }
LABEL_72:

                  goto LABEL_73;
                }
LABEL_69:

                goto LABEL_70;
              }

              if (v53)
              {

              }
              v28 = v69;
              v29 = v55;
            }
            v68 = v6;

            v24 = v57;
            if (v64)
            {

            }
            v23 = v59;
            v22 = v60;
            v13 = v58;
          }

          if (v24)
          {

          }
          v6 = v68;
        }

LABEL_54:
        v11 = 0;
        goto LABEL_55;
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
  unint64_t v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)SFHorizontalScrollCardSection;
  v3 = -[SFCardSection hash](&v22, sel_hash);
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
  -[SFHorizontalScrollCardSection type](self, "type");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 ^ objc_msgSend(v13, "hash");
  v15 = v14 ^ -[SFCardSection separatorStyle](self, "separatorStyle");
  -[SFCardSection backgroundColor](self, "backgroundColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v15 ^ objc_msgSend(v16, "hash");
  -[SFHorizontalScrollCardSection cardSections](self, "cardSections");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v11 ^ v17 ^ objc_msgSend(v18, "hash");
  v20 = v19 ^ -[SFHorizontalScrollCardSection numberOfRows](self, "numberOfRows");

  return v20;
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSArray)cardSections
{
  return self->_cardSections;
}

- (void)setCardSections:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (unint64_t)numberOfRows
{
  return self->_numberOfRows;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardSections, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFHorizontalScrollCardSection)initWithProtobuf:(id)a3
{
  id v4;
  SFHorizontalScrollCardSection *v5;
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
  SFHorizontalScrollCardSection *v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  objc_super v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)SFHorizontalScrollCardSection;
  v5 = -[SFCardSection init](&v42, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "punchoutOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v7 = 0;

    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    objc_msgSend(v4, "punchoutOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v39 != v11)
            objc_enumerationMutation(v8);
          v13 = -[SFPunchout initWithProtobuf:]([SFPunchout alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i));
          if (v13)
            objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
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
      -[SFHorizontalScrollCardSection setType:](v5, "setType:", v19);

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
    objc_msgSend(v4, "cardSections");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
      v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v25 = 0;

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    objc_msgSend(v4, "cardSections", 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v35;
      do
      {
        for (j = 0; j != v28; ++j)
        {
          if (*(_QWORD *)v35 != v29)
            objc_enumerationMutation(v26);
          v31 = -[SFCardSection initWithProtobuf:]([SFCardSection alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * j));
          if (v31)
            objc_msgSend(v25, "addObject:", v31);

        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
      }
      while (v28);
    }

    -[SFHorizontalScrollCardSection setCardSections:](v5, "setCardSections:", v25);
    if (objc_msgSend(v4, "numberOfRows"))
      -[SFHorizontalScrollCardSection setNumberOfRows:](v5, "setNumberOfRows:", objc_msgSend(v4, "numberOfRows"));
    v32 = v5;

  }
  return v5;
}

@end
