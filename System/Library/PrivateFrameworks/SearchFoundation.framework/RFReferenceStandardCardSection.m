@implementation RFReferenceStandardCardSection

- (RFReferenceStandardCardSection)initWithProtobuf:(id)a3
{
  id v4;
  RFReferenceStandardCardSection *v5;
  void *v6;
  RFTextProperty *v7;
  void *v8;
  RFTextProperty *v9;
  RFReferenceStandardCardSection *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RFReferenceStandardCardSection;
  v5 = -[SFCardSection init](&v12, sel_init);
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
      -[RFReferenceStandardCardSection setText_1:](v5, "setText_1:", v9);

    }
    if (objc_msgSend(v4, "addTint"))
      -[RFReferenceStandardCardSection setAddTint:](v5, "setAddTint:", objc_msgSend(v4, "addTint"));
    v10 = v5;
  }

  return v5;
}

- (void)setAddTint:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_addTint = a3;
}

- (BOOL)hasAddTint
{
  return *(_BYTE *)&self->_has & 1;
}

- (RFReferenceStandardCardSection)initWithCoder:(id)a3
{
  id v4;
  RFReferenceStandardCardSection *v5;
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
    -[RFReferenceStandardCardSection setText_1:](v5, "setText_1:", v9);

    -[RFReferenceStandardCardSection setAddTint:](v5, "setAddTint:", -[SFCardSection addTint](v8, "addTint"));
    -[SFCardSection nextCard](v8, "nextCard");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setNextCard:](v5, "setNextCard:", v10);

    -[SFCardSection commands](v8, "commands");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCommands:](v5, "setCommands:", v11);

    -[SFCardSection parameterKeyPaths](v8, "parameterKeyPaths");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setParameterKeyPaths:](v5, "setParameterKeyPaths:", v12);

    -[SFCardSection cardSectionId](v8, "cardSectionId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCardSectionId:](v5, "setCardSectionId:", v13);

    -[SFCardSection resultIdentifier](v8, "resultIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setResultIdentifier:](v5, "setResultIdentifier:", v14);

    -[SFCardSection userReportRequest](v8, "userReportRequest");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setUserReportRequest:](v5, "setUserReportRequest:", v15);

    -[SFCardSection command](v8, "command");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCommand:](v5, "setCommand:", v16);

    -[SFCardSection previewCommand](v8, "previewCommand");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewCommand:](v5, "setPreviewCommand:", v17);

    -[SFCardSection previewButtonItems](v8, "previewButtonItems");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewButtonItems:](v5, "setPreviewButtonItems:", v18);

    -[SFCardSection cardSectionDetail](v8, "cardSectionDetail");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCardSectionDetail:](v5, "setCardSectionDetail:", v19);

    -[SFCardSection previewButtonItemsTitle](v8, "previewButtonItemsTitle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewButtonItemsTitle:](v5, "setPreviewButtonItemsTitle:", v20);

    -[SFCardSection backgroundColor](v8, "backgroundColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setBackgroundColor:](v5, "setBackgroundColor:", v21);

    -[SFCardSection setShouldHideInAmbientMode:](v5, "setShouldHideInAmbientMode:", -[SFCardSection shouldHideInAmbientMode](v8, "shouldHideInAmbientMode"));
    -[SFCardSection leadingSwipeButtonItems](v8, "leadingSwipeButtonItems");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setLeadingSwipeButtonItems:](v5, "setLeadingSwipeButtonItems:", v22);

    -[SFCardSection trailingSwipeButtonItems](v8, "trailingSwipeButtonItems");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setTrailingSwipeButtonItems:](v5, "setTrailingSwipeButtonItems:", v23);

    -[SFCardSection punchoutOptions](v8, "punchoutOptions");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutOptions:](v5, "setPunchoutOptions:", v24);

    -[SFCardSection punchoutPickerTitle](v8, "punchoutPickerTitle");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerTitle:](v5, "setPunchoutPickerTitle:", v25);

    -[SFCardSection punchoutPickerDismissText](v8, "punchoutPickerDismissText");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerDismissText:](v5, "setPunchoutPickerDismissText:", v26);

    -[SFCardSection setCanBeHidden:](v5, "setCanBeHidden:", -[SFCardSection canBeHidden](v8, "canBeHidden"));
    -[SFCardSection setHasTopPadding:](v5, "setHasTopPadding:", -[SFCardSection hasTopPadding](v8, "hasTopPadding"));
    -[SFCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", -[SFCardSection hasBottomPadding](v8, "hasBottomPadding"));
    -[SFCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", -[SFCardSection separatorStyle](v8, "separatorStyle"));
    -[SFCardSection referencedCommands](v8, "referencedCommands");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setReferencedCommands:](v5, "setReferencedCommands:", v27);

    -[SFCardSection setForceEnable3DTouch:](v5, "setForceEnable3DTouch:", -[SFCardSection forceEnable3DTouch](v8, "forceEnable3DTouch"));
    -[SFCardSection setShouldShowInSmartDialog:](v5, "setShouldShowInSmartDialog:", -[SFCardSection shouldShowInSmartDialog](v8, "shouldShowInSmartDialog"));
    -[SFCardSection appEntityAnnotation](v8, "appEntityAnnotation");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setAppEntityAnnotation:](v5, "setAppEntityAnnotation:", v28);

    -[SFCardSection emphasisSubjectId](v8, "emphasisSubjectId");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setEmphasisSubjectId:](v5, "setEmphasisSubjectId:", v29);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RFReferenceStandardCardSection;
  -[SFCardSection encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBRFReferenceStandardCardSection *v2;
  void *v3;

  v2 = -[_SFPBRFReferenceStandardCardSection initWithFacade:]([_SFPBRFReferenceStandardCardSection alloc], "initWithFacade:", self);
  -[_SFPBRFReferenceStandardCardSection dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBRFReferenceStandardCardSection *v2;
  void *v3;

  v2 = -[_SFPBRFReferenceStandardCardSection initWithFacade:]([_SFPBRFReferenceStandardCardSection alloc], "initWithFacade:", self);
  -[_SFPBRFReferenceStandardCardSection jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RFReferenceStandardCardSection;
  v4 = -[SFCardSection copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[RFReferenceStandardCardSection text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setText_1:", v6);

  objc_msgSend(v4, "setAddTint:", -[RFReferenceStandardCardSection addTint](self, "addTint"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  RFReferenceStandardCardSection *v6;
  RFReferenceStandardCardSection *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  _BOOL4 v12;
  objc_super v14;

  v6 = (RFReferenceStandardCardSection *)a3;
  if (self == v6)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    if (-[RFReferenceStandardCardSection isMemberOfClass:](v6, "isMemberOfClass:", objc_opt_class()))
    {
      v14.receiver = self;
      v14.super_class = (Class)RFReferenceStandardCardSection;
      if (-[SFCardSection isEqual:](&v14, sel_isEqual_, v6))
      {
        v7 = v6;
        -[RFReferenceStandardCardSection text](self, "text");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFReferenceStandardCardSection text](v7, "text");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v8 == 0) == (v9 != 0))
        {
          LOBYTE(v11) = 0;
LABEL_14:

          goto LABEL_15;
        }
        -[RFReferenceStandardCardSection text](self, "text");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10
          || (-[RFReferenceStandardCardSection text](self, "text"),
              v3 = (void *)objc_claimAutoreleasedReturnValue(),
              -[RFReferenceStandardCardSection text](v7, "text"),
              v4 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v3, "isEqual:", v4)))
        {
          v12 = -[RFReferenceStandardCardSection addTint](self, "addTint");
          v11 = v12 ^ -[RFReferenceStandardCardSection addTint](v7, "addTint") ^ 1;
          if (!v10)
          {
LABEL_13:

            goto LABEL_14;
          }
        }
        else
        {
          LOBYTE(v11) = 0;
        }

        goto LABEL_13;
      }
    }
    LOBYTE(v11) = 0;
  }
LABEL_15:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RFReferenceStandardCardSection;
  v3 = -[SFCardSection hash](&v8, sel_hash);
  -[RFReferenceStandardCardSection text](self, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  v6 = v5 ^ -[RFReferenceStandardCardSection addTint](self, "addTint") ^ v3;

  return v6;
}

- (RFTextProperty)text_1
{
  return self->_text_1;
}

- (void)setText_1:(id)a3
{
  objc_storeStrong((id *)&self->_text_1, a3);
}

- (BOOL)addTint
{
  return self->_addTint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text_1, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
