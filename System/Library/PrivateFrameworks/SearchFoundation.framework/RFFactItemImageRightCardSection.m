@implementation RFFactItemImageRightCardSection

- (RFFactItemImageRightCardSection)initWithCoder:(id)a3
{
  id v4;
  RFFactItemImageRightCardSection *v5;
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
    -[SFCardSection number](v8, "number");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFFactItemImageRightCardSection setNumber:](v5, "setNumber:", v9);

    -[SFCardSection text](v8, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFFactItemImageRightCardSection setText_1:](v5, "setText_1:", v10);

    -[SFCardSection thumbnail](v8, "thumbnail");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFFactItemImageRightCardSection setThumbnail:](v5, "setThumbnail:", v11);

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
  v3.super_class = (Class)RFFactItemImageRightCardSection;
  -[SFCardSection encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBRFFactItemImageRightCardSection *v2;
  void *v3;

  v2 = -[_SFPBRFFactItemImageRightCardSection initWithFacade:]([_SFPBRFFactItemImageRightCardSection alloc], "initWithFacade:", self);
  -[_SFPBRFFactItemImageRightCardSection dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBRFFactItemImageRightCardSection *v2;
  void *v3;

  v2 = -[_SFPBRFFactItemImageRightCardSection initWithFacade:]([_SFPBRFFactItemImageRightCardSection alloc], "initWithFacade:", self);
  -[_SFPBRFFactItemImageRightCardSection jsonData](v2, "jsonData");
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
  v12.super_class = (Class)RFFactItemImageRightCardSection;
  v4 = -[SFCardSection copyWithZone:](&v12, sel_copyWithZone_, a3);
  -[RFFactItemImageRightCardSection number](self, "number");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setNumber:", v6);

  -[RFFactItemImageRightCardSection text](self, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setText_1:", v8);

  -[RFFactItemImageRightCardSection thumbnail](self, "thumbnail");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setThumbnail:", v10);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  RFFactItemImageRightCardSection *v5;
  RFFactItemImageRightCardSection *v6;
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
  uint64_t v19;
  void *v20;
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
  objc_super v32;

  v5 = (RFFactItemImageRightCardSection *)a3;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (-[RFFactItemImageRightCardSection isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v32.receiver = self;
      v32.super_class = (Class)RFFactItemImageRightCardSection;
      if (-[SFCardSection isEqual:](&v32, sel_isEqual_, v5))
      {
        v6 = v5;
        -[RFFactItemImageRightCardSection number](self, "number");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFFactItemImageRightCardSection number](v6, "number");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v7 == 0) == (v8 != 0))
        {
          v11 = 0;
LABEL_31:

          goto LABEL_32;
        }
        -[RFFactItemImageRightCardSection number](self, "number");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          -[RFFactItemImageRightCardSection number](self, "number");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          -[RFFactItemImageRightCardSection number](v6, "number");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v3, "isEqual:", v10))
          {
            v11 = 0;
            goto LABEL_29;
          }
          v31 = v10;
        }
        -[RFFactItemImageRightCardSection text](self, "text");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFFactItemImageRightCardSection text](v6, "text");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if ((v12 == 0) == (v13 != 0))
        {

          v11 = 0;
          goto LABEL_28;
        }
        -[RFFactItemImageRightCardSection text](self, "text");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v25 = v12;
          -[RFFactItemImageRightCardSection text](self, "text");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[RFFactItemImageRightCardSection text](v6, "text");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v16;
          if (!objc_msgSend(v16, "isEqual:"))
          {
            v11 = 0;
            v12 = v25;
            goto LABEL_26;
          }
          v29 = v15;
          v30 = v3;
          v12 = v25;
        }
        else
        {
          v29 = 0;
          v30 = v3;
        }
        -[RFFactItemImageRightCardSection thumbnail](self, "thumbnail");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFFactItemImageRightCardSection thumbnail](v6, "thumbnail");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v17 == 0) == (v18 != 0))
        {

          v11 = 0;
          v15 = v29;
          v3 = v30;
          if (!v29)
            goto LABEL_27;
        }
        else
        {
          v24 = v17;
          v26 = v18;
          -[RFFactItemImageRightCardSection thumbnail](self, "thumbnail");
          v19 = objc_claimAutoreleasedReturnValue();
          v15 = v29;
          if (v19)
          {
            v23 = (void *)v19;
            -[RFFactItemImageRightCardSection thumbnail](self, "thumbnail");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[RFFactItemImageRightCardSection thumbnail](v6, "thumbnail");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = objc_msgSend(v22, "isEqual:");

          }
          else
          {

            v11 = 1;
          }
          v3 = v30;
          if (!v29)
            goto LABEL_27;
        }
LABEL_26:

LABEL_27:
LABEL_28:
        v10 = v31;
        if (!v9)
        {
LABEL_30:

          goto LABEL_31;
        }
LABEL_29:

        goto LABEL_30;
      }
    }
    v11 = 0;
  }
LABEL_32:

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
  unint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)RFFactItemImageRightCardSection;
  v3 = -[SFCardSection hash](&v11, sel_hash);
  -[RFFactItemImageRightCardSection number](self, "number");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[RFFactItemImageRightCardSection text](self, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");
  -[RFFactItemImageRightCardSection thumbnail](self, "thumbnail");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 ^ objc_msgSend(v8, "hash") ^ v3;

  return v9;
}

- (RFTextProperty)number
{
  return self->_number;
}

- (void)setNumber:(id)a3
{
  objc_storeStrong((id *)&self->_number, a3);
}

- (RFTextProperty)text_1
{
  return self->_text_1;
}

- (void)setText_1:(id)a3
{
  objc_storeStrong((id *)&self->_text_1, a3);
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
  objc_storeStrong((id *)&self->_text_1, 0);
  objc_storeStrong((id *)&self->_number, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RFFactItemImageRightCardSection)initWithProtobuf:(id)a3
{
  id v4;
  RFFactItemImageRightCardSection *v5;
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
  RFFactItemImageRightCardSection *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)RFFactItemImageRightCardSection;
  v5 = -[SFCardSection init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "number");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [RFTextProperty alloc];
      objc_msgSend(v4, "number");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[RFTextProperty initWithProtobuf:](v7, "initWithProtobuf:", v8);
      -[RFFactItemImageRightCardSection setNumber:](v5, "setNumber:", v9);

    }
    objc_msgSend(v4, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [RFTextProperty alloc];
      objc_msgSend(v4, "text");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[RFTextProperty initWithProtobuf:](v11, "initWithProtobuf:", v12);
      -[RFFactItemImageRightCardSection setText_1:](v5, "setText_1:", v13);

    }
    objc_msgSend(v4, "thumbnail");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = [RFVisualProperty alloc];
      objc_msgSend(v4, "thumbnail");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[RFVisualProperty initWithProtobuf:](v15, "initWithProtobuf:", v16);
      -[RFFactItemImageRightCardSection setThumbnail:](v5, "setThumbnail:", v17);

    }
    v18 = v5;
  }

  return v5;
}

@end
