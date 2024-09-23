@implementation SFHeroTitleCardSection

- (void)setMaxVisibleButtonItems:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_maxVisibleButtonItems = a3;
}

- (BOOL)hasMaxVisibleButtonItems
{
  return *(_BYTE *)&self->_has & 1;
}

- (SFHeroTitleCardSection)initWithCoder:(id)a3
{
  id v4;
  SFHeroTitleCardSection *v5;
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
    -[SFHeroTitleCardSection setType:](v5, "setType:", v12);

    -[SFCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", -[SFCardSection separatorStyle](v8, "separatorStyle"));
    -[SFCardSection backgroundColor](v8, "backgroundColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setBackgroundColor:](v5, "setBackgroundColor:", v13);

    -[SFCardSection title](v8, "title");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFHeroTitleCardSection setTitle:](v5, "setTitle:", v14);

    -[SFCardSection subtitle](v8, "subtitle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFHeroTitleCardSection setSubtitle:](v5, "setSubtitle:", v15);

    -[SFCardSection buttonItems](v8, "buttonItems");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFHeroTitleCardSection setButtonItems:](v5, "setButtonItems:", v16);

    -[SFHeroTitleCardSection setMaxVisibleButtonItems:](v5, "setMaxVisibleButtonItems:", -[SFCardSection maxVisibleButtonItems](v8, "maxVisibleButtonItems"));
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
  v3.super_class = (Class)SFHeroTitleCardSection;
  -[SFCardSection encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBHeroTitleCardSection *v2;
  void *v3;

  v2 = -[_SFPBHeroTitleCardSection initWithFacade:]([_SFPBHeroTitleCardSection alloc], "initWithFacade:", self);
  -[_SFPBHeroTitleCardSection dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBHeroTitleCardSection *v2;
  void *v3;

  v2 = -[_SFPBHeroTitleCardSection initWithFacade:]([_SFPBHeroTitleCardSection alloc], "initWithFacade:", self);
  -[_SFPBHeroTitleCardSection jsonData](v2, "jsonData");
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
  v22.super_class = (Class)SFHeroTitleCardSection;
  v4 = -[SFCardSection copyWithZone:](&v22, sel_copyWithZone_, a3);
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
  -[SFHeroTitleCardSection type](self, "type");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setType:", v12);

  objc_msgSend(v4, "setSeparatorStyle:", -[SFCardSection separatorStyle](self, "separatorStyle"));
  -[SFCardSection backgroundColor](self, "backgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setBackgroundColor:", v14);

  -[SFHeroTitleCardSection title](self, "title");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v4, "setTitle:", v16);

  -[SFHeroTitleCardSection subtitle](self, "subtitle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");
  objc_msgSend(v4, "setSubtitle:", v18);

  -[SFHeroTitleCardSection buttonItems](self, "buttonItems");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");
  objc_msgSend(v4, "setButtonItems:", v20);

  objc_msgSend(v4, "setMaxVisibleButtonItems:", -[SFHeroTitleCardSection maxVisibleButtonItems](self, "maxVisibleButtonItems"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  SFHeroTitleCardSection *v5;
  SFHeroTitleCardSection *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
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
  unint64_t v38;
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
  objc_super v73;

  v5 = (SFHeroTitleCardSection *)a3;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (-[SFHeroTitleCardSection isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v73.receiver = self;
      v73.super_class = (Class)SFHeroTitleCardSection;
      if (-[SFCardSection isEqual:](&v73, sel_isEqual_, v5))
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
          v71 = v3;
          v72 = v10;
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
          v68 = (void *)v15;
          v17 = (void *)v15;
          v3 = (void *)v16;
          if (!objc_msgSend(v17, "isEqual:", v16))
            goto LABEL_34;
        }
        v69 = v12;
        v70 = v14;
        -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFCardSection punchoutPickerDismissText](v6, "punchoutPickerDismissText");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v18 == 0) == (v19 != 0))
        {

          goto LABEL_33;
        }
        v65 = v18;
        v66 = v19;
        -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        if (v67)
        {
          -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
          v20 = objc_claimAutoreleasedReturnValue();
          -[SFCardSection punchoutPickerDismissText](v6, "punchoutPickerDismissText");
          v21 = objc_claimAutoreleasedReturnValue();
          v64 = (void *)v20;
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
              -[SFHeroTitleCardSection type](self, "type");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              -[SFHeroTitleCardSection type](v6, "type");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              if ((v26 == 0) != (v27 != 0))
              {
                v61 = v27;
                v62 = v26;
                -[SFHeroTitleCardSection type](self, "type");
                v14 = v70;
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                if (v63)
                {
                  -[SFHeroTitleCardSection type](self, "type");
                  v60 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SFHeroTitleCardSection type](v6, "type");
                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!objc_msgSend(v60, "isEqual:"))
                    goto LABEL_50;
                }
                v29 = -[SFCardSection separatorStyle](self, "separatorStyle");
                if (v29 == -[SFCardSection separatorStyle](v6, "separatorStyle"))
                {
                  -[SFCardSection backgroundColor](self, "backgroundColor");
                  v58 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SFCardSection backgroundColor](v6, "backgroundColor");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  if ((v58 == 0) != (v30 != 0))
                  {
                    v56 = v3;
                    v57 = v30;
                    v55 = v18;
                    -[SFCardSection backgroundColor](self, "backgroundColor");
                    v31 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v31)
                    {
                      -[SFCardSection backgroundColor](self, "backgroundColor");
                      v32 = (void *)objc_claimAutoreleasedReturnValue();
                      -[SFCardSection backgroundColor](v6, "backgroundColor");
                      v52 = (void *)objc_claimAutoreleasedReturnValue();
                      v53 = v32;
                      if (!objc_msgSend(v32, "isEqual:"))
                      {
LABEL_57:

LABEL_58:
                        v14 = v70;
                        v18 = v55;
                        v3 = v56;
LABEL_49:
                        if (!v63)
                        {
LABEL_51:

LABEL_30:
                          if (!v67)
                          {
LABEL_32:

LABEL_33:
                            v12 = v69;
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
                    -[SFHeroTitleCardSection title](self, "title");
                    v54 = (void *)objc_claimAutoreleasedReturnValue();
                    -[SFHeroTitleCardSection title](v6, "title");
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    v34 = v33;
                    if ((v54 == 0) == (v33 != 0))
                    {

                      if (!v31)
                        goto LABEL_58;
                      goto LABEL_57;
                    }
                    -[SFHeroTitleCardSection title](self, "title");
                    v51 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v51)
                    {
                      -[SFHeroTitleCardSection title](self, "title");
                      v35 = (void *)objc_claimAutoreleasedReturnValue();
                      -[SFHeroTitleCardSection title](v6, "title");
                      v47 = (void *)objc_claimAutoreleasedReturnValue();
                      v48 = v35;
                      if (!objc_msgSend(v35, "isEqual:"))
                        goto LABEL_65;
                    }
                    -[SFHeroTitleCardSection subtitle](self, "subtitle");
                    v50 = (void *)objc_claimAutoreleasedReturnValue();
                    -[SFHeroTitleCardSection subtitle](v6, "subtitle");
                    v49 = (void *)objc_claimAutoreleasedReturnValue();
                    if ((v50 == 0) == (v49 != 0))
                    {

                      if (!v51)
                      {
LABEL_66:

                        if (v31)
                        {

                        }
                        if (v63)
                        {

                        }
                        if (v67)
                        {

                        }
                        if (v70)
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
                    -[SFHeroTitleCardSection subtitle](self, "subtitle");
                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v46)
                    {
                      -[SFHeroTitleCardSection subtitle](self, "subtitle");
                      v36 = (void *)objc_claimAutoreleasedReturnValue();
                      -[SFHeroTitleCardSection subtitle](v6, "subtitle");
                      v42 = (void *)objc_claimAutoreleasedReturnValue();
                      v43 = v36;
                      if (!objc_msgSend(v36, "isEqual:"))
                      {
                        v11 = 0;
LABEL_84:

LABEL_85:
                        if (v51)
                        {

                        }
                        if (v31)
                        {

                        }
                        if (v63)
                        {

                        }
                        if (v67)
                        {

                        }
                        if (v70)
                        {

                        }
                        if (!v9)
                          goto LABEL_39;
LABEL_37:
                        v3 = v71;
                        v10 = v72;
                        goto LABEL_38;
                      }
                    }
                    -[SFHeroTitleCardSection buttonItems](self, "buttonItems");
                    v45 = (void *)objc_claimAutoreleasedReturnValue();
                    -[SFHeroTitleCardSection buttonItems](v6, "buttonItems");
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    if ((v45 == 0) == (v44 != 0))
                    {

                      v11 = 0;
                      goto LABEL_83;
                    }
                    -[SFHeroTitleCardSection buttonItems](self, "buttonItems");
                    v41 = (void *)objc_claimAutoreleasedReturnValue();
                    if (!v41
                      || (-[SFHeroTitleCardSection buttonItems](self, "buttonItems"),
                          v37 = (void *)objc_claimAutoreleasedReturnValue(),
                          -[SFHeroTitleCardSection buttonItems](v6, "buttonItems"),
                          v39 = (void *)objc_claimAutoreleasedReturnValue(),
                          v40 = v37,
                          objc_msgSend(v37, "isEqual:")))
                    {
                      v38 = -[SFHeroTitleCardSection maxVisibleButtonItems](self, "maxVisibleButtonItems");
                      v11 = v38 == -[SFHeroTitleCardSection maxVisibleButtonItems](v6, "maxVisibleButtonItems");
                      if (!v41)
                      {
LABEL_82:

LABEL_83:
                        if (!v46)
                          goto LABEL_85;
                        goto LABEL_84;
                      }
                    }
                    else
                    {
                      v11 = 0;
                    }

                    goto LABEL_82;
                  }

                }
                v14 = v70;
                goto LABEL_49;
              }

            }
          }
        }
        v14 = v70;
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
  unint64_t v23;
  void *v25;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)SFHeroTitleCardSection;
  v3 = -[SFCardSection hash](&v26, sel_hash);
  -[SFCardSection punchoutOptions](self, "punchoutOptions");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v25, "hash");
  -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ objc_msgSend(v5, "hash");
  -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");
  v9 = v8 ^ -[SFCardSection canBeHidden](self, "canBeHidden");
  v10 = v9 ^ -[SFCardSection hasTopPadding](self, "hasTopPadding") ^ v3;
  v11 = -[SFCardSection hasBottomPadding](self, "hasBottomPadding");
  -[SFHeroTitleCardSection type](self, "type");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11 ^ objc_msgSend(v12, "hash");
  v14 = v13 ^ -[SFCardSection separatorStyle](self, "separatorStyle");
  -[SFCardSection backgroundColor](self, "backgroundColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v14 ^ objc_msgSend(v15, "hash");
  -[SFHeroTitleCardSection title](self, "title");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v10 ^ v16 ^ objc_msgSend(v17, "hash");
  -[SFHeroTitleCardSection subtitle](self, "subtitle");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "hash");
  -[SFHeroTitleCardSection buttonItems](self, "buttonItems");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v20 ^ objc_msgSend(v21, "hash");
  v23 = v18 ^ v22 ^ -[SFHeroTitleCardSection maxVisibleButtonItems](self, "maxVisibleButtonItems");

  return v23;
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (SFRichText)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (SFRichText)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_subtitle, a3);
}

- (NSArray)buttonItems
{
  return self->_buttonItems;
}

- (void)setButtonItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (unint64_t)maxVisibleButtonItems
{
  return self->_maxVisibleButtonItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonItems, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFHeroTitleCardSection)initWithProtobuf:(id)a3
{
  id v4;
  SFHeroTitleCardSection *v5;
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
  SFRichText *v25;
  void *v26;
  SFRichText *v27;
  void *v28;
  SFRichText *v29;
  void *v30;
  SFRichText *v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  SFButtonItem *v39;
  SFHeroTitleCardSection *v40;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  objc_super v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)SFHeroTitleCardSection;
  v5 = -[SFCardSection init](&v50, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "punchoutOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v7 = 0;

    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    objc_msgSend(v4, "punchoutOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v47;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v47 != v11)
            objc_enumerationMutation(v8);
          v13 = -[SFPunchout initWithProtobuf:]([SFPunchout alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i));
          if (v13)
            objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
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
      -[SFHeroTitleCardSection setType:](v5, "setType:", v19);

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
      v25 = [SFRichText alloc];
      objc_msgSend(v4, "title");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[SFRichText initWithProtobuf:](v25, "initWithProtobuf:", v26);
      -[SFHeroTitleCardSection setTitle:](v5, "setTitle:", v27);

    }
    objc_msgSend(v4, "subtitle");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      v29 = [SFRichText alloc];
      objc_msgSend(v4, "subtitle");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = -[SFRichText initWithProtobuf:](v29, "initWithProtobuf:", v30);
      -[SFHeroTitleCardSection setSubtitle:](v5, "setSubtitle:", v31);

    }
    objc_msgSend(v4, "buttonItems");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
      v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v33 = 0;

    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    objc_msgSend(v4, "buttonItems", 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v43;
      do
      {
        for (j = 0; j != v36; ++j)
        {
          if (*(_QWORD *)v43 != v37)
            objc_enumerationMutation(v34);
          v39 = -[SFButtonItem initWithProtobuf:]([SFButtonItem alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * j));
          if (v39)
            objc_msgSend(v33, "addObject:", v39);

        }
        v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
      }
      while (v36);
    }

    -[SFHeroTitleCardSection setButtonItems:](v5, "setButtonItems:", v33);
    if (objc_msgSend(v4, "maxVisibleButtonItems"))
      -[SFHeroTitleCardSection setMaxVisibleButtonItems:](v5, "setMaxVisibleButtonItems:", objc_msgSend(v4, "maxVisibleButtonItems"));
    v40 = v5;

  }
  return v5;
}

@end
