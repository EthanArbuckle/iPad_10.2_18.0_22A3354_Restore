@implementation RFSummaryItemDetailedTextCardSection

- (RFSummaryItemDetailedTextCardSection)initWithCoder:(id)a3
{
  id v4;
  RFSummaryItemDetailedTextCardSection *v5;
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
    -[SFCardSection text](v8, "text");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFSummaryItemDetailedTextCardSection setText_1:](v5, "setText_1:", v9);

    -[SFCardSection text](v8, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFSummaryItemDetailedTextCardSection setText_2:](v5, "setText_2:", v10);

    -[SFCardSection text](v8, "text");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFSummaryItemDetailedTextCardSection setText_3:](v5, "setText_3:", v11);

    -[SFCardSection text](v8, "text");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFSummaryItemDetailedTextCardSection setText_4:](v5, "setText_4:", v12);

    -[SFCardSection text](v8, "text");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFSummaryItemDetailedTextCardSection setText_5:](v5, "setText_5:", v13);

    -[SFCardSection text](v8, "text");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFSummaryItemDetailedTextCardSection setText_6:](v5, "setText_6:", v14);

    -[SFCardSection thumbnail](v8, "thumbnail");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFSummaryItemDetailedTextCardSection setThumbnail:](v5, "setThumbnail:", v15);

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
  v3.super_class = (Class)RFSummaryItemDetailedTextCardSection;
  -[SFCardSection encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBRFSummaryItemDetailedTextCardSection *v2;
  void *v3;

  v2 = -[_SFPBRFSummaryItemDetailedTextCardSection initWithFacade:]([_SFPBRFSummaryItemDetailedTextCardSection alloc], "initWithFacade:", self);
  -[_SFPBRFSummaryItemDetailedTextCardSection dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBRFSummaryItemDetailedTextCardSection *v2;
  void *v3;

  v2 = -[_SFPBRFSummaryItemDetailedTextCardSection initWithFacade:]([_SFPBRFSummaryItemDetailedTextCardSection alloc], "initWithFacade:", self);
  -[_SFPBRFSummaryItemDetailedTextCardSection jsonData](v2, "jsonData");
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
  v20.super_class = (Class)RFSummaryItemDetailedTextCardSection;
  v4 = -[SFCardSection copyWithZone:](&v20, sel_copyWithZone_, a3);
  -[RFSummaryItemDetailedTextCardSection text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setText_1:", v6);

  -[RFSummaryItemDetailedTextCardSection text](self, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setText_2:", v8);

  -[RFSummaryItemDetailedTextCardSection text](self, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setText_3:", v10);

  -[RFSummaryItemDetailedTextCardSection text](self, "text");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setText_4:", v12);

  -[RFSummaryItemDetailedTextCardSection text](self, "text");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setText_5:", v14);

  -[RFSummaryItemDetailedTextCardSection text](self, "text");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v4, "setText_6:", v16);

  -[RFSummaryItemDetailedTextCardSection thumbnail](self, "thumbnail");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");
  objc_msgSend(v4, "setThumbnail:", v18);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  RFSummaryItemDetailedTextCardSection *v5;
  RFSummaryItemDetailedTextCardSection *v6;
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

  v5 = (RFSummaryItemDetailedTextCardSection *)a3;
  if (self == v5)
  {
    v12 = 1;
  }
  else
  {
    if (-[RFSummaryItemDetailedTextCardSection isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v73.receiver = self;
      v73.super_class = (Class)RFSummaryItemDetailedTextCardSection;
      if (-[SFCardSection isEqual:](&v73, sel_isEqual_, v5))
      {
        v6 = v5;
        -[RFSummaryItemDetailedTextCardSection text](self, "text");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFSummaryItemDetailedTextCardSection text](v6, "text");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v7 == 0) == (v8 != 0))
        {
          v12 = 0;
LABEL_50:

          goto LABEL_51;
        }
        -[RFSummaryItemDetailedTextCardSection text](self, "text");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          -[RFSummaryItemDetailedTextCardSection text](self, "text");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[RFSummaryItemDetailedTextCardSection text](v6, "text");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v10, "isEqual:", v11))
          {
            v12 = 0;
            goto LABEL_48;
          }
          v71 = v11;
          v72 = v10;
        }
        -[RFSummaryItemDetailedTextCardSection text](self, "text");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFSummaryItemDetailedTextCardSection text](v6, "text");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v13 == 0) != (v14 != 0))
        {
          v70 = v14;
          -[RFSummaryItemDetailedTextCardSection text](self, "text");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            -[RFSummaryItemDetailedTextCardSection text](self, "text");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[RFSummaryItemDetailedTextCardSection text](v6, "text");
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
          -[RFSummaryItemDetailedTextCardSection text](self, "text");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[RFSummaryItemDetailedTextCardSection text](v6, "text");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v18;
          v22 = v3;
          if ((v19 == 0) != (v20 != 0))
          {
            v66 = v19;
            v67 = v20;
            -[RFSummaryItemDetailedTextCardSection text](self, "text");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            if (v65)
            {
              -[RFSummaryItemDetailedTextCardSection text](self, "text");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              -[RFSummaryItemDetailedTextCardSection text](v6, "text");
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
            -[RFSummaryItemDetailedTextCardSection text](self, "text");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[RFSummaryItemDetailedTextCardSection text](v6, "text");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = v25;
            v22 = v3;
            if ((v26 == 0) != (v27 != 0))
            {
              v62 = v27;
              -[RFSummaryItemDetailedTextCardSection text](self, "text");
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              if (v61)
              {
                -[RFSummaryItemDetailedTextCardSection text](self, "text");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                -[RFSummaryItemDetailedTextCardSection text](v6, "text");
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
              -[RFSummaryItemDetailedTextCardSection text](self, "text");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              -[RFSummaryItemDetailedTextCardSection text](v6, "text");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              if ((v29 == 0) != (v30 != 0))
              {
                v57 = v30;
                -[RFSummaryItemDetailedTextCardSection text](self, "text");
                v31 = objc_claimAutoreleasedReturnValue();
                v56 = v29;
                if (v31)
                {
                  -[RFSummaryItemDetailedTextCardSection text](self, "text");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  -[RFSummaryItemDetailedTextCardSection text](v6, "text");
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
                -[RFSummaryItemDetailedTextCardSection text](self, "text");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                -[RFSummaryItemDetailedTextCardSection text](v6, "text");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                if ((v35 == 0) == (v36 != 0))
                {

                  v12 = 0;
                  v21 = v59;
                  goto LABEL_68;
                }
                v52 = v36;
                -[RFSummaryItemDetailedTextCardSection text](self, "text");
                v50 = objc_claimAutoreleasedReturnValue();
                v51 = v35;
                if (!v50
                  || (-[RFSummaryItemDetailedTextCardSection text](self, "text"),
                      v37 = (void *)objc_claimAutoreleasedReturnValue(),
                      -[RFSummaryItemDetailedTextCardSection text](v6, "text"),
                      v48 = (void *)objc_claimAutoreleasedReturnValue(),
                      v49 = v37,
                      objc_msgSend(v37, "isEqual:")))
                {
                  -[RFSummaryItemDetailedTextCardSection thumbnail](self, "thumbnail");
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  -[RFSummaryItemDetailedTextCardSection thumbnail](v6, "thumbnail");
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
                    -[RFSummaryItemDetailedTextCardSection thumbnail](self, "thumbnail");
                    v42 = objc_claimAutoreleasedReturnValue();
                    v21 = v59;
                    if (v42)
                    {
                      v43 = (void *)v42;
                      -[RFSummaryItemDetailedTextCardSection thumbnail](self, "thumbnail");
                      v45 = (void *)objc_claimAutoreleasedReturnValue();
                      -[RFSummaryItemDetailedTextCardSection thumbnail](v6, "thumbnail");
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
  v19.super_class = (Class)RFSummaryItemDetailedTextCardSection;
  v3 = -[SFCardSection hash](&v19, sel_hash);
  -[RFSummaryItemDetailedTextCardSection text](self, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[RFSummaryItemDetailedTextCardSection text](self, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");
  -[RFSummaryItemDetailedTextCardSection text](self, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 ^ objc_msgSend(v8, "hash");
  -[RFSummaryItemDetailedTextCardSection text](self, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9 ^ objc_msgSend(v10, "hash");
  -[RFSummaryItemDetailedTextCardSection text](self, "text");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11 ^ objc_msgSend(v12, "hash") ^ v3;
  -[RFSummaryItemDetailedTextCardSection text](self, "text");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hash");
  -[RFSummaryItemDetailedTextCardSection thumbnail](self, "thumbnail");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v13 ^ v15 ^ objc_msgSend(v16, "hash");

  return v17;
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
  objc_storeStrong((id *)&self->_text_2, 0);
  objc_storeStrong((id *)&self->_text_1, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RFSummaryItemDetailedTextCardSection)initWithProtobuf:(id)a3
{
  id v4;
  RFSummaryItemDetailedTextCardSection *v5;
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
  RFVisualProperty *v31;
  void *v32;
  RFVisualProperty *v33;
  RFSummaryItemDetailedTextCardSection *v34;
  objc_super v36;

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)RFSummaryItemDetailedTextCardSection;
  v5 = -[SFCardSection init](&v36, sel_init);
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
      -[RFSummaryItemDetailedTextCardSection setText_1:](v5, "setText_1:", v9);

    }
    objc_msgSend(v4, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [RFTextProperty alloc];
      objc_msgSend(v4, "text");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[RFTextProperty initWithProtobuf:](v11, "initWithProtobuf:", v12);
      -[RFSummaryItemDetailedTextCardSection setText_2:](v5, "setText_2:", v13);

    }
    objc_msgSend(v4, "text");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = [RFTextProperty alloc];
      objc_msgSend(v4, "text");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[RFTextProperty initWithProtobuf:](v15, "initWithProtobuf:", v16);
      -[RFSummaryItemDetailedTextCardSection setText_3:](v5, "setText_3:", v17);

    }
    objc_msgSend(v4, "text");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v19 = [RFTextProperty alloc];
      objc_msgSend(v4, "text");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[RFTextProperty initWithProtobuf:](v19, "initWithProtobuf:", v20);
      -[RFSummaryItemDetailedTextCardSection setText_4:](v5, "setText_4:", v21);

    }
    objc_msgSend(v4, "text");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      v23 = [RFTextProperty alloc];
      objc_msgSend(v4, "text");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[RFTextProperty initWithProtobuf:](v23, "initWithProtobuf:", v24);
      -[RFSummaryItemDetailedTextCardSection setText_5:](v5, "setText_5:", v25);

    }
    objc_msgSend(v4, "text");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      v27 = [RFTextProperty alloc];
      objc_msgSend(v4, "text");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = -[RFTextProperty initWithProtobuf:](v27, "initWithProtobuf:", v28);
      -[RFSummaryItemDetailedTextCardSection setText_6:](v5, "setText_6:", v29);

    }
    objc_msgSend(v4, "thumbnail");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      v31 = [RFVisualProperty alloc];
      objc_msgSend(v4, "thumbnail");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = -[RFVisualProperty initWithProtobuf:](v31, "initWithProtobuf:", v32);
      -[RFSummaryItemDetailedTextCardSection setThumbnail:](v5, "setThumbnail:", v33);

    }
    v34 = v5;
  }

  return v5;
}

@end
