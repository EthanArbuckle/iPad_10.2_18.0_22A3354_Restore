@implementation RFReferenceCenteredCardSection

- (void)setAdd_tint:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_add_tint = a3;
}

- (BOOL)hasAdd_tint
{
  return *(_BYTE *)&self->_has & 1;
}

- (RFReferenceCenteredCardSection)initWithCoder:(id)a3
{
  id v4;
  RFReferenceCenteredCardSection *v5;
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
    -[RFReferenceCenteredCardSection setText_1:](v5, "setText_1:", v9);

    -[SFCardSection text](v8, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFReferenceCenteredCardSection setText_2:](v5, "setText_2:", v10);

    -[SFCardSection text](v8, "text");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFReferenceCenteredCardSection setText_3:](v5, "setText_3:", v11);

    -[SFCardSection text](v8, "text");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFReferenceCenteredCardSection setText_4:](v5, "setText_4:", v12);

    -[RFReferenceCenteredCardSection setAdd_tint:](v5, "setAdd_tint:", -[SFCardSection add_tint](v8, "add_tint"));
    -[SFCardSection nextCard](v8, "nextCard");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setNextCard:](v5, "setNextCard:", v13);

    -[SFCardSection commands](v8, "commands");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCommands:](v5, "setCommands:", v14);

    -[SFCardSection parameterKeyPaths](v8, "parameterKeyPaths");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setParameterKeyPaths:](v5, "setParameterKeyPaths:", v15);

    -[SFCardSection cardSectionId](v8, "cardSectionId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCardSectionId:](v5, "setCardSectionId:", v16);

    -[SFCardSection resultIdentifier](v8, "resultIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setResultIdentifier:](v5, "setResultIdentifier:", v17);

    -[SFCardSection userReportRequest](v8, "userReportRequest");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setUserReportRequest:](v5, "setUserReportRequest:", v18);

    -[SFCardSection command](v8, "command");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCommand:](v5, "setCommand:", v19);

    -[SFCardSection previewCommand](v8, "previewCommand");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewCommand:](v5, "setPreviewCommand:", v20);

    -[SFCardSection previewButtonItems](v8, "previewButtonItems");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewButtonItems:](v5, "setPreviewButtonItems:", v21);

    -[SFCardSection cardSectionDetail](v8, "cardSectionDetail");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCardSectionDetail:](v5, "setCardSectionDetail:", v22);

    -[SFCardSection previewButtonItemsTitle](v8, "previewButtonItemsTitle");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewButtonItemsTitle:](v5, "setPreviewButtonItemsTitle:", v23);

    -[SFCardSection backgroundColor](v8, "backgroundColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setBackgroundColor:](v5, "setBackgroundColor:", v24);

    -[SFCardSection setShouldHideInAmbientMode:](v5, "setShouldHideInAmbientMode:", -[SFCardSection shouldHideInAmbientMode](v8, "shouldHideInAmbientMode"));
    -[SFCardSection leadingSwipeButtonItems](v8, "leadingSwipeButtonItems");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setLeadingSwipeButtonItems:](v5, "setLeadingSwipeButtonItems:", v25);

    -[SFCardSection trailingSwipeButtonItems](v8, "trailingSwipeButtonItems");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setTrailingSwipeButtonItems:](v5, "setTrailingSwipeButtonItems:", v26);

    -[SFCardSection punchoutOptions](v8, "punchoutOptions");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutOptions:](v5, "setPunchoutOptions:", v27);

    -[SFCardSection punchoutPickerTitle](v8, "punchoutPickerTitle");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerTitle:](v5, "setPunchoutPickerTitle:", v28);

    -[SFCardSection punchoutPickerDismissText](v8, "punchoutPickerDismissText");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerDismissText:](v5, "setPunchoutPickerDismissText:", v29);

    -[SFCardSection setCanBeHidden:](v5, "setCanBeHidden:", -[SFCardSection canBeHidden](v8, "canBeHidden"));
    -[SFCardSection setHasTopPadding:](v5, "setHasTopPadding:", -[SFCardSection hasTopPadding](v8, "hasTopPadding"));
    -[SFCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", -[SFCardSection hasBottomPadding](v8, "hasBottomPadding"));
    -[SFCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", -[SFCardSection separatorStyle](v8, "separatorStyle"));
    -[SFCardSection referencedCommands](v8, "referencedCommands");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setReferencedCommands:](v5, "setReferencedCommands:", v30);

    -[SFCardSection setForceEnable3DTouch:](v5, "setForceEnable3DTouch:", -[SFCardSection forceEnable3DTouch](v8, "forceEnable3DTouch"));
    -[SFCardSection setShouldShowInSmartDialog:](v5, "setShouldShowInSmartDialog:", -[SFCardSection shouldShowInSmartDialog](v8, "shouldShowInSmartDialog"));
    -[SFCardSection appEntityAnnotation](v8, "appEntityAnnotation");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setAppEntityAnnotation:](v5, "setAppEntityAnnotation:", v31);

    -[SFCardSection emphasisSubjectId](v8, "emphasisSubjectId");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setEmphasisSubjectId:](v5, "setEmphasisSubjectId:", v32);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RFReferenceCenteredCardSection;
  -[SFCardSection encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBRFReferenceCenteredCardSection *v2;
  void *v3;

  v2 = -[_SFPBRFReferenceCenteredCardSection initWithFacade:]([_SFPBRFReferenceCenteredCardSection alloc], "initWithFacade:", self);
  -[_SFPBRFReferenceCenteredCardSection dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBRFReferenceCenteredCardSection *v2;
  void *v3;

  v2 = -[_SFPBRFReferenceCenteredCardSection initWithFacade:]([_SFPBRFReferenceCenteredCardSection alloc], "initWithFacade:", self);
  -[_SFPBRFReferenceCenteredCardSection jsonData](v2, "jsonData");
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
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)RFReferenceCenteredCardSection;
  v4 = -[SFCardSection copyWithZone:](&v14, sel_copyWithZone_, a3);
  -[RFReferenceCenteredCardSection text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setText_1:", v6);

  -[RFReferenceCenteredCardSection text](self, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setText_2:", v8);

  -[RFReferenceCenteredCardSection text](self, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setText_3:", v10);

  -[RFReferenceCenteredCardSection text](self, "text");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setText_4:", v12);

  objc_msgSend(v4, "setAdd_tint:", -[RFReferenceCenteredCardSection add_tint](self, "add_tint"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  RFReferenceCenteredCardSection *v4;
  RFReferenceCenteredCardSection *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
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
  _BOOL8 v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  _BOOL4 v27;
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
  objc_super v42;

  v4 = (RFReferenceCenteredCardSection *)a3;
  if (self == v4)
  {
    LOBYTE(v10) = 1;
  }
  else
  {
    if (-[RFReferenceCenteredCardSection isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
    {
      v42.receiver = self;
      v42.super_class = (Class)RFReferenceCenteredCardSection;
      if (-[SFCardSection isEqual:](&v42, sel_isEqual_, v4))
      {
        v5 = v4;
        -[RFReferenceCenteredCardSection text](self, "text");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFReferenceCenteredCardSection text](v5, "text");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v6 == 0) == (v7 != 0))
        {
          LOBYTE(v10) = 0;
LABEL_38:

          goto LABEL_39;
        }
        -[RFReferenceCenteredCardSection text](self, "text");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          -[RFReferenceCenteredCardSection text](self, "text");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[RFReferenceCenteredCardSection text](v5, "text");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v9, "isEqual:"))
          {
            LOBYTE(v10) = 0;
            goto LABEL_36;
          }
          v39 = v9;
        }
        -[RFReferenceCenteredCardSection text](self, "text");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFReferenceCenteredCardSection text](v5, "text");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v41 == 0) != (v11 != 0))
        {
          -[RFReferenceCenteredCardSection text](self, "text");
          v12 = objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            v13 = (void *)v12;
            -[RFReferenceCenteredCardSection text](self, "text");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[RFReferenceCenteredCardSection text](v5, "text");
            v36 = v14;
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend(v14, "isEqual:"))
            {
              LOBYTE(v10) = 0;
              v19 = v38;
              goto LABEL_33;
            }
            v37 = v13;
          }
          else
          {
            v37 = 0;
          }
          -[RFReferenceCenteredCardSection text](self, "text");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[RFReferenceCenteredCardSection text](v5, "text");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if ((v15 == 0) != (v16 != 0))
          {
            v34 = v15;
            v35 = v16;
            -[RFReferenceCenteredCardSection text](self, "text");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (v17)
            {
              -[RFReferenceCenteredCardSection text](self, "text");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              -[RFReferenceCenteredCardSection text](v5, "text");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = v18;
              if (!objc_msgSend(v18, "isEqual:"))
              {
                LOBYTE(v10) = 0;
                v13 = v37;
                v19 = v38;
                goto LABEL_31;
              }
            }
            -[RFReferenceCenteredCardSection text](self, "text");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = v20 == 0;
            -[RFReferenceCenteredCardSection text](v5, "text");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if (v21 == (v22 != 0))
            {

              LOBYTE(v10) = 0;
              v13 = v37;
              v19 = v38;
              if (!v17)
                goto LABEL_32;
              goto LABEL_31;
            }
            v29 = v22;
            v30 = v20;
            -[RFReferenceCenteredCardSection text](self, "text");
            v19 = v38;
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v31
              || (-[RFReferenceCenteredCardSection text](self, "text"),
                  v23 = objc_claimAutoreleasedReturnValue(),
                  -[RFReferenceCenteredCardSection text](v5, "text"),
                  v24 = objc_claimAutoreleasedReturnValue(),
                  v28 = (void *)v23,
                  v25 = (void *)v23,
                  v21 = v24,
                  objc_msgSend(v25, "isEqual:", v24)))
            {
              v27 = -[RFReferenceCenteredCardSection add_tint](self, "add_tint");
              v10 = v27 ^ -[RFReferenceCenteredCardSection add_tint](v5, "add_tint") ^ 1;
              if (!v31)
                goto LABEL_42;
            }
            else
            {
              LOBYTE(v10) = 0;
            }

LABEL_42:
            v13 = v37;
            if (!v17)
            {
LABEL_32:

              if (!v13)
              {
LABEL_34:

LABEL_35:
                v9 = v39;
                if (!v8)
                {
LABEL_37:

                  goto LABEL_38;
                }
LABEL_36:

                goto LABEL_37;
              }
LABEL_33:

              goto LABEL_34;
            }
LABEL_31:

            goto LABEL_32;
          }

          if (v37)
          {

          }
        }

        LOBYTE(v10) = 0;
        goto LABEL_35;
      }
    }
    LOBYTE(v10) = 0;
  }
LABEL_39:

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
  unint64_t v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)RFReferenceCenteredCardSection;
  v3 = -[SFCardSection hash](&v14, sel_hash);
  -[RFReferenceCenteredCardSection text](self, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[RFReferenceCenteredCardSection text](self, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");
  -[RFReferenceCenteredCardSection text](self, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 ^ objc_msgSend(v8, "hash");
  -[RFReferenceCenteredCardSection text](self, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9 ^ objc_msgSend(v10, "hash");
  v12 = v11 ^ -[RFReferenceCenteredCardSection add_tint](self, "add_tint") ^ v3;

  return v12;
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

- (BOOL)add_tint
{
  return self->_add_tint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text_4, 0);
  objc_storeStrong((id *)&self->_text_3, 0);
  objc_storeStrong((id *)&self->_text_2, 0);
  objc_storeStrong((id *)&self->_text_1, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RFReferenceCenteredCardSection)initWithProtobuf:(id)a3
{
  id v4;
  RFReferenceCenteredCardSection *v5;
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
  RFReferenceCenteredCardSection *v22;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)RFReferenceCenteredCardSection;
  v5 = -[SFCardSection init](&v24, sel_init);
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
      -[RFReferenceCenteredCardSection setText_1:](v5, "setText_1:", v9);

    }
    objc_msgSend(v4, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [RFTextProperty alloc];
      objc_msgSend(v4, "text");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[RFTextProperty initWithProtobuf:](v11, "initWithProtobuf:", v12);
      -[RFReferenceCenteredCardSection setText_2:](v5, "setText_2:", v13);

    }
    objc_msgSend(v4, "text");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = [RFTextProperty alloc];
      objc_msgSend(v4, "text");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[RFTextProperty initWithProtobuf:](v15, "initWithProtobuf:", v16);
      -[RFReferenceCenteredCardSection setText_3:](v5, "setText_3:", v17);

    }
    objc_msgSend(v4, "text");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v19 = [RFTextProperty alloc];
      objc_msgSend(v4, "text");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[RFTextProperty initWithProtobuf:](v19, "initWithProtobuf:", v20);
      -[RFReferenceCenteredCardSection setText_4:](v5, "setText_4:", v21);

    }
    if (objc_msgSend(v4, "add_tint"))
      -[RFReferenceCenteredCardSection setAdd_tint:](v5, "setAdd_tint:", objc_msgSend(v4, "add_tint"));
    v22 = v5;
  }

  return v5;
}

@end
