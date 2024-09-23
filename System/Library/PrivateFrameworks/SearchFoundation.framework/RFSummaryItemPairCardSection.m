@implementation RFSummaryItemPairCardSection

- (RFSummaryItemPairCardSection)initWithProtobuf:(id)a3
{
  id v4;
  RFSummaryItemPairCardSection *v5;
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
  RFVisualProperty *v19;
  void *v20;
  RFVisualProperty *v21;
  void *v22;
  RFVisualProperty *v23;
  void *v24;
  RFVisualProperty *v25;
  RFSummaryItemPairCardSection *v26;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)RFSummaryItemPairCardSection;
  v5 = -[SFCardSection init](&v28, sel_init);
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
      -[RFSummaryItemPairCardSection setText_1:](v5, "setText_1:", v9);

    }
    objc_msgSend(v4, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [RFTextProperty alloc];
      objc_msgSend(v4, "text");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[RFTextProperty initWithProtobuf:](v11, "initWithProtobuf:", v12);
      -[RFSummaryItemPairCardSection setText_2:](v5, "setText_2:", v13);

    }
    objc_msgSend(v4, "text");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = [RFTextProperty alloc];
      objc_msgSend(v4, "text");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[RFTextProperty initWithProtobuf:](v15, "initWithProtobuf:", v16);
      -[RFSummaryItemPairCardSection setText_3:](v5, "setText_3:", v17);

    }
    objc_msgSend(v4, "thumbnail");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v19 = [RFVisualProperty alloc];
      objc_msgSend(v4, "thumbnail");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[RFVisualProperty initWithProtobuf:](v19, "initWithProtobuf:", v20);
      -[RFSummaryItemPairCardSection setThumbnail_1:](v5, "setThumbnail_1:", v21);

    }
    objc_msgSend(v4, "thumbnail");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      v23 = [RFVisualProperty alloc];
      objc_msgSend(v4, "thumbnail");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[RFVisualProperty initWithProtobuf:](v23, "initWithProtobuf:", v24);
      -[RFSummaryItemPairCardSection setThumbnail_2:](v5, "setThumbnail_2:", v25);

    }
    v26 = v5;
  }

  return v5;
}

- (RFSummaryItemPairCardSection)initWithCoder:(id)a3
{
  id v4;
  RFSummaryItemPairCardSection *v5;
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
    -[RFSummaryItemPairCardSection setText_1:](v5, "setText_1:", v9);

    -[SFCardSection text](v8, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFSummaryItemPairCardSection setText_2:](v5, "setText_2:", v10);

    -[SFCardSection text](v8, "text");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFSummaryItemPairCardSection setText_3:](v5, "setText_3:", v11);

    -[SFCardSection thumbnail](v8, "thumbnail");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFSummaryItemPairCardSection setThumbnail_1:](v5, "setThumbnail_1:", v12);

    -[SFCardSection thumbnail](v8, "thumbnail");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFSummaryItemPairCardSection setThumbnail_2:](v5, "setThumbnail_2:", v13);

    -[SFCardSection nextCard](v8, "nextCard");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setNextCard:](v5, "setNextCard:", v14);

    -[SFCardSection commands](v8, "commands");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCommands:](v5, "setCommands:", v15);

    -[SFCardSection parameterKeyPaths](v8, "parameterKeyPaths");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setParameterKeyPaths:](v5, "setParameterKeyPaths:", v16);

    -[SFCardSection cardSectionId](v8, "cardSectionId");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCardSectionId:](v5, "setCardSectionId:", v17);

    -[SFCardSection resultIdentifier](v8, "resultIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setResultIdentifier:](v5, "setResultIdentifier:", v18);

    -[SFCardSection userReportRequest](v8, "userReportRequest");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setUserReportRequest:](v5, "setUserReportRequest:", v19);

    -[SFCardSection command](v8, "command");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCommand:](v5, "setCommand:", v20);

    -[SFCardSection previewCommand](v8, "previewCommand");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewCommand:](v5, "setPreviewCommand:", v21);

    -[SFCardSection previewButtonItems](v8, "previewButtonItems");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewButtonItems:](v5, "setPreviewButtonItems:", v22);

    -[SFCardSection cardSectionDetail](v8, "cardSectionDetail");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCardSectionDetail:](v5, "setCardSectionDetail:", v23);

    -[SFCardSection previewButtonItemsTitle](v8, "previewButtonItemsTitle");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewButtonItemsTitle:](v5, "setPreviewButtonItemsTitle:", v24);

    -[SFCardSection backgroundColor](v8, "backgroundColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setBackgroundColor:](v5, "setBackgroundColor:", v25);

    -[SFCardSection setShouldHideInAmbientMode:](v5, "setShouldHideInAmbientMode:", -[SFCardSection shouldHideInAmbientMode](v8, "shouldHideInAmbientMode"));
    -[SFCardSection leadingSwipeButtonItems](v8, "leadingSwipeButtonItems");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setLeadingSwipeButtonItems:](v5, "setLeadingSwipeButtonItems:", v26);

    -[SFCardSection trailingSwipeButtonItems](v8, "trailingSwipeButtonItems");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setTrailingSwipeButtonItems:](v5, "setTrailingSwipeButtonItems:", v27);

    -[SFCardSection punchoutOptions](v8, "punchoutOptions");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutOptions:](v5, "setPunchoutOptions:", v28);

    -[SFCardSection punchoutPickerTitle](v8, "punchoutPickerTitle");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerTitle:](v5, "setPunchoutPickerTitle:", v29);

    -[SFCardSection punchoutPickerDismissText](v8, "punchoutPickerDismissText");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerDismissText:](v5, "setPunchoutPickerDismissText:", v30);

    -[SFCardSection setCanBeHidden:](v5, "setCanBeHidden:", -[SFCardSection canBeHidden](v8, "canBeHidden"));
    -[SFCardSection setHasTopPadding:](v5, "setHasTopPadding:", -[SFCardSection hasTopPadding](v8, "hasTopPadding"));
    -[SFCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", -[SFCardSection hasBottomPadding](v8, "hasBottomPadding"));
    -[SFCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", -[SFCardSection separatorStyle](v8, "separatorStyle"));
    -[SFCardSection referencedCommands](v8, "referencedCommands");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setReferencedCommands:](v5, "setReferencedCommands:", v31);

    -[SFCardSection setForceEnable3DTouch:](v5, "setForceEnable3DTouch:", -[SFCardSection forceEnable3DTouch](v8, "forceEnable3DTouch"));
    -[SFCardSection setShouldShowInSmartDialog:](v5, "setShouldShowInSmartDialog:", -[SFCardSection shouldShowInSmartDialog](v8, "shouldShowInSmartDialog"));
    -[SFCardSection appEntityAnnotation](v8, "appEntityAnnotation");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setAppEntityAnnotation:](v5, "setAppEntityAnnotation:", v32);

    -[SFCardSection emphasisSubjectId](v8, "emphasisSubjectId");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setEmphasisSubjectId:](v5, "setEmphasisSubjectId:", v33);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RFSummaryItemPairCardSection;
  -[SFCardSection encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBRFSummaryItemPairCardSection *v2;
  void *v3;

  v2 = -[_SFPBRFSummaryItemPairCardSection initWithFacade:]([_SFPBRFSummaryItemPairCardSection alloc], "initWithFacade:", self);
  -[_SFPBRFSummaryItemPairCardSection dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBRFSummaryItemPairCardSection *v2;
  void *v3;

  v2 = -[_SFPBRFSummaryItemPairCardSection initWithFacade:]([_SFPBRFSummaryItemPairCardSection alloc], "initWithFacade:", self);
  -[_SFPBRFSummaryItemPairCardSection jsonData](v2, "jsonData");
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
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)RFSummaryItemPairCardSection;
  v4 = -[SFCardSection copyWithZone:](&v16, sel_copyWithZone_, a3);
  -[RFSummaryItemPairCardSection text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setText_1:", v6);

  -[RFSummaryItemPairCardSection text](self, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setText_2:", v8);

  -[RFSummaryItemPairCardSection text](self, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setText_3:", v10);

  -[RFSummaryItemPairCardSection thumbnail](self, "thumbnail");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setThumbnail_1:", v12);

  -[RFSummaryItemPairCardSection thumbnail](self, "thumbnail");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setThumbnail_2:", v14);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  RFSummaryItemPairCardSection *v4;
  RFSummaryItemPairCardSection *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
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
  uint64_t v26;
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
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
  objc_super v50;

  v4 = (RFSummaryItemPairCardSection *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    if (-[RFSummaryItemPairCardSection isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
    {
      v50.receiver = self;
      v50.super_class = (Class)RFSummaryItemPairCardSection;
      if (-[SFCardSection isEqual:](&v50, sel_isEqual_, v4))
      {
        v5 = v4;
        -[RFSummaryItemPairCardSection text](self, "text");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFSummaryItemPairCardSection text](v5, "text");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v6 == 0) == (v7 != 0))
        {
          v10 = 0;
LABEL_51:

          goto LABEL_52;
        }
        -[RFSummaryItemPairCardSection text](self, "text");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          -[RFSummaryItemPairCardSection text](self, "text");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[RFSummaryItemPairCardSection text](v5, "text");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v9, "isEqual:"))
          {
            v10 = 0;
            goto LABEL_49;
          }
          v47 = v9;
        }
        -[RFSummaryItemPairCardSection text](self, "text");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFSummaryItemPairCardSection text](v5, "text");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v49 == 0) != (v11 != 0))
        {
          -[RFSummaryItemPairCardSection text](self, "text");
          v12 = objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            v13 = (void *)v12;
            -[RFSummaryItemPairCardSection text](self, "text");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[RFSummaryItemPairCardSection text](v5, "text");
            v44 = v14;
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend(v14, "isEqual:"))
            {
              v10 = 0;
              v19 = v13;
              v20 = v45;
              goto LABEL_46;
            }
            v46 = v13;
          }
          else
          {
            v46 = 0;
          }
          -[RFSummaryItemPairCardSection text](self, "text");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[RFSummaryItemPairCardSection text](v5, "text");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if ((v15 == 0) != (v16 != 0))
          {
            v42 = v15;
            v43 = v16;
            -[RFSummaryItemPairCardSection text](self, "text");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (v17)
            {
              -[RFSummaryItemPairCardSection text](self, "text");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              -[RFSummaryItemPairCardSection text](v5, "text");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = v18;
              if (!objc_msgSend(v18, "isEqual:"))
              {
                v10 = 0;
                v20 = v45;
                v19 = v46;
                goto LABEL_44;
              }
              v41 = v17;
            }
            else
            {
              v41 = 0;
            }
            -[RFSummaryItemPairCardSection thumbnail](self, "thumbnail");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[RFSummaryItemPairCardSection thumbnail](v5, "thumbnail");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if ((v21 == 0) != (v22 != 0))
            {
              v38 = v22;
              -[RFSummaryItemPairCardSection thumbnail](self, "thumbnail");
              v20 = v45;
              v37 = objc_claimAutoreleasedReturnValue();
              if (v37)
              {
                v33 = v21;
                -[RFSummaryItemPairCardSection thumbnail](self, "thumbnail");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                -[RFSummaryItemPairCardSection thumbnail](v5, "thumbnail");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                v36 = v23;
                if (!objc_msgSend(v23, "isEqual:"))
                {
                  v10 = 0;
                  v27 = (void *)v37;
                  v21 = v33;
                  goto LABEL_42;
                }
                v21 = v33;
              }
              -[RFSummaryItemPairCardSection thumbnail](self, "thumbnail");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              -[RFSummaryItemPairCardSection thumbnail](v5, "thumbnail");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              if ((v24 == 0) == (v25 != 0))
              {

                v10 = 0;
                v20 = v45;
                v27 = (void *)v37;
                if (!v37)
                {
LABEL_43:

                  v17 = v41;
                  v19 = v46;
                  if (!v41)
                    goto LABEL_45;
                  goto LABEL_44;
                }
              }
              else
              {
                v32 = v25;
                v34 = v24;
                -[RFSummaryItemPairCardSection thumbnail](self, "thumbnail");
                v26 = objc_claimAutoreleasedReturnValue();
                v20 = v45;
                v27 = (void *)v37;
                if (v26)
                {
                  v31 = (void *)v26;
                  -[RFSummaryItemPairCardSection thumbnail](self, "thumbnail");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  -[RFSummaryItemPairCardSection thumbnail](v5, "thumbnail");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  v10 = objc_msgSend(v30, "isEqual:", v29);

                  if (!v37)
                    goto LABEL_43;
                }
                else
                {

                  v10 = 1;
                  if (!v37)
                    goto LABEL_43;
                }
              }
LABEL_42:

              goto LABEL_43;
            }

            v10 = 0;
            v20 = v45;
            v19 = v46;
            v17 = v41;
            if (!v41)
            {
LABEL_45:

              if (!v19)
              {
LABEL_47:

LABEL_48:
                v9 = v47;
                if (!v8)
                {
LABEL_50:

                  goto LABEL_51;
                }
LABEL_49:

                goto LABEL_50;
              }
LABEL_46:

              goto LABEL_47;
            }
LABEL_44:

            goto LABEL_45;
          }

          if (v46)
          {

          }
        }

        v10 = 0;
        goto LABEL_48;
      }
    }
    v10 = 0;
  }
LABEL_52:

  return v10;
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
  unint64_t v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)RFSummaryItemPairCardSection;
  v3 = -[SFCardSection hash](&v15, sel_hash);
  -[RFSummaryItemPairCardSection text](self, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[RFSummaryItemPairCardSection text](self, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");
  -[RFSummaryItemPairCardSection text](self, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 ^ objc_msgSend(v8, "hash");
  -[RFSummaryItemPairCardSection thumbnail](self, "thumbnail");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9 ^ objc_msgSend(v10, "hash");
  -[RFSummaryItemPairCardSection thumbnail](self, "thumbnail");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11 ^ objc_msgSend(v12, "hash") ^ v3;

  return v13;
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

- (RFVisualProperty)thumbnail_1
{
  return self->_thumbnail_1;
}

- (void)setThumbnail_1:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnail_1, a3);
}

- (RFVisualProperty)thumbnail_2
{
  return self->_thumbnail_2;
}

- (void)setThumbnail_2:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnail_2, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnail_2, 0);
  objc_storeStrong((id *)&self->_thumbnail_1, 0);
  objc_storeStrong((id *)&self->_text_3, 0);
  objc_storeStrong((id *)&self->_text_2, 0);
  objc_storeStrong((id *)&self->_text_1, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
