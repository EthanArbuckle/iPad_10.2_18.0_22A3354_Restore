@implementation RFSummaryItemSwitchV2CardSection

- (void)setIs_on:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_is_on = a3;
}

- (BOOL)hasIs_on
{
  return *(_BYTE *)&self->_has & 1;
}

- (RFSummaryItemSwitchV2CardSection)initWithCoder:(id)a3
{
  id v4;
  RFSummaryItemSwitchV2CardSection *v5;
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
    -[RFSummaryItemSwitchV2CardSection setIs_on:](v5, "setIs_on:", -[SFCardSection is_on](v8, "is_on"));
    -[SFCardSection text](v8, "text");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFSummaryItemSwitchV2CardSection setText_1:](v5, "setText_1:", v9);

    -[SFCardSection text](v8, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFSummaryItemSwitchV2CardSection setText_2:](v5, "setText_2:", v10);

    -[SFCardSection text](v8, "text");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFSummaryItemSwitchV2CardSection setText_3:](v5, "setText_3:", v11);

    -[SFCardSection text](v8, "text");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFSummaryItemSwitchV2CardSection setText_4:](v5, "setText_4:", v12);

    -[SFCardSection thumbnail](v8, "thumbnail");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFSummaryItemSwitchV2CardSection setThumbnail:](v5, "setThumbnail:", v13);

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
  v3.super_class = (Class)RFSummaryItemSwitchV2CardSection;
  -[SFCardSection encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBRFSummaryItemSwitchV2CardSection *v2;
  void *v3;

  v2 = -[_SFPBRFSummaryItemSwitchV2CardSection initWithFacade:]([_SFPBRFSummaryItemSwitchV2CardSection alloc], "initWithFacade:", self);
  -[_SFPBRFSummaryItemSwitchV2CardSection dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBRFSummaryItemSwitchV2CardSection *v2;
  void *v3;

  v2 = -[_SFPBRFSummaryItemSwitchV2CardSection initWithFacade:]([_SFPBRFSummaryItemSwitchV2CardSection alloc], "initWithFacade:", self);
  -[_SFPBRFSummaryItemSwitchV2CardSection jsonData](v2, "jsonData");
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
  v16.super_class = (Class)RFSummaryItemSwitchV2CardSection;
  v4 = -[SFCardSection copyWithZone:](&v16, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setIs_on:", -[RFSummaryItemSwitchV2CardSection is_on](self, "is_on"));
  -[RFSummaryItemSwitchV2CardSection text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setText_1:", v6);

  -[RFSummaryItemSwitchV2CardSection text](self, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setText_2:", v8);

  -[RFSummaryItemSwitchV2CardSection text](self, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setText_3:", v10);

  -[RFSummaryItemSwitchV2CardSection text](self, "text");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setText_4:", v12);

  -[RFSummaryItemSwitchV2CardSection thumbnail](self, "thumbnail");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setThumbnail:", v14);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  RFSummaryItemSwitchV2CardSection *v4;
  RFSummaryItemSwitchV2CardSection *v5;
  _BOOL4 v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
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
  uint64_t v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
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
  objc_super v51;

  v4 = (RFSummaryItemSwitchV2CardSection *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    if (-[RFSummaryItemSwitchV2CardSection isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
    {
      v51.receiver = self;
      v51.super_class = (Class)RFSummaryItemSwitchV2CardSection;
      if (-[SFCardSection isEqual:](&v51, sel_isEqual_, v4))
      {
        v5 = v4;
        v6 = -[RFSummaryItemSwitchV2CardSection is_on](self, "is_on");
        if (v6 != -[RFSummaryItemSwitchV2CardSection is_on](v5, "is_on"))
        {
          v7 = 0;
LABEL_54:

          goto LABEL_55;
        }
        -[RFSummaryItemSwitchV2CardSection text](self, "text");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFSummaryItemSwitchV2CardSection text](v5, "text");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v8 == 0) == (v9 != 0))
        {
          v7 = 0;
LABEL_53:

          goto LABEL_54;
        }
        -[RFSummaryItemSwitchV2CardSection text](self, "text");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          -[RFSummaryItemSwitchV2CardSection text](self, "text");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[RFSummaryItemSwitchV2CardSection text](v5, "text");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v11, "isEqual:"))
          {
            v7 = 0;
            goto LABEL_51;
          }
          v48 = v11;
        }
        -[RFSummaryItemSwitchV2CardSection text](self, "text");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFSummaryItemSwitchV2CardSection text](v5, "text");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v50 == 0) != (v12 != 0))
        {
          -[RFSummaryItemSwitchV2CardSection text](self, "text");
          v13 = objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            v14 = (void *)v13;
            -[RFSummaryItemSwitchV2CardSection text](self, "text");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[RFSummaryItemSwitchV2CardSection text](v5, "text");
            v45 = v15;
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend(v15, "isEqual:"))
            {
              v7 = 0;
              v20 = v14;
              v21 = v46;
              goto LABEL_48;
            }
            v47 = v14;
          }
          else
          {
            v47 = 0;
          }
          -[RFSummaryItemSwitchV2CardSection text](self, "text");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[RFSummaryItemSwitchV2CardSection text](v5, "text");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if ((v16 == 0) != (v17 != 0))
          {
            v43 = v16;
            v44 = v17;
            -[RFSummaryItemSwitchV2CardSection text](self, "text");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (v18)
            {
              -[RFSummaryItemSwitchV2CardSection text](self, "text");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              -[RFSummaryItemSwitchV2CardSection text](v5, "text");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v41 = v19;
              if (!objc_msgSend(v19, "isEqual:"))
              {
                v7 = 0;
                v21 = v46;
                v20 = v47;
                goto LABEL_46;
              }
              v42 = v18;
            }
            else
            {
              v42 = 0;
            }
            -[RFSummaryItemSwitchV2CardSection text](self, "text");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[RFSummaryItemSwitchV2CardSection text](v5, "text");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if ((v22 == 0) != (v23 != 0))
            {
              v39 = v23;
              -[RFSummaryItemSwitchV2CardSection text](self, "text");
              v21 = v46;
              v38 = objc_claimAutoreleasedReturnValue();
              if (v38)
              {
                v34 = v22;
                -[RFSummaryItemSwitchV2CardSection text](self, "text");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                -[RFSummaryItemSwitchV2CardSection text](v5, "text");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                v37 = v24;
                if (!objc_msgSend(v24, "isEqual:"))
                {
                  v7 = 0;
                  v28 = (void *)v38;
                  v22 = v34;
                  goto LABEL_44;
                }
                v22 = v34;
              }
              -[RFSummaryItemSwitchV2CardSection thumbnail](self, "thumbnail");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              -[RFSummaryItemSwitchV2CardSection thumbnail](v5, "thumbnail");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              if ((v25 == 0) == (v26 != 0))
              {

                v7 = 0;
                v21 = v46;
                v28 = (void *)v38;
                if (!v38)
                {
LABEL_45:

                  v18 = v42;
                  v20 = v47;
                  if (!v42)
                    goto LABEL_47;
                  goto LABEL_46;
                }
              }
              else
              {
                v33 = v26;
                v35 = v25;
                -[RFSummaryItemSwitchV2CardSection thumbnail](self, "thumbnail");
                v27 = objc_claimAutoreleasedReturnValue();
                v21 = v46;
                v28 = (void *)v38;
                if (v27)
                {
                  v32 = (void *)v27;
                  -[RFSummaryItemSwitchV2CardSection thumbnail](self, "thumbnail");
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  -[RFSummaryItemSwitchV2CardSection thumbnail](v5, "thumbnail");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  v7 = objc_msgSend(v31, "isEqual:", v30);

                  if (!v38)
                    goto LABEL_45;
                }
                else
                {

                  v7 = 1;
                  if (!v38)
                    goto LABEL_45;
                }
              }
LABEL_44:

              goto LABEL_45;
            }

            v7 = 0;
            v21 = v46;
            v20 = v47;
            v18 = v42;
            if (!v42)
            {
LABEL_47:

              if (!v20)
              {
LABEL_49:

LABEL_50:
                v11 = v48;
                if (!v10)
                {
LABEL_52:

                  goto LABEL_53;
                }
LABEL_51:

                goto LABEL_52;
              }
LABEL_48:

              goto LABEL_49;
            }
LABEL_46:

            goto LABEL_47;
          }

          if (v47)
          {

          }
        }

        v7 = 0;
        goto LABEL_50;
      }
    }
    v7 = 0;
  }
LABEL_55:

  return v7;
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
  unint64_t v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)RFSummaryItemSwitchV2CardSection;
  v3 = -[SFCardSection hash](&v16, sel_hash);
  v4 = -[RFSummaryItemSwitchV2CardSection is_on](self, "is_on");
  -[RFSummaryItemSwitchV2CardSection text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ objc_msgSend(v5, "hash");
  -[RFSummaryItemSwitchV2CardSection text](self, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");
  -[RFSummaryItemSwitchV2CardSection text](self, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v3 ^ v8 ^ objc_msgSend(v9, "hash");
  -[RFSummaryItemSwitchV2CardSection text](self, "text");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  -[RFSummaryItemSwitchV2CardSection thumbnail](self, "thumbnail");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v10 ^ v12 ^ objc_msgSend(v13, "hash");

  return v14;
}

- (BOOL)is_on
{
  return self->_is_on;
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
  objc_storeStrong((id *)&self->_text_4, 0);
  objc_storeStrong((id *)&self->_text_3, 0);
  objc_storeStrong((id *)&self->_text_2, 0);
  objc_storeStrong((id *)&self->_text_1, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RFSummaryItemSwitchV2CardSection)initWithProtobuf:(id)a3
{
  id v4;
  RFSummaryItemSwitchV2CardSection *v5;
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
  RFVisualProperty *v23;
  void *v24;
  RFVisualProperty *v25;
  RFSummaryItemSwitchV2CardSection *v26;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)RFSummaryItemSwitchV2CardSection;
  v5 = -[SFCardSection init](&v28, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "is_on"))
      -[RFSummaryItemSwitchV2CardSection setIs_on:](v5, "setIs_on:", objc_msgSend(v4, "is_on"));
    objc_msgSend(v4, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [RFTextProperty alloc];
      objc_msgSend(v4, "text");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[RFTextProperty initWithProtobuf:](v7, "initWithProtobuf:", v8);
      -[RFSummaryItemSwitchV2CardSection setText_1:](v5, "setText_1:", v9);

    }
    objc_msgSend(v4, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [RFTextProperty alloc];
      objc_msgSend(v4, "text");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[RFTextProperty initWithProtobuf:](v11, "initWithProtobuf:", v12);
      -[RFSummaryItemSwitchV2CardSection setText_2:](v5, "setText_2:", v13);

    }
    objc_msgSend(v4, "text");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = [RFTextProperty alloc];
      objc_msgSend(v4, "text");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[RFTextProperty initWithProtobuf:](v15, "initWithProtobuf:", v16);
      -[RFSummaryItemSwitchV2CardSection setText_3:](v5, "setText_3:", v17);

    }
    objc_msgSend(v4, "text");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v19 = [RFTextProperty alloc];
      objc_msgSend(v4, "text");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[RFTextProperty initWithProtobuf:](v19, "initWithProtobuf:", v20);
      -[RFSummaryItemSwitchV2CardSection setText_4:](v5, "setText_4:", v21);

    }
    objc_msgSend(v4, "thumbnail");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      v23 = [RFVisualProperty alloc];
      objc_msgSend(v4, "thumbnail");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[RFVisualProperty initWithProtobuf:](v23, "initWithProtobuf:", v24);
      -[RFSummaryItemSwitchV2CardSection setThumbnail:](v5, "setThumbnail:", v25);

    }
    v26 = v5;
  }

  return v5;
}

@end
