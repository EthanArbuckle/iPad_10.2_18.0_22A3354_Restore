@implementation RFReferenceRichCardSection

- (void)setAddTint:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_addTint = a3;
}

- (BOOL)hasAddTint
{
  return *(_BYTE *)&self->_has & 1;
}

- (RFReferenceRichCardSection)initWithCoder:(id)a3
{
  id v4;
  RFReferenceRichCardSection *v5;
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
    -[RFReferenceRichCardSection setText_1:](v5, "setText_1:", v9);

    -[SFCardSection text](v8, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFReferenceRichCardSection setText_2:](v5, "setText_2:", v10);

    -[SFCardSection thumbnail](v8, "thumbnail");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFReferenceRichCardSection setThumbnail:](v5, "setThumbnail:", v11);

    -[RFReferenceRichCardSection setAddTint:](v5, "setAddTint:", -[SFCardSection addTint](v8, "addTint"));
    -[SFCardSection nextCard](v8, "nextCard");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setNextCard:](v5, "setNextCard:", v12);

    -[SFCardSection commands](v8, "commands");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCommands:](v5, "setCommands:", v13);

    -[SFCardSection parameterKeyPaths](v8, "parameterKeyPaths");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setParameterKeyPaths:](v5, "setParameterKeyPaths:", v14);

    -[SFCardSection cardSectionId](v8, "cardSectionId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCardSectionId:](v5, "setCardSectionId:", v15);

    -[SFCardSection resultIdentifier](v8, "resultIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setResultIdentifier:](v5, "setResultIdentifier:", v16);

    -[SFCardSection userReportRequest](v8, "userReportRequest");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setUserReportRequest:](v5, "setUserReportRequest:", v17);

    -[SFCardSection command](v8, "command");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCommand:](v5, "setCommand:", v18);

    -[SFCardSection previewCommand](v8, "previewCommand");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewCommand:](v5, "setPreviewCommand:", v19);

    -[SFCardSection previewButtonItems](v8, "previewButtonItems");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewButtonItems:](v5, "setPreviewButtonItems:", v20);

    -[SFCardSection cardSectionDetail](v8, "cardSectionDetail");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCardSectionDetail:](v5, "setCardSectionDetail:", v21);

    -[SFCardSection previewButtonItemsTitle](v8, "previewButtonItemsTitle");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewButtonItemsTitle:](v5, "setPreviewButtonItemsTitle:", v22);

    -[SFCardSection backgroundColor](v8, "backgroundColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setBackgroundColor:](v5, "setBackgroundColor:", v23);

    -[SFCardSection setShouldHideInAmbientMode:](v5, "setShouldHideInAmbientMode:", -[SFCardSection shouldHideInAmbientMode](v8, "shouldHideInAmbientMode"));
    -[SFCardSection leadingSwipeButtonItems](v8, "leadingSwipeButtonItems");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setLeadingSwipeButtonItems:](v5, "setLeadingSwipeButtonItems:", v24);

    -[SFCardSection trailingSwipeButtonItems](v8, "trailingSwipeButtonItems");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setTrailingSwipeButtonItems:](v5, "setTrailingSwipeButtonItems:", v25);

    -[SFCardSection punchoutOptions](v8, "punchoutOptions");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutOptions:](v5, "setPunchoutOptions:", v26);

    -[SFCardSection punchoutPickerTitle](v8, "punchoutPickerTitle");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerTitle:](v5, "setPunchoutPickerTitle:", v27);

    -[SFCardSection punchoutPickerDismissText](v8, "punchoutPickerDismissText");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerDismissText:](v5, "setPunchoutPickerDismissText:", v28);

    -[SFCardSection setCanBeHidden:](v5, "setCanBeHidden:", -[SFCardSection canBeHidden](v8, "canBeHidden"));
    -[SFCardSection setHasTopPadding:](v5, "setHasTopPadding:", -[SFCardSection hasTopPadding](v8, "hasTopPadding"));
    -[SFCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", -[SFCardSection hasBottomPadding](v8, "hasBottomPadding"));
    -[SFCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", -[SFCardSection separatorStyle](v8, "separatorStyle"));
    -[SFCardSection referencedCommands](v8, "referencedCommands");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setReferencedCommands:](v5, "setReferencedCommands:", v29);

    -[SFCardSection setForceEnable3DTouch:](v5, "setForceEnable3DTouch:", -[SFCardSection forceEnable3DTouch](v8, "forceEnable3DTouch"));
    -[SFCardSection setShouldShowInSmartDialog:](v5, "setShouldShowInSmartDialog:", -[SFCardSection shouldShowInSmartDialog](v8, "shouldShowInSmartDialog"));
    -[SFCardSection appEntityAnnotation](v8, "appEntityAnnotation");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setAppEntityAnnotation:](v5, "setAppEntityAnnotation:", v30);

    -[SFCardSection emphasisSubjectId](v8, "emphasisSubjectId");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setEmphasisSubjectId:](v5, "setEmphasisSubjectId:", v31);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RFReferenceRichCardSection;
  -[SFCardSection encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBRFReferenceRichCardSection *v2;
  void *v3;

  v2 = -[_SFPBRFReferenceRichCardSection initWithFacade:]([_SFPBRFReferenceRichCardSection alloc], "initWithFacade:", self);
  -[_SFPBRFReferenceRichCardSection dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBRFReferenceRichCardSection *v2;
  void *v3;

  v2 = -[_SFPBRFReferenceRichCardSection initWithFacade:]([_SFPBRFReferenceRichCardSection alloc], "initWithFacade:", self);
  -[_SFPBRFReferenceRichCardSection jsonData](v2, "jsonData");
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
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)RFReferenceRichCardSection;
  v4 = -[SFCardSection copyWithZone:](&v12, sel_copyWithZone_, a3);
  -[RFReferenceRichCardSection text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setText_1:", v6);

  -[RFReferenceRichCardSection text](self, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setText_2:", v8);

  -[RFReferenceRichCardSection thumbnail](self, "thumbnail");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setThumbnail:", v10);

  objc_msgSend(v4, "setAddTint:", -[RFReferenceRichCardSection addTint](self, "addTint"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  RFReferenceRichCardSection *v5;
  RFReferenceRichCardSection *v6;
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
  _BOOL4 v20;
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
  objc_super v33;

  v5 = (RFReferenceRichCardSection *)a3;
  if (self == v5)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    if (-[RFReferenceRichCardSection isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v33.receiver = self;
      v33.super_class = (Class)RFReferenceRichCardSection;
      if (-[SFCardSection isEqual:](&v33, sel_isEqual_, v5))
      {
        v6 = v5;
        -[RFReferenceRichCardSection text](self, "text");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFReferenceRichCardSection text](v6, "text");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v7 == 0) == (v8 != 0))
        {
          LOBYTE(v11) = 0;
LABEL_33:

          goto LABEL_34;
        }
        -[RFReferenceRichCardSection text](self, "text");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          -[RFReferenceRichCardSection text](self, "text");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[RFReferenceRichCardSection text](v6, "text");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v10, "isEqual:", v3))
          {
            LOBYTE(v11) = 0;
            goto LABEL_31;
          }
          v32 = v10;
        }
        -[RFReferenceRichCardSection text](self, "text");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFReferenceRichCardSection text](v6, "text");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if ((v12 == 0) == (v13 != 0))
        {

          LOBYTE(v11) = 0;
          goto LABEL_30;
        }
        -[RFReferenceRichCardSection text](self, "text");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v26 = v12;
          -[RFReferenceRichCardSection text](self, "text");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[RFReferenceRichCardSection text](v6, "text");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = v16;
          if (!objc_msgSend(v16, "isEqual:"))
          {
            LOBYTE(v11) = 0;
            v12 = v26;
            goto LABEL_28;
          }
          v28 = v3;
          v31 = v15;
          v12 = v26;
        }
        else
        {
          v28 = v3;
          v31 = 0;
        }
        -[RFReferenceRichCardSection thumbnail](self, "thumbnail");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFReferenceRichCardSection thumbnail](v6, "thumbnail");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v17 == 0) == (v18 != 0))
        {

          LOBYTE(v11) = 0;
          v15 = v31;
          v3 = v28;
          if (!v31)
            goto LABEL_29;
          goto LABEL_28;
        }
        v24 = v18;
        v25 = v17;
        -[RFReferenceRichCardSection thumbnail](self, "thumbnail");
        v15 = v31;
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v27
          || (-[RFReferenceRichCardSection thumbnail](self, "thumbnail"),
              v19 = (void *)objc_claimAutoreleasedReturnValue(),
              -[RFReferenceRichCardSection thumbnail](v6, "thumbnail"),
              v22 = (void *)objc_claimAutoreleasedReturnValue(),
              v23 = v19,
              objc_msgSend(v19, "isEqual:")))
        {
          v3 = v28;
          v20 = -[RFReferenceRichCardSection addTint](self, "addTint");
          v11 = v20 ^ -[RFReferenceRichCardSection addTint](v6, "addTint") ^ 1;
          if (!v27)
            goto LABEL_27;
        }
        else
        {
          LOBYTE(v11) = 0;
          v3 = v28;
        }

LABEL_27:
        if (!v31)
        {
LABEL_29:

LABEL_30:
          v10 = v32;
          if (!v9)
          {
LABEL_32:

            goto LABEL_33;
          }
LABEL_31:

          goto LABEL_32;
        }
LABEL_28:

        goto LABEL_29;
      }
    }
    LOBYTE(v11) = 0;
  }
LABEL_34:

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
  unint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)RFReferenceRichCardSection;
  v3 = -[SFCardSection hash](&v12, sel_hash);
  -[RFReferenceRichCardSection text](self, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[RFReferenceRichCardSection text](self, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");
  -[RFReferenceRichCardSection thumbnail](self, "thumbnail");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 ^ objc_msgSend(v8, "hash");
  v10 = v9 ^ -[RFReferenceRichCardSection addTint](self, "addTint") ^ v3;

  return v10;
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

- (RFVisualProperty)thumbnail
{
  return self->_thumbnail;
}

- (void)setThumbnail:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnail, a3);
}

- (BOOL)addTint
{
  return self->_addTint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_text_2, 0);
  objc_storeStrong((id *)&self->_text_1, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RFReferenceRichCardSection)initWithProtobuf:(id)a3
{
  id v4;
  RFReferenceRichCardSection *v5;
  void *v6;
  RFTextProperty *v7;
  void *v8;
  RFTextProperty *v9;
  void *v10;
  RFTextProperty *v11;
  void *v12;
  RFTextProperty *v13;
  void *v14;
  RFVisualProperty *v15;
  void *v16;
  RFVisualProperty *v17;
  RFReferenceRichCardSection *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)RFReferenceRichCardSection;
  v5 = -[SFCardSection init](&v20, sel_init);
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
      -[RFReferenceRichCardSection setText_1:](v5, "setText_1:", v9);

    }
    objc_msgSend(v4, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [RFTextProperty alloc];
      objc_msgSend(v4, "text");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[RFTextProperty initWithProtobuf:](v11, "initWithProtobuf:", v12);
      -[RFReferenceRichCardSection setText_2:](v5, "setText_2:", v13);

    }
    objc_msgSend(v4, "thumbnail");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = [RFVisualProperty alloc];
      objc_msgSend(v4, "thumbnail");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[RFVisualProperty initWithProtobuf:](v15, "initWithProtobuf:", v16);
      -[RFReferenceRichCardSection setThumbnail:](v5, "setThumbnail:", v17);

    }
    if (objc_msgSend(v4, "addTint"))
      -[RFReferenceRichCardSection setAddTint:](v5, "setAddTint:", objc_msgSend(v4, "addTint"));
    v18 = v5;
  }

  return v5;
}

@end
