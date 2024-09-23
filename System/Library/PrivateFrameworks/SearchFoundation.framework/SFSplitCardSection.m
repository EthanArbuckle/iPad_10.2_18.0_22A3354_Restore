@implementation SFSplitCardSection

- (SFSplitCardSection)initWithCoder:(id)a3
{
  id v4;
  SFSplitCardSection *v5;
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
    -[SFCardSection topTitle](v8, "topTitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSplitCardSection setTopTitle:](v5, "setTopTitle:", v9);

    -[SFCardSection secondaryTopTitle](v8, "secondaryTopTitle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSplitCardSection setSecondaryTopTitle:](v5, "setSecondaryTopTitle:", v10);

    -[SFCardSection listPrefix](v8, "listPrefix");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSplitCardSection setListPrefix:](v5, "setListPrefix:", v11);

    -[SFCardSection listItems](v8, "listItems");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSplitCardSection setListItems:](v5, "setListItems:", v12);

    -[SFCardSection listMoreString](v8, "listMoreString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSplitCardSection setListMoreString:](v5, "setListMoreString:", v13);

    -[SFCardSection bottomTitle](v8, "bottomTitle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSplitCardSection setBottomTitle:](v5, "setBottomTitle:", v14);

    -[SFCardSection body](v8, "body");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSplitCardSection setBody:](v5, "setBody:", v15);

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
  v3.super_class = (Class)SFSplitCardSection;
  -[SFCardSection encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBSplitCardSection *v2;
  void *v3;

  v2 = -[_SFPBSplitCardSection initWithFacade:]([_SFPBSplitCardSection alloc], "initWithFacade:", self);
  -[_SFPBSplitCardSection dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBSplitCardSection *v2;
  void *v3;

  v2 = -[_SFPBSplitCardSection initWithFacade:]([_SFPBSplitCardSection alloc], "initWithFacade:", self);
  -[_SFPBSplitCardSection jsonData](v2, "jsonData");
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
  v20.super_class = (Class)SFSplitCardSection;
  v4 = -[SFCardSection copyWithZone:](&v20, sel_copyWithZone_, a3);
  -[SFSplitCardSection topTitle](self, "topTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setTopTitle:", v6);

  -[SFSplitCardSection secondaryTopTitle](self, "secondaryTopTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setSecondaryTopTitle:", v8);

  -[SFSplitCardSection listPrefix](self, "listPrefix");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setListPrefix:", v10);

  -[SFSplitCardSection listItems](self, "listItems");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setListItems:", v12);

  -[SFSplitCardSection listMoreString](self, "listMoreString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setListMoreString:", v14);

  -[SFSplitCardSection bottomTitle](self, "bottomTitle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v4, "setBottomTitle:", v16);

  -[SFSplitCardSection body](self, "body");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");
  objc_msgSend(v4, "setBody:", v18);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  SFSplitCardSection *v5;
  SFSplitCardSection *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
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
  uint64_t v31;
  void *v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
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
  id v62;
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

  v5 = (SFSplitCardSection *)a3;
  if (self == v5)
  {
    v12 = 1;
  }
  else
  {
    if (-[SFSplitCardSection isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v73.receiver = self;
      v73.super_class = (Class)SFSplitCardSection;
      if (-[SFCardSection isEqual:](&v73, sel_isEqual_, v5))
      {
        v6 = v5;
        -[SFSplitCardSection topTitle](self, "topTitle");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFSplitCardSection topTitle](v6, "topTitle");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v7 == 0) == (v8 != 0))
        {
          v12 = 0;
LABEL_50:

          goto LABEL_51;
        }
        -[SFSplitCardSection topTitle](self, "topTitle");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          -[SFSplitCardSection topTitle](self, "topTitle");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFSplitCardSection topTitle](v6, "topTitle");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v10, "isEqual:", v11))
          {
            v12 = 0;
            goto LABEL_48;
          }
          v71 = v11;
          v72 = v10;
        }
        -[SFSplitCardSection secondaryTopTitle](self, "secondaryTopTitle");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFSplitCardSection secondaryTopTitle](v6, "secondaryTopTitle");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v13 == 0) != (v14 != 0))
        {
          v70 = v14;
          -[SFSplitCardSection secondaryTopTitle](self, "secondaryTopTitle");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            -[SFSplitCardSection secondaryTopTitle](self, "secondaryTopTitle");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[SFSplitCardSection secondaryTopTitle](v6, "secondaryTopTitle");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v16, "isEqual:", v17) & 1) == 0)
            {

LABEL_45:
LABEL_46:
              v12 = 0;
              goto LABEL_47;
            }
            v68 = v17;
            v69 = v13;
            v3 = v16;
            v18 = v15;
          }
          else
          {
            v69 = v13;
            v18 = 0;
          }
          -[SFSplitCardSection listPrefix](self, "listPrefix");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFSplitCardSection listPrefix](v6, "listPrefix");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v18;
          v22 = v3;
          if ((v19 == 0) != (v20 != 0))
          {
            v66 = v19;
            v67 = v20;
            -[SFSplitCardSection listPrefix](self, "listPrefix");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            if (v65)
            {
              -[SFSplitCardSection listPrefix](self, "listPrefix");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              -[SFSplitCardSection listPrefix](v6, "listPrefix");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v23, "isEqual:", v24) & 1) == 0)
              {

                if (v21)
                {

                }
                goto LABEL_46;
              }
              v63 = v24;
              v64 = v23;
              v25 = v21;
            }
            else
            {
              v25 = v21;
            }
            -[SFSplitCardSection listItems](self, "listItems");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[SFSplitCardSection listItems](v6, "listItems");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = v25;
            v22 = v3;
            if ((v26 == 0) != (v27 != 0))
            {
              v62 = v27;
              -[SFSplitCardSection listItems](self, "listItems");
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              if (v61)
              {
                -[SFSplitCardSection listItems](self, "listItems");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                -[SFSplitCardSection listItems](v6, "listItems");
                v60 = v28;
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                if (!objc_msgSend(v28, "isEqual:"))
                {
                  v12 = 0;
                  v34 = v61;
                  goto LABEL_71;
                }
                v59 = v21;
              }
              else
              {
                v59 = v21;
              }
              -[SFSplitCardSection listMoreString](self, "listMoreString");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              -[SFSplitCardSection listMoreString](v6, "listMoreString");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              if ((v29 == 0) != (v30 != 0))
              {
                v57 = v30;
                -[SFSplitCardSection listMoreString](self, "listMoreString");
                v31 = objc_claimAutoreleasedReturnValue();
                v56 = v29;
                if (v31)
                {
                  -[SFSplitCardSection listMoreString](self, "listMoreString");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SFSplitCardSection listMoreString](v6, "listMoreString");
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  v54 = v32;
                  if (!objc_msgSend(v32, "isEqual:"))
                  {
                    v12 = 0;
                    v39 = (void *)v31;
                    v21 = v59;
LABEL_69:

LABEL_70:
                    v34 = v61;
                    if (!v61)
                    {
LABEL_72:

                      if (v65)
                      {

                      }
                      if (v21)
                      {

                      }
LABEL_47:
                      v11 = v71;
                      v10 = v72;
                      if (!v9)
                      {
LABEL_49:

                        goto LABEL_50;
                      }
LABEL_48:

                      goto LABEL_49;
                    }
LABEL_71:

                    goto LABEL_72;
                  }
                  v55 = (void *)v31;
                }
                else
                {
                  v55 = 0;
                }
                -[SFSplitCardSection bottomTitle](self, "bottomTitle");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                -[SFSplitCardSection bottomTitle](v6, "bottomTitle");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                if ((v35 == 0) == (v36 != 0))
                {

                  v12 = 0;
                  v21 = v59;
                  goto LABEL_68;
                }
                v52 = v36;
                -[SFSplitCardSection bottomTitle](self, "bottomTitle");
                v50 = objc_claimAutoreleasedReturnValue();
                v51 = v35;
                if (!v50
                  || (-[SFSplitCardSection bottomTitle](self, "bottomTitle"),
                      v37 = (void *)objc_claimAutoreleasedReturnValue(),
                      -[SFSplitCardSection bottomTitle](v6, "bottomTitle"),
                      v48 = (void *)objc_claimAutoreleasedReturnValue(),
                      v49 = v37,
                      objc_msgSend(v37, "isEqual:")))
                {
                  -[SFSplitCardSection body](self, "body");
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SFSplitCardSection body](v6, "body");
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  if ((v40 == 0) == (v41 != 0))
                  {

                    v12 = 0;
                    v21 = v59;
                  }
                  else
                  {
                    v46 = v41;
                    v47 = v40;
                    -[SFSplitCardSection body](self, "body");
                    v42 = objc_claimAutoreleasedReturnValue();
                    v21 = v59;
                    if (v42)
                    {
                      v43 = (void *)v42;
                      -[SFSplitCardSection body](self, "body");
                      v45 = (void *)objc_claimAutoreleasedReturnValue();
                      -[SFSplitCardSection body](v6, "body");
                      v44 = (void *)objc_claimAutoreleasedReturnValue();
                      v12 = objc_msgSend(v45, "isEqual:", v44);

                    }
                    else
                    {

                      v12 = 1;
                    }
                  }
                  v38 = (void *)v50;
                  if (!v50)
                    goto LABEL_67;
                }
                else
                {
                  v12 = 0;
                  v21 = v59;
                  v38 = (void *)v50;
                }

LABEL_67:
LABEL_68:
                v39 = v55;
                if (!v55)
                  goto LABEL_70;
                goto LABEL_69;
              }

              if (v61)
              {

              }
              v21 = v59;
              v27 = v62;
            }

            if (v65)
            {

            }
            v19 = v66;
            v20 = v67;
          }

          if (v21)
          {

          }
          v13 = v69;
          v14 = v70;
        }

        goto LABEL_45;
      }
    }
    v12 = 0;
  }
LABEL_51:

  return v12;
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
  unint64_t v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)SFSplitCardSection;
  v3 = -[SFCardSection hash](&v19, sel_hash);
  -[SFSplitCardSection topTitle](self, "topTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[SFSplitCardSection secondaryTopTitle](self, "secondaryTopTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");
  -[SFSplitCardSection listPrefix](self, "listPrefix");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 ^ objc_msgSend(v8, "hash");
  -[SFSplitCardSection listItems](self, "listItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9 ^ objc_msgSend(v10, "hash");
  -[SFSplitCardSection listMoreString](self, "listMoreString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11 ^ objc_msgSend(v12, "hash") ^ v3;
  -[SFSplitCardSection bottomTitle](self, "bottomTitle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hash");
  -[SFSplitCardSection body](self, "body");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v13 ^ v15 ^ objc_msgSend(v16, "hash");

  return v17;
}

- (SFRichText)topTitle
{
  return self->_topTitle;
}

- (void)setTopTitle:(id)a3
{
  objc_storeStrong((id *)&self->_topTitle, a3);
}

- (SFRichText)secondaryTopTitle
{
  return self->_secondaryTopTitle;
}

- (void)setSecondaryTopTitle:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryTopTitle, a3);
}

- (NSString)listPrefix
{
  return self->_listPrefix;
}

- (void)setListPrefix:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSArray)listItems
{
  return self->_listItems;
}

- (void)setListItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (NSString)listMoreString
{
  return self->_listMoreString;
}

- (void)setListMoreString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (SFRichText)bottomTitle
{
  return self->_bottomTitle;
}

- (void)setBottomTitle:(id)a3
{
  objc_storeStrong((id *)&self->_bottomTitle, a3);
}

- (SFRichText)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
  objc_storeStrong((id *)&self->_body, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_bottomTitle, 0);
  objc_storeStrong((id *)&self->_listMoreString, 0);
  objc_storeStrong((id *)&self->_listItems, 0);
  objc_storeStrong((id *)&self->_listPrefix, 0);
  objc_storeStrong((id *)&self->_secondaryTopTitle, 0);
  objc_storeStrong((id *)&self->_topTitle, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFSplitCardSection)initWithProtobuf:(id)a3
{
  id v4;
  SFSplitCardSection *v5;
  void *v6;
  SFRichText *v7;
  void *v8;
  SFRichText *v9;
  void *v10;
  SFRichText *v11;
  void *v12;
  SFRichText *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  SFRichText *v26;
  void *v27;
  SFRichText *v28;
  void *v29;
  SFRichText *v30;
  void *v31;
  SFRichText *v32;
  SFSplitCardSection *v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  objc_super v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)SFSplitCardSection;
  v5 = -[SFCardSection init](&v39, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "topTitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [SFRichText alloc];
      objc_msgSend(v4, "topTitle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[SFRichText initWithProtobuf:](v7, "initWithProtobuf:", v8);
      -[SFSplitCardSection setTopTitle:](v5, "setTopTitle:", v9);

    }
    objc_msgSend(v4, "secondaryTopTitle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [SFRichText alloc];
      objc_msgSend(v4, "secondaryTopTitle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[SFRichText initWithProtobuf:](v11, "initWithProtobuf:", v12);
      -[SFSplitCardSection setSecondaryTopTitle:](v5, "setSecondaryTopTitle:", v13);

    }
    objc_msgSend(v4, "listPrefix");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v4, "listPrefix");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFSplitCardSection setListPrefix:](v5, "setListPrefix:", v15);

    }
    objc_msgSend(v4, "listItems");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v17 = 0;

    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    objc_msgSend(v4, "listItems", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v36 != v21)
            objc_enumerationMutation(v18);
          if (*(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i))
            objc_msgSend(v17, "addObject:");
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      }
      while (v20);
    }

    -[SFSplitCardSection setListItems:](v5, "setListItems:", v17);
    objc_msgSend(v4, "listMoreString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      objc_msgSend(v4, "listMoreString");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFSplitCardSection setListMoreString:](v5, "setListMoreString:", v24);

    }
    objc_msgSend(v4, "bottomTitle");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      v26 = [SFRichText alloc];
      objc_msgSend(v4, "bottomTitle");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = -[SFRichText initWithProtobuf:](v26, "initWithProtobuf:", v27);
      -[SFSplitCardSection setBottomTitle:](v5, "setBottomTitle:", v28);

    }
    objc_msgSend(v4, "body");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      v30 = [SFRichText alloc];
      objc_msgSend(v4, "body");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = -[SFRichText initWithProtobuf:](v30, "initWithProtobuf:", v31);
      -[SFSplitCardSection setBody:](v5, "setBody:", v32);

    }
    v33 = v5;

  }
  return v5;
}

@end
