@implementation RFSummaryItemStandardCardSection

- (void)setSuppress_text_2_if_text_1_exceeds_a_single_line:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_suppress_text_2_if_text_1_exceeds_a_single_line = a3;
}

- (BOOL)hasSuppress_text_2_if_text_1_exceeds_a_single_line
{
  return *(_BYTE *)&self->_has & 1;
}

- (RFSummaryItemStandardCardSection)initWithCoder:(id)a3
{
  id v4;
  RFSummaryItemStandardCardSection *v5;
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
    -[RFSummaryItemStandardCardSection setText_1:](v5, "setText_1:", v9);

    -[SFCardSection text](v8, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFSummaryItemStandardCardSection setText_2:](v5, "setText_2:", v10);

    -[SFCardSection text](v8, "text");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFSummaryItemStandardCardSection setText_3:](v5, "setText_3:", v11);

    -[SFCardSection text](v8, "text");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFSummaryItemStandardCardSection setText_4:](v5, "setText_4:", v12);

    -[SFCardSection thumbnail](v8, "thumbnail");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFSummaryItemStandardCardSection setThumbnail:](v5, "setThumbnail:", v13);

    -[RFSummaryItemStandardCardSection setSuppress_text_2_if_text_1_exceeds_a_single_line:](v5, "setSuppress_text_2_if_text_1_exceeds_a_single_line:", -[SFCardSection suppress_text_2_if_text_1_exceeds_a_single_line](v8, "suppress_text_2_if_text_1_exceeds_a_single_line"));
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
  v3.super_class = (Class)RFSummaryItemStandardCardSection;
  -[SFCardSection encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBRFSummaryItemStandardCardSection *v2;
  void *v3;

  v2 = -[_SFPBRFSummaryItemStandardCardSection initWithFacade:]([_SFPBRFSummaryItemStandardCardSection alloc], "initWithFacade:", self);
  -[_SFPBRFSummaryItemStandardCardSection dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBRFSummaryItemStandardCardSection *v2;
  void *v3;

  v2 = -[_SFPBRFSummaryItemStandardCardSection initWithFacade:]([_SFPBRFSummaryItemStandardCardSection alloc], "initWithFacade:", self);
  -[_SFPBRFSummaryItemStandardCardSection jsonData](v2, "jsonData");
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
  v16.super_class = (Class)RFSummaryItemStandardCardSection;
  v4 = -[SFCardSection copyWithZone:](&v16, sel_copyWithZone_, a3);
  -[RFSummaryItemStandardCardSection text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setText_1:", v6);

  -[RFSummaryItemStandardCardSection text](self, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setText_2:", v8);

  -[RFSummaryItemStandardCardSection text](self, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setText_3:", v10);

  -[RFSummaryItemStandardCardSection text](self, "text");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setText_4:", v12);

  -[RFSummaryItemStandardCardSection thumbnail](self, "thumbnail");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setThumbnail:", v14);

  objc_msgSend(v4, "setSuppress_text_2_if_text_1_exceeds_a_single_line:", -[RFSummaryItemStandardCardSection suppress_text_2_if_text_1_exceeds_a_single_line](self, "suppress_text_2_if_text_1_exceeds_a_single_line"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  RFSummaryItemStandardCardSection *v5;
  RFSummaryItemStandardCardSection *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
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
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  objc_super v52;

  v5 = (RFSummaryItemStandardCardSection *)a3;
  if (self == v5)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    if (-[RFSummaryItemStandardCardSection isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v52.receiver = self;
      v52.super_class = (Class)RFSummaryItemStandardCardSection;
      if (-[SFCardSection isEqual:](&v52, sel_isEqual_, v5))
      {
        v6 = v5;
        -[RFSummaryItemStandardCardSection text](self, "text");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFSummaryItemStandardCardSection text](v6, "text");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v7 == 0) == (v8 != 0))
        {
          LOBYTE(v11) = 0;
LABEL_37:

          goto LABEL_38;
        }
        -[RFSummaryItemStandardCardSection text](self, "text");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          -[RFSummaryItemStandardCardSection text](self, "text");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[RFSummaryItemStandardCardSection text](v6, "text");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v10, "isEqual:"))
          {
            LOBYTE(v11) = 0;
            goto LABEL_35;
          }
          v48 = v10;
        }
        -[RFSummaryItemStandardCardSection text](self, "text");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFSummaryItemStandardCardSection text](v6, "text");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v50 == 0) == (v49 != 0))
          goto LABEL_33;
        -[RFSummaryItemStandardCardSection text](self, "text");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          -[RFSummaryItemStandardCardSection text](self, "text");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[RFSummaryItemStandardCardSection text](v6, "text");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v13, "isEqual:", v3) & 1) == 0)
          {

LABEL_32:
LABEL_33:

            LOBYTE(v11) = 0;
            goto LABEL_34;
          }
          v45 = v13;
          v47 = v7;
          v14 = v51;
          v15 = v12;
        }
        else
        {
          v47 = v7;
          v14 = v51;
          v15 = 0;
        }
        v46 = v3;
        v51 = v14;
        -[RFSummaryItemStandardCardSection text](self, "text");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFSummaryItemStandardCardSection text](v6, "text");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v15;
        v7 = v47;
        if ((v16 == 0) != (v17 != 0))
        {
          v44 = v17;
          -[RFSummaryItemStandardCardSection text](self, "text");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          if (v43)
          {
            -[RFSummaryItemStandardCardSection text](self, "text");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[RFSummaryItemStandardCardSection text](v6, "text");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = v18;
            if (!objc_msgSend(v18, "isEqual:"))
            {
              LOBYTE(v11) = 0;
              v24 = v43;
              goto LABEL_51;
            }
            v42 = v15;
          }
          else
          {
            v42 = v15;
          }
          -[RFSummaryItemStandardCardSection text](self, "text");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[RFSummaryItemStandardCardSection text](v6, "text");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if ((v19 == 0) != (v20 != 0))
          {
            v38 = v20;
            -[RFSummaryItemStandardCardSection text](self, "text");
            v12 = v42;
            v39 = objc_claimAutoreleasedReturnValue();
            v37 = v19;
            if (v39)
            {
              -[RFSummaryItemStandardCardSection text](self, "text");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              -[RFSummaryItemStandardCardSection text](v6, "text");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v36 = v21;
              if (!objc_msgSend(v21, "isEqual:"))
              {
                LOBYTE(v11) = 0;
                v22 = (void *)v39;
LABEL_49:

LABEL_50:
                v24 = v43;
                if (!v43)
                {
LABEL_52:

                  if (v12)
                  {

                  }
LABEL_34:
                  v10 = v48;
                  if (!v9)
                  {
LABEL_36:

                    goto LABEL_37;
                  }
LABEL_35:

                  goto LABEL_36;
                }
LABEL_51:

                goto LABEL_52;
              }
            }
            -[RFSummaryItemStandardCardSection thumbnail](self, "thumbnail");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[RFSummaryItemStandardCardSection thumbnail](v6, "thumbnail");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            if ((v25 == 0) == (v26 != 0))
            {

              LOBYTE(v11) = 0;
              v12 = v42;
              goto LABEL_48;
            }
            v32 = v25;
            v33 = v26;
            -[RFSummaryItemStandardCardSection thumbnail](self, "thumbnail");
            v12 = v42;
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v34
              || (-[RFSummaryItemStandardCardSection thumbnail](self, "thumbnail"),
                  v27 = objc_claimAutoreleasedReturnValue(),
                  -[RFSummaryItemStandardCardSection thumbnail](v6, "thumbnail"),
                  v28 = objc_claimAutoreleasedReturnValue(),
                  v31 = (void *)v27,
                  v29 = (void *)v27,
                  v25 = (void *)v28,
                  objc_msgSend(v29, "isEqual:", v28)))
            {
              v30 = -[RFSummaryItemStandardCardSection suppress_text_2_if_text_1_exceeds_a_single_line](self, "suppress_text_2_if_text_1_exceeds_a_single_line");
              v11 = v30 ^ -[RFSummaryItemStandardCardSection suppress_text_2_if_text_1_exceeds_a_single_line](v6, "suppress_text_2_if_text_1_exceeds_a_single_line") ^ 1;
              if (!v34)
              {
LABEL_47:

LABEL_48:
                v22 = (void *)v39;
                if (!v39)
                  goto LABEL_50;
                goto LABEL_49;
              }
            }
            else
            {
              LOBYTE(v11) = 0;
            }

            goto LABEL_47;
          }

          v12 = v42;
          if (v43)
          {

          }
          v17 = v44;
        }

        if (v12)
        {

        }
        goto LABEL_32;
      }
    }
    LOBYTE(v11) = 0;
  }
LABEL_38:

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
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)RFSummaryItemStandardCardSection;
  v3 = -[SFCardSection hash](&v16, sel_hash);
  -[RFSummaryItemStandardCardSection text](self, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[RFSummaryItemStandardCardSection text](self, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");
  -[RFSummaryItemStandardCardSection text](self, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 ^ objc_msgSend(v8, "hash");
  -[RFSummaryItemStandardCardSection text](self, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9 ^ objc_msgSend(v10, "hash");
  -[RFSummaryItemStandardCardSection thumbnail](self, "thumbnail");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11 ^ objc_msgSend(v12, "hash") ^ v3;
  v14 = v13 ^ -[RFSummaryItemStandardCardSection suppress_text_2_if_text_1_exceeds_a_single_line](self, "suppress_text_2_if_text_1_exceeds_a_single_line");

  return v14;
}

- (RFTextProperty)text_1
{
  return self->_text_1;
}

- (void)setText_1:(id)a3
{
  objc_storeStrong((id *)&self->_text_1, a3);
}

- (NSArray)text_2
{
  return self->_text_2;
}

- (void)setText_2:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSArray)text_3
{
  return self->_text_3;
}

- (void)setText_3:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
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

- (BOOL)suppress_text_2_if_text_1_exceeds_a_single_line
{
  return self->_suppress_text_2_if_text_1_exceeds_a_single_line;
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

- (RFSummaryItemStandardCardSection)initWithProtobuf:(id)a3
{
  id v4;
  RFSummaryItemStandardCardSection *v5;
  void *v6;
  RFTextProperty *v7;
  void *v8;
  RFTextProperty *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  RFTextProperty *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  RFTextProperty *v25;
  void *v26;
  RFTextProperty *v27;
  void *v28;
  RFTextProperty *v29;
  void *v30;
  RFVisualProperty *v31;
  void *v32;
  RFVisualProperty *v33;
  RFSummaryItemStandardCardSection *v34;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  objc_super v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)RFSummaryItemStandardCardSection;
  v5 = -[SFCardSection init](&v44, sel_init);
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
      -[RFSummaryItemStandardCardSection setText_1:](v5, "setText_1:", v9);

    }
    objc_msgSend(v4, "text_2s");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v11 = 0;

    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    objc_msgSend(v4, "text_2s");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v41 != v15)
            objc_enumerationMutation(v12);
          v17 = -[RFTextProperty initWithProtobuf:]([RFTextProperty alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i));
          if (v17)
            objc_msgSend(v11, "addObject:", v17);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
      }
      while (v14);
    }

    -[RFSummaryItemStandardCardSection setText_2:](v5, "setText_2:", v11);
    objc_msgSend(v4, "text_3s");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
      v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v19 = 0;

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    objc_msgSend(v4, "text_3s", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v37;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v37 != v23)
            objc_enumerationMutation(v20);
          v25 = -[RFTextProperty initWithProtobuf:]([RFTextProperty alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * j));
          if (v25)
            objc_msgSend(v19, "addObject:", v25);

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
      }
      while (v22);
    }

    -[RFSummaryItemStandardCardSection setText_3:](v5, "setText_3:", v19);
    objc_msgSend(v4, "text");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      v27 = [RFTextProperty alloc];
      objc_msgSend(v4, "text");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = -[RFTextProperty initWithProtobuf:](v27, "initWithProtobuf:", v28);
      -[RFSummaryItemStandardCardSection setText_4:](v5, "setText_4:", v29);

    }
    objc_msgSend(v4, "thumbnail");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      v31 = [RFVisualProperty alloc];
      objc_msgSend(v4, "thumbnail");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = -[RFVisualProperty initWithProtobuf:](v31, "initWithProtobuf:", v32);
      -[RFSummaryItemStandardCardSection setThumbnail:](v5, "setThumbnail:", v33);

    }
    if (objc_msgSend(v4, "suppress_text_2_if_text_1_exceeds_a_single_line"))
      -[RFSummaryItemStandardCardSection setSuppress_text_2_if_text_1_exceeds_a_single_line:](v5, "setSuppress_text_2_if_text_1_exceeds_a_single_line:", objc_msgSend(v4, "suppress_text_2_if_text_1_exceeds_a_single_line"));
    v34 = v5;

  }
  return v5;
}

@end
