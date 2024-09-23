@implementation RFSimpleItemStandardCardSection

- (RFSimpleItemStandardCardSection)initWithCoder:(id)a3
{
  id v4;
  RFSimpleItemStandardCardSection *v5;
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
    -[SFCardSection text](v8, "text");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFSimpleItemStandardCardSection setText_1:](v5, "setText_1:", v9);

    -[SFCardSection text](v8, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFSimpleItemStandardCardSection setText_2:](v5, "setText_2:", v10);

    -[SFCardSection text](v8, "text");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFSimpleItemStandardCardSection setText_3:](v5, "setText_3:", v11);

    -[SFCardSection text](v8, "text");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFSimpleItemStandardCardSection setText_4:](v5, "setText_4:", v12);

    -[SFCardSection text](v8, "text");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFSimpleItemStandardCardSection setText_5:](v5, "setText_5:", v13);

    -[SFCardSection text](v8, "text");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFSimpleItemStandardCardSection setText_6:](v5, "setText_6:", v14);

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
  v3.super_class = (Class)RFSimpleItemStandardCardSection;
  -[SFCardSection encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBRFSimpleItemStandardCardSection *v2;
  void *v3;

  v2 = -[_SFPBRFSimpleItemStandardCardSection initWithFacade:]([_SFPBRFSimpleItemStandardCardSection alloc], "initWithFacade:", self);
  -[_SFPBRFSimpleItemStandardCardSection dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBRFSimpleItemStandardCardSection *v2;
  void *v3;

  v2 = -[_SFPBRFSimpleItemStandardCardSection initWithFacade:]([_SFPBRFSimpleItemStandardCardSection alloc], "initWithFacade:", self);
  -[_SFPBRFSimpleItemStandardCardSection jsonData](v2, "jsonData");
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
  v18.super_class = (Class)RFSimpleItemStandardCardSection;
  v4 = -[SFCardSection copyWithZone:](&v18, sel_copyWithZone_, a3);
  -[RFSimpleItemStandardCardSection text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setText_1:", v6);

  -[RFSimpleItemStandardCardSection text](self, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setText_2:", v8);

  -[RFSimpleItemStandardCardSection text](self, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setText_3:", v10);

  -[RFSimpleItemStandardCardSection text](self, "text");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setText_4:", v12);

  -[RFSimpleItemStandardCardSection text](self, "text");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setText_5:", v14);

  -[RFSimpleItemStandardCardSection text](self, "text");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v4, "setText_6:", v16);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  RFSimpleItemStandardCardSection *v5;
  RFSimpleItemStandardCardSection *v6;
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
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
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
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  objc_super v58;

  v5 = (RFSimpleItemStandardCardSection *)a3;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (-[RFSimpleItemStandardCardSection isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v58.receiver = self;
      v58.super_class = (Class)RFSimpleItemStandardCardSection;
      if (-[SFCardSection isEqual:](&v58, sel_isEqual_, v5))
      {
        v6 = v5;
        -[RFSimpleItemStandardCardSection text](self, "text");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFSimpleItemStandardCardSection text](v6, "text");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v7 == 0) == (v8 != 0))
        {
          v11 = 0;
LABEL_37:

          goto LABEL_38;
        }
        -[RFSimpleItemStandardCardSection text](self, "text");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          -[RFSimpleItemStandardCardSection text](self, "text");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[RFSimpleItemStandardCardSection text](v6, "text");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v10, "isEqual:"))
          {
            v11 = 0;
            goto LABEL_35;
          }
          v54 = v10;
        }
        -[RFSimpleItemStandardCardSection text](self, "text");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFSimpleItemStandardCardSection text](v6, "text");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v56 == 0) == (v55 != 0))
          goto LABEL_33;
        -[RFSimpleItemStandardCardSection text](self, "text");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          -[RFSimpleItemStandardCardSection text](self, "text");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[RFSimpleItemStandardCardSection text](v6, "text");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v13, "isEqual:", v3) & 1) == 0)
          {

LABEL_32:
LABEL_33:

            v11 = 0;
            goto LABEL_34;
          }
          v51 = v13;
          v53 = v8;
          v14 = v57;
          v15 = v12;
        }
        else
        {
          v53 = v8;
          v14 = v57;
          v15 = 0;
        }
        v52 = v3;
        v57 = v14;
        -[RFSimpleItemStandardCardSection text](self, "text");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFSimpleItemStandardCardSection text](v6, "text");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v15;
        v8 = v53;
        if ((v16 == 0) != (v17 != 0))
        {
          v50 = v17;
          -[RFSimpleItemStandardCardSection text](self, "text");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          if (v49)
          {
            -[RFSimpleItemStandardCardSection text](self, "text");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[RFSimpleItemStandardCardSection text](v6, "text");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = v18;
            if (!objc_msgSend(v18, "isEqual:"))
            {
              v11 = 0;
              v24 = v49;
              goto LABEL_57;
            }
            v48 = v15;
          }
          else
          {
            v48 = v15;
          }
          -[RFSimpleItemStandardCardSection text](self, "text");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[RFSimpleItemStandardCardSection text](v6, "text");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if ((v19 == 0) != (v20 != 0))
          {
            v45 = v20;
            -[RFSimpleItemStandardCardSection text](self, "text");
            v12 = v48;
            v43 = objc_claimAutoreleasedReturnValue();
            v44 = v19;
            if (v43)
            {
              -[RFSimpleItemStandardCardSection text](self, "text");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              -[RFSimpleItemStandardCardSection text](v6, "text");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              v42 = v21;
              if (!objc_msgSend(v21, "isEqual:"))
              {
                v11 = 0;
                v22 = (void *)v43;
LABEL_55:

LABEL_56:
                v24 = v49;
                if (!v49)
                {
LABEL_58:

                  if (v12)
                  {

                  }
LABEL_34:
                  v10 = v54;
                  if (!v9)
                  {
LABEL_36:

                    goto LABEL_37;
                  }
LABEL_35:

                  goto LABEL_36;
                }
LABEL_57:

                goto LABEL_58;
              }
            }
            -[RFSimpleItemStandardCardSection text](self, "text");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[RFSimpleItemStandardCardSection text](v6, "text");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            if ((v25 == 0) == (v26 != 0))
            {

              v11 = 0;
              v12 = v48;
              goto LABEL_54;
            }
            v39 = v25;
            v40 = v26;
            -[RFSimpleItemStandardCardSection text](self, "text");
            v12 = v48;
            v38 = objc_claimAutoreleasedReturnValue();
            if (v38
              && (-[RFSimpleItemStandardCardSection text](self, "text"),
                  v27 = (void *)objc_claimAutoreleasedReturnValue(),
                  -[RFSimpleItemStandardCardSection text](v6, "text"),
                  v36 = (void *)objc_claimAutoreleasedReturnValue(),
                  v37 = v27,
                  !objc_msgSend(v27, "isEqual:")))
            {
              v11 = 0;
              v32 = (void *)v38;
            }
            else
            {
              -[RFSimpleItemStandardCardSection text](self, "text");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              -[RFSimpleItemStandardCardSection text](v6, "text");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              if ((v28 == 0) == (v29 != 0))
              {

                v11 = 0;
                v12 = v48;
              }
              else
              {
                v35 = v29;
                -[RFSimpleItemStandardCardSection text](self, "text");
                v30 = objc_claimAutoreleasedReturnValue();
                v12 = v48;
                if (v30)
                {
                  v34 = (void *)v30;
                  -[RFSimpleItemStandardCardSection text](self, "text");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  -[RFSimpleItemStandardCardSection text](v6, "text");
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  v11 = objc_msgSend(v33, "isEqual:");

                }
                else
                {

                  v11 = 1;
                }
              }
              v32 = (void *)v38;
              if (!v38)
                goto LABEL_53;
            }

LABEL_53:
LABEL_54:
            v22 = (void *)v43;
            if (!v43)
              goto LABEL_56;
            goto LABEL_55;
          }

          v12 = v48;
          if (v49)
          {

          }
          v17 = v50;
        }

        if (v12)
        {

        }
        goto LABEL_32;
      }
    }
    v11 = 0;
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
  void *v14;
  unint64_t v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)RFSimpleItemStandardCardSection;
  v3 = -[SFCardSection hash](&v17, sel_hash);
  -[RFSimpleItemStandardCardSection text](self, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[RFSimpleItemStandardCardSection text](self, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");
  -[RFSimpleItemStandardCardSection text](self, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 ^ objc_msgSend(v8, "hash");
  -[RFSimpleItemStandardCardSection text](self, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9 ^ objc_msgSend(v10, "hash");
  -[RFSimpleItemStandardCardSection text](self, "text");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11 ^ objc_msgSend(v12, "hash") ^ v3;
  -[RFSimpleItemStandardCardSection text](self, "text");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v13 ^ objc_msgSend(v14, "hash");

  return v15;
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

- (NSArray)text_3
{
  return self->_text_3;
}

- (void)setText_3:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSArray)text_4
{
  return self->_text_4;
}

- (void)setText_4:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
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

- (void).cxx_destruct
{
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

- (RFSimpleItemStandardCardSection)initWithProtobuf:(id)a3
{
  id v4;
  RFSimpleItemStandardCardSection *v5;
  void *v6;
  RFTextProperty *v7;
  void *v8;
  RFTextProperty *v9;
  void *v10;
  RFTextProperty *v11;
  void *v12;
  RFTextProperty *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  RFTextProperty *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  RFTextProperty *v29;
  void *v30;
  RFTextProperty *v31;
  void *v32;
  RFTextProperty *v33;
  void *v34;
  RFTextProperty *v35;
  void *v36;
  RFTextProperty *v37;
  RFSimpleItemStandardCardSection *v38;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  objc_super v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v48.receiver = self;
  v48.super_class = (Class)RFSimpleItemStandardCardSection;
  v5 = -[SFCardSection init](&v48, sel_init);
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
      -[RFSimpleItemStandardCardSection setText_1:](v5, "setText_1:", v9);

    }
    objc_msgSend(v4, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [RFTextProperty alloc];
      objc_msgSend(v4, "text");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[RFTextProperty initWithProtobuf:](v11, "initWithProtobuf:", v12);
      -[RFSimpleItemStandardCardSection setText_2:](v5, "setText_2:", v13);

    }
    objc_msgSend(v4, "text_3s");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v15 = 0;

    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    objc_msgSend(v4, "text_3s");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v45 != v19)
            objc_enumerationMutation(v16);
          v21 = -[RFTextProperty initWithProtobuf:]([RFTextProperty alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i));
          if (v21)
            objc_msgSend(v15, "addObject:", v21);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
      }
      while (v18);
    }

    -[RFSimpleItemStandardCardSection setText_3:](v5, "setText_3:", v15);
    objc_msgSend(v4, "text_4s");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
      v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v23 = 0;

    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    objc_msgSend(v4, "text_4s", 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v41;
      do
      {
        for (j = 0; j != v26; ++j)
        {
          if (*(_QWORD *)v41 != v27)
            objc_enumerationMutation(v24);
          v29 = -[RFTextProperty initWithProtobuf:]([RFTextProperty alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * j));
          if (v29)
            objc_msgSend(v23, "addObject:", v29);

        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
      }
      while (v26);
    }

    -[RFSimpleItemStandardCardSection setText_4:](v5, "setText_4:", v23);
    objc_msgSend(v4, "text");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      v31 = [RFTextProperty alloc];
      objc_msgSend(v4, "text");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = -[RFTextProperty initWithProtobuf:](v31, "initWithProtobuf:", v32);
      -[RFSimpleItemStandardCardSection setText_5:](v5, "setText_5:", v33);

    }
    objc_msgSend(v4, "text");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      v35 = [RFTextProperty alloc];
      objc_msgSend(v4, "text");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = -[RFTextProperty initWithProtobuf:](v35, "initWithProtobuf:", v36);
      -[RFSimpleItemStandardCardSection setText_6:](v5, "setText_6:", v37);

    }
    v38 = v5;

  }
  return v5;
}

@end
